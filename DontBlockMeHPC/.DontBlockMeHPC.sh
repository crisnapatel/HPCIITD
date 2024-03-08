#!/bin/bash


monitor_cpu_usage() {
    local threshold=50 # max cpu usage allowed
    local duration=10 # for t seconds
    local interval=1
    local user=$(whoami)

    while true; do
        mapfile -t pids < <(top -b -n 1 -u "$user" | awk -v threshold="$threshold" 'NR>7 && $9 >= threshold {print $1}')

        for pid in "${pids[@]}"; do
            # Check if the process has been running for more than the duration
            local start_time=$(ps -p "$pid" -o etimes= | tr -d ' ')
            echo "PID: $pid, Start time: $start_time seconds"
            if [ "$start_time" -ge "$duration" ]; then
                # Print the warning message
                #echo -e "\e[32mKilling PID $pid: CPU usage exceeded $threshold% for more than $duration seconds.\e[0m"
                kill "$pid"
            else
                echo "PID $pid has not exceeded the duration threshold of $duration seconds."
            fi
        done

        sleep "$interval"
    done
}


# As of 8 March 2024 HPC at IIT Delhi has four login nodes.
# Please edit if condition if changes are needed.
if [[ $(hostname) =~ login0[1-4] ]]; then
    #echo "Starting CPU usage monitor on login node."
     monitor_cpu_usage
else
    #echo "Not on a login node. Hurray!."
    exit 1
fi
