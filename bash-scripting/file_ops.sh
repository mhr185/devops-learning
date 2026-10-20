#!/bin/bash

NOW=$( date ) 
DIRECTORY=~/bash_demo
FILE=$DIRECTORY/demo.txt
CONTENT="$(cat $FILE)"

if [ -d "$DIRECTORY" ]; then
	echo "ERROR: $DIRECTORY already exists."
	exit 1
else

	mkdir $DIRECTORY
	cd $DIRECTORY


	echo "This file was created by a Bash script on $NOW" > $FILE
	echo "Directory: 'bash_demo' created. File '$FILE' created."
	echo "File contents: $CONTENT"

fi
