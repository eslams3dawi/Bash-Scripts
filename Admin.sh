#!/usr/bin/env bash
#This script being running only be the admin
User_ID=$(id -u)
#If the user id is not root id, the script will be not executed
if [ "$User_ID" -ne 0]; then
        echo "Error: The script must be run as root."
        exit 1
fi
echo "Welcome Administrator!