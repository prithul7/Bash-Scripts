#! /bin/bash

log_file="NoOfExecution.txt"

if [ -f "$log_file" ]; then
	count=$(sed -n '1p' "$log_file")
	last_user=$(sed -n '2p' "$log_file")
	last_time=$(sed -n '3p' "$log_file")
else 
	count=0
	last_user="None"
	last_time="Never"
fi

echo "Previous runs: $count"
echo "Last user: $last_user"
echo "Last time: $last_time"

count=$((count + 1))
current_user=$(whoami)
current_time=$(date)

echo "$count" > "$log_file"
echo "$current_user" >> "$log_file"
echo "$current_time" >> "$log_file"

echo "This is run #$count by $current_user at $current_time"
