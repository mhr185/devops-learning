#!/bin/bash

# Script that backs up all .txt files from one directory to another.

set -u #x

backup_text() {
	local NOW
	local SOURCE_DIR
	local COUNT			# Set local variables needed
	NOW=$( date +%Y-%m-%d_%H-%M )	# Date + time format	
	read -rp "Enter source directory: " SOURCE_DIR  # Reads inputs, -r disables legacy behaviour with backslashes
	
	if [ -d "$SOURCE_DIR" ]; then
 		COUNT=$(find "$SOURCE_DIR" -maxdepth 1 -type f -name '*.txt' | wc -l) # checks if directory exists and counts .txt files 
		
		if [ "$COUNT" -gt 0 ]; then	# more than 1 txt
			mkdir "$SOURCE_DIR/backup_$NOW" || { echo "ERROR: Couldn't create backup directory"; return 1; }	# make directory with return message for failure
			echo "Backup directory created: backup_$NOW Copying .txt files..."
			cp "$SOURCE_DIR"/*.txt "$SOURCE_DIR/backup_$NOW" || { echo "ERROR: Couldn't copy files"; return 1; } 	# copy all text files to backup dir
			echo "Backup complete! Files backed up: $COUNT"	
		else							
			echo "No text files to copy"
		fi
	else
		echo "ERROR: '$SOURCE_DIR' does not exist."
		return 1
	fi
}

backup_text   
