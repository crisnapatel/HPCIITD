#!/bin/bash

LOCK_FILE="$HOME/CPU_monitor.lock"
NODE_FILE="$HOME/CPU_monitor.node"

# Get the current node
CURRENT_NODE=$(uname -n)

# Check if lock file exists
if [ -e "$LOCK_FILE" ]; then
    # Check if node file exists and contains a node name
    if [ -e "$NODE_FILE" ]; then
        SAVED_NODE=$(cat "$NODE_FILE")
        if [ "$CURRENT_NODE" = "$SAVED_NODE" ]; then
            echo "Script is already running on the same node ($SAVED_NODE). Exiting."
            exit 1
        fi
    fi

    # If lock file exists but node file does not, it may be an old lock file
    echo "Cleaning up old lock file: $LOCK_FILE"
    rm -f "$LOCK_FILE"
fi

# Create lock file and node file
echo "Creating lock file: $LOCK_FILE"
touch "$LOCK_FILE"
echo "$CURRENT_NODE" > "$NODE_FILE"

# Rest of your script...
# Start CPU usage monitor in a subshell
(
    # Start CPU usage monitor in the background
    source ~/.DontBlockMeHPC.sh &

    # Store the PID of the background process to kill later
    CPU_MONITOR_PID=$!
    cleanup() {
        echo "Terminating CPU usage monitor (PID: $CPU_MONITOR_PID)"
        kill $CPU_MONITOR_PID

        # Remove lock file and node file on cleanup
        echo "Removing lock file: $LOCK_FILE"
        rm -f "$LOCK_FILE"
        rm -f "$NODE_FILE"
    }

    trap cleanup EXIT

    wait $CPU_MONITOR_PID
) &

# Main script continues here...
# Add your main script logic below this line

# Example: Wait for user input before exiting
read -p "Press Enter to exit..."
