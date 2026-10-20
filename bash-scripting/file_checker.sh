# Script that checks if a file exists and displays its permissions.


#!/bin/bash

set -u

file_check() {
	read -rp "Enter filename to check: " FILE_NAME  # Reads inputs, -r disabled legacy behaviour with backslashes
	
	if [ -e "$FILE_NAME" ]; then			# -e checks if file exists
		echo -n "File '$FILE_NAME' exists."
		
		if [ -r "$FILE_NAME" ]; then		# -r checks write permissions
			echo -n " ✓ File is readable"	# echo -n puts output on same line, used in all until last line
		else
			echo -n " ✗ File is not readable"
		fi

		if [ -w "$FILE_NAME" ]; then		# -w checks write permissions
			echo -n " ✓ File is writable"
		else
			echo -n " ✗ File is not writable"
		fi

		if [ -x "$FILE_NAME" ]; then		# -x checks execute permissions
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
