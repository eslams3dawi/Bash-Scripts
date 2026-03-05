#!/usr/bin/env bash
#Takes from user script name + target file
LOG_DIR="/var/log"
FOUND_FILE=""

#Loop through all files end with .log
for log_file in "$LOG_DIR"/*.log; do
        #-q (quiet) makes grep silent; we only focus on exit code
        if grep -q "FATAL_ERROR" $log_file; then
                echo "Error found in: $log_file."
                FOUND_FILE="$log_file"
                break
        fi
done

if [[ -n "$FOUND_FILE" ]]; then
        echo "First corrupted file is: $FOUND_FILE."
else
        echo "No corrupted files found."
fi
