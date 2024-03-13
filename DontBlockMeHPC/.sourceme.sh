#!/bin/bash

# Specify the process name
process_name=".DontBlockMeHPC"

# Specify the source file
source_file="$HOME/.DontBlockMeHPC.sh"

# Get the current hostname
current_hostname=$(hostname)

# Check if the hostname matches the allowed pattern
if [[ $current_hostname =~ ^(login(0[1-4])|klogin(0[1-4]))$ ]]; then
    # Check if .DontBlockMeHPC is already running for the current user
    if pgrep -x -u $USER "$process_name" > /dev/null; then
        echo "$process_name is already running on $current_hostname, skipping $source_file"
    else
            $source_file &
        echo "Executed $source_file on $current_hostname"
    fi
fi
