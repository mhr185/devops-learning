# Script that checks if a file exists and displays its permissions.


#!/bin/bash

set -u

file_check() {
	read -rp "Enter filename to check: " FILE_NAME
	
	if [ -e "$FILE_NAME" ]; then
		echo -n "File '$FILE_NAME' exists."
		
		if [ -r "$FILE_NAME" ]; then
			echo -n " ✓ File is readable"
		else
			echo -n " ✗ File is not readable"
		fi

		if [ -w "$FILE_NAME" ]; then
			echo -n " ✓ File is writable"
		else
			echo -n " ✗ File is not writable"
		fi

		if [ -x "$FILE_NAME" ]; then
			echo " ✓ File is executable"
		else
			echo " ✗ File is not executable"
	 	fi
 	else

		echo "'$FILE_NAME' does not exist."
		return 1
	fi
}

file_check
