#!/bin/bash

process_name=".DontBlockMeHPC"

# Find and kill the process
DBMH=$(pgrep -f "$process_name")
num_active_logins=$(who | grep -c "^$USER ")

if [ $num_active_logins -eq 1 ]; then
   echo "No other active sessions by $USER. Terminating $process_name."
   kill $DBMH
else
   echo "Multiple active sessions by $USER. Keeping $process_name running."
fi
