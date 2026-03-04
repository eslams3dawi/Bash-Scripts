#!/usr/bin/env bash
#1. Define function
check_users_role() {
        #path entered must has users account such as '/home'
        local path="$1"
        #check if path is exits
        if [[ ! -d $path ]]; then
                echo "Error: path not found!"
                return 1
        elif [[ ! -r $path ]]; then
                echo "Error: path has no read permission!"
                return 2
        fi
        #check role for every user in that path
        for user_dir in "$path"/*; do
                [[ -d "$user_dir" ]] || continue

                user=$(basename "$user_dir")

                if id "$user" &>/dev/null; then
                        USER_ID=$( id -u $user)
                        if [[ "$USER_ID" -ne 0 ]]; then
                                echo "$user: is a user."
                        else
                                echo "$user: is an admin."
                        fi
                else
                       echo "$user: not a system account"
                fi
        done
}
#Call the function and capture the output
read -p "Enter path has users (/home): " input_path
check_users_role $input_path