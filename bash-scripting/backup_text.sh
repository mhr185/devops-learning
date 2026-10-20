# Script that backs up all .txt files from one directory to another.


#!/bin/bash

set -ux

backup_text() {
	local NOW
	NOW=$( date +%Y-%m-%d_%H-%M )
	read -rp "Enter source directory: " SOURCE_DIR  # Reads inputs, -r disabled legacy behaviour with backslashes
	
	if [ -d "$SOURCE_DIR" ]; then
	mkdir "$SOURCE_DIR/backup_$NOW" || exit 1
	echo "Backup directory created: backup_$NOW"	
	else 
		echo "ERROR: '$SOURCE_DIR' does not exist."
		return 1
	fi
}

backup_text   
