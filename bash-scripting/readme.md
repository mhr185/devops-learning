# Bash Scripting
 
Here you will find my scripts for the scripting challenges in my Bash scripting module.
 
## Challenge 1: Basic Arithmetic Calculator
 
Create a script that takes two numbers as input and performs basic arithmetic operations (addition, subtraction, multiplication, division).
 
**Requirements:**
- Prompt user for two numbers
- Perform all four operations
- Display the results
- Handle division by zero
**Example output:**
 
```
Enter first number: 10
Enter second number: 5
 
Results:
10 + 5 = 15
10 - 5 = 5
10 × 5 = 50
10 ÷ 5 = 2
```
 
## Challenge 2: File Operations Script
 
Create a script that automates directory and file creation.
 
**Requirements:**
- Create a directory called bash_demo
- Navigate into the directory
- Create a file called demo.txt
- Write text to the file (include current date)
- Display the file contents
**Example output:**
 
```
Directory 'bash_demo' created.
File 'demo.txt' created.
File contents:
This file was created by a Bash script on 2024-11-29
```
 
## Challenge 3: File Checker with Permissions
 
Create a script that checks if a file exists and displays its permissions.
 
**Requirements:**
- Prompt user for a filename
- Check if the file exists
- If it exists, check if it's readable, writable, and executable
- Display appropriate messages for each permission
**Example output:**
 
```
Enter filename to check: /etc/passwd
File '/etc/passwd' exists.
✓ File is readable ✓ File is writable ✗ File is not executable
```
 
## Challenge 4: Backup Script for Text Files
 
Create a script that backs up all .txt files from one directory to another.
 
**Requirements:**
- Prompt user for source directory
- Create a backup directory if it doesn't exist
- Copy all .txt files to the backup directory
- Add timestamp to backup directory name
- Display count of files backed up
**Example output:**
 
```
Enter source directory: /home/user/Documents
Backup directory created: backup_2024-11-29_14-30 Copying .txt files...
Backup complete! Files backed up: 3
```
 
---
 
## Key Learnings
 
1. **Quoting decides what Bash actually sees.** The outer quotes control the behaviour: single quotes inside double quotes are just literal characters, `~` doesn't expand inside quotes, and `$( )` starts a fresh quoting context. Quoting every variable (`"$SOURCE_DIR"`) stops paths with spaces from breaking.
2. **Debug with `set -u` and `bash -x`.** `set -u` makes the script fail on unset variables, which catches typos straight away. `bash -x` traces every command after expansion, so I can see exactly what a command received instead of guessing. I also learned not to name my own variables after shell ones like `PATH`.
3. **Handle failures instead of hoping.** `mkdir ... || exit 1` stops a script before it carries on in the wrong place, and `|| { echo "error"; return 1; }` lets me print a message and bail out in one go. Checking things in the right order (does the directory exist, are there any files) means the script never leaves half baked work behind, like empty backup folders.
4. **Functions need `local` and `return`.** Declaring variables with `local` keeps them from leaking into the rest of the script, and `return` hands an exit code back to the caller rather than `exit` killing the whole script.
5. **Small details matter.** The shebang only works on the very first line of the file. File test operators (`-e`, `-r`, `-w`, `-x`) can't be combined like `ls` flags, and each permission needs its own `if` rather than an `elif` chain, otherwise only the first match gets reported.
## Challenge I Overcame
 
In the backup script, `mkdir` kept failing even though the source directory definitely existed. My line looked like this:
 
```bash
mkdir "'$SOURCE_DIR'/backup_'$NOW'"
```
 
I assumed the variable was empty, but running the script with `bash -x` showed the real problem: because the single quotes were inside double quotes, they were treated as literal characters and became part of the path. `mkdir` was trying to create a folder starting with a `'` character inside a directory that didn't exist. Removing the inner quotes fixed it:
 
```bash
mkdir "$SOURCE_DIR/backup_$NOW"
```
 
The bigger lesson was to stop guessing and trace what the shell is actually doing.
 
## Why Bash Matters in DevOps
 
Bash matters in DevOps as you can create scripts to perform complex and/or tedious tasks repetitively. This can be useful in a variety of scenarios, like making system back up scripts, monitoring system usage, searching and creating logs etc. This is a tool that every DevOps engineer will need in their journey!
 
