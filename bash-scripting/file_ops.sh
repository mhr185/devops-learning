#!/bin/bash -u

# This script automates directory and file creation

# variables to be set so this can be edited to suit any file or directory specified

NOW=$( date +%Y-%m-%d ) 		# Stores the current date in YEAR-MONTH-DAY format
DIR_PATH=~/             		# Parent directory to create it in
DIR_NAME=bash_demo			# Stores the name of new dir to be created
FULL_PATH="$DIR_PATH$DIR_NAME"		# Combines previous two to make one full path to be used later
FILE=demo.txt 				# Stores the file to create


if [ -d "$FULL_PATH" ]; then				# Checks if directory already exists
	echo "ERROR: $FULL_PATH already exists."	
	exit 1						# Exits if directory exists
else

	mkdir "$FULL_PATH" || exit 1			# Creates Directory, exits if it fails
	cd "$FULL_PATH" || exit 1			# Changes to Directory, exits if it fails


	echo "This file was created by a Bash script on $NOW" > "$FILE"		# Creates set file with message	
	echo "Directory '$DIR_NAME' created. File '$FILE' created."		# Success messages of previous steps
	echo "File contents: $( cat "$FILE" )"					# Displays content of created file 

fi
