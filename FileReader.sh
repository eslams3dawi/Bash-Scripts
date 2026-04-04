#!/usr/bin/env bash
read -p "Enter file location: " FILENAME

while IFS= read -r line; do
        echo "LINE: $line"
done < $FILENAME
