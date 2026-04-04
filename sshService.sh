#!/usr/bin/env bash
#$0 is the name of the script
#$1 is the first argument passed to the script
Action="$1"
if [[ -z "$Action" ]]; then
        echo "Error: No action provided."
        echo "Usage: $0 [start|stop|restart]"
        exit 1
fi
#Check on the value of the $1
case "$Action" in
        start)
                echo "Starting the service..."
                systemctl start sshd
                ;;
        stop)
                echo "Stoping the service..."
                systemctl stop sshd
                ;;
        restart)
                echo "Restarting the service..."
                systemctl restart sshd
                ;;
        *)
                echo "Error: Unkown action $Action"
                echo "Usage: $0 [start|stop|restart]"
        exit 1
        ;;
 esac
 	echo "Done."