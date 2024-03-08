#!/bin/bash

monitor_cpu_usage() {
    local threshold=10 # max cpu usage allowed
    local duration=5 # for t seconds
    local interval=1
    local user=$(whoami)
    local user_tty=$(tty)

    while true; do
        # Get PIDs of processes with CPU usage > threshold
        mapfile -t pids < <(ps -eo pid,%cpu --sort=-%cpu | awk -v threshold="$threshold" '$2 > threshold {print $1}')

        for pid in "${pids[@]}"; do
            # Check if the process has been running for more than the duration
            local start_time=$(ps -p "$pid" -o etimes= | tr -d ' ')
            if [ "$start_time" -ge "$duration" ]; then
                # Print the warning message in green color
                echo -e "\e[32mKilling PID $pid: CPU usage exceeded $threshold% for more than $duration seconds.\e[0m" #| tee >(cat >$(tty))
                kill -- -"$pid"
            fi
        done

        sleep "$interval"
    done
}


# as of 8 March 2024 HPC at IIT Delhi has four login nodes.
# Please edit the if condition if changes needed.
if [[ $(hostname) =~ login0[1-4] ]]; then
    #echo "Starting CPU usage monitor on login node."
    monitor_cpu_usage
else
    #echo "Not on a login node. Hurray!."
    exit 1
fi
