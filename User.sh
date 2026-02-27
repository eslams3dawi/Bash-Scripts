#!/usr/bin/env bash
#This takes username as input and checks if is empty or not
while true; do
        read -p "Enter username: " username
        if [[ -n $username ]]; then
                break
        else
                echo "Name cannot be empty, please try again"
        fi
done
echo "Hello, $username"

#Then take user's age
read -p "Enter age: " age
if [[ $age -le 0 ]]; then
        echo "Error: Age cannot be zero or negaitve"
        exit 1
elif [[ $age -ge 18 ]]; then
        echo "You are welcome to sign in!"
else
        echo "Warning: You are denied to sign in!"
fi