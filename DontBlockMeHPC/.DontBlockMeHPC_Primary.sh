#!/bin/bash

# Start CPU usage monitor in a subshell
(
    # Start CPU usage monitor in the background
    source ~/.DontBlockMeHPC.sh &

    # Store the PID of the background process to kill later
    CPU_MONITOR_PID=$!
    cleanup() {
        echo "Terminating CPU usage monitor (PID: $CPU_MONITOR_PID)"
        kill $CPU_MONITOR_PID
    }

    trap cleanup EXIT

    wait $CPU_MONITOR_PID
) &

# Example: Wait for user input before exiting
read -p "Press Enter to continue..."
