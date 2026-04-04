#!/usr/bin/env bash
#i.bak creates a backup file named sshd_config.bak
#-E enables extended REGEX support
#^#? means:
#	Match a possible '#' at the beginning of the line (optional comment)
#	Whether the line is commented or not, replace it
sed -i.bak -E 's/^#?Port 22/Port 2222/g' /etc/ssh/sshd_config
