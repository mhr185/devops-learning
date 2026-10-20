# Here you will find my scripts for the scripting challenges in my bash scripting module

## Challenge 1: Basic Arithmetic Calculator

Create a script that takes two numbers as input and performs basic arithmetic operations (addition, subtraction, multiplication, division).

**Requirements:**
-Prompt user for two numbers
-Perform all four operations
-Display the results
-Handle division by zero

**Example output:**

Enter first number: 10 Enter second number: 5

Results: 10 + 5 = 15 10 - 5 = 5 10 × 5 = 50 10 ÷ 5 = 2

## Challenge 2: File Operations Script

Create a script that automates directory and file creation.

**Requirements:**
-Create a directory called bash_demo
-Navigate into the directory
-Create a file called demo.txt
-Write text to the file (include current date)
-Display the file contents

**Example output:**

Directory 'bash_demo' created. File 'demo.txt' created.
File contents: This file was created by a Bash script on 2024-11-29

## Challenge 3: File Checker with Permissions

Create a script that checks if a file exists and displays its permissions.

**Requirements:**
- Prompt user for a filename
- Check if the file exists
- If it exists, check if it's readable, writable, and executable
- Display appropriate messages for each permission

**Example output:**

Enter filename to check: /etc/passwd
File '/etc/passwd' exists. ✓ File is readable ✓ File is writable ✗ File is not executable

## Challenge 4: Backup Script for Text Files

Create a script that backs up all .txt files from one directory to another.

**Requirements:**
- Prompt user for source directory
- Create a backup directory if it doesn't exist
- Copy all .txt files to the backup directory
- Add timestamp to backup directory name
- Display count of files backed up

**Example output:**
Enter source directory: /home/user/documents
Backup directory created: backup_2024-11-29_14-30 Copying .txt files...
Backup complete! Files backed up: 
