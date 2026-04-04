#!/usr/bin/env bash
#Define associative array
declare -A error_counts 
#Define the log file
LOG_FILE="app.log"
#Check if the file is not exists
if [[ ! -f "$LOG_FILE" ]]; then
	echo "Error: Log file $LOG_FILE not found"
	exit 1
fi
#Read log file line by line
#We use awk with ":" to extract the fist field (e.g., ERROR, INFO, ...)
while IFS= read -r line; do
	#Exract the part which is before first colon"
	log_type=$(echo "$line" | awk -F: '{print $1}')
	#Skip empty lines or where log_type is empty
	if [[ -z "$log_type" ]]; then
		continue;
	fi
	#Increment counter for this log type
	#If the key doesn't exist, bash treats its value as 0"
	error_counts["$log_type"]=$(( ${error_counts["$log_type"]} + 1 ))
done < "$LOG_FILE"
#Print log analysis
echo "---Log Analysis Report---"
for type in "${!error_counts[@]}"; do
	echo "Type: $type -- Counts: ${error_counts[$type]}"
done







