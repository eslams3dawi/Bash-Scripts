#!/usr/bin/env bash
#1. Get all lines contain "Failed password using grep"
#2. Use gerp again with REGEX to extract only the IP address
#	([0-9]{1,3}\.){3}[0-9]{1,3} means:
#	{1,3} A number with 1 or 2 or 3 digits
#	[0-9] Each digit may be 0 - 9
#	\. followed by dot
#	( ){3} means repeat this scope 3 times
#  	[0-9]{3} means this only one number with 1-3 digits each digit may be 0 - 9
#Example: 192.168.1.1

grep "Failed password" /var/log/auth.log | grep -o -E "([0-9]{1,3}\.){3}[0-9]{1,3}"
