#!/usr/bin/env bash

FILENAME="servers.txt"
while IFS= read -r line; do
        #Skip empty lines
        if [[ -z $line ]]; then
                continue
        fi

        #Skip commented lines
        if [[ $line == \#* ]]; then
                echo "Skipping comment: $line"
                continue
        fi

        #If we reach this point, it's a valid server entry
        echo "Pinging server: $line"
        ping -c 1 $line

        echo "----------------------------"
done < "$FILENAME"