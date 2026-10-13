# Chmod command and how it is used 

Challenge : Create a file that only you can read/write, but others can only read. Document the command. 

## Commands I used and what they do

 ```bash
vboxuser@Ubuntu ~/lab ❯ echo "Task 3 test file, owner can read/write and others can only read" > task-3.txt 
vboxuser@Ubuntu ~/lab ❯ ls   
 example.txt   input.txt  'my project'   mydirectory_copy   set_permissions.sh   task-3.txt
vboxuser@Ubuntu ~/lab ❯ ls -l
total 24
-rwx------ 1 vboxuser admin2    129 Oct 11 21:51  example.txt
-rw-rw-r-- 1 vboxuser vboxuser   20 Oct 12 19:25  input.txt
drwxrwxr-x 2 vboxuser vboxuser 4096 Oct 11 21:40 'my project'
drwxrwxr-x 3 newuser  admin2   4096 Oct 12 19:17  mydirectory_copy
-rwxrwx--- 1 vboxuser vboxuser  146 Oct 12 16:29  set_permissions.sh
-rw-rw-r-- 1 vboxuser vboxuser   64 Oct 13 11:20  task-3.txt # this has default rw for owner + user, r for others
vboxuser@Ubuntu ~/lab ❯ sudo chmod 000 task-3.txt # removed permissions to start with a blank slate
vboxuser@Ubuntu ~/lab ❯ ls -l           
total 24
-rwx------ 1 vboxuser admin2    129 Oct 11 21:51  example.txt
-rw-rw-r-- 1 vboxuser vboxuser   20 Oct 12 19:25  input.txt
drwxrwxr-x 2 vboxuser vboxuser 4096 Oct 11 21:40 'my project'
drwxrwxr-x 3 newuser  admin2   4096 Oct 12 19:17  mydirectory_copy
-rwxrwx--- 1 vboxuser vboxuser  146 Oct 12 16:29  set_permissions.sh
---------- 1 root     vboxuser   64 Oct 13 11:20  task-3.txt  # Now shows no permissions for anyone
vboxuser@Ubuntu ~/lab ❯ sudo chmod 644 task-3.txt  # I feel comfortable with numeric representation, 6 is rw, 4 is r
vboxuser@Ubuntu ~/lab ❯ ls -l           
total 24
-rwx------ 1 vboxuser admin2    129 Oct 11 21:51  example.txt
-rw-rw-r-- 1 vboxuser vboxuser   20 Oct 12 19:25  input.txt
drwxrwxr-x 2 vboxuser vboxuser 4096 Oct 11 21:40 'my project'
drwxrwxr-x 3 newuser  admin2   4096 Oct 12 19:17  mydirectory_copy
-rwxrwx--- 1 vboxuser vboxuser  146 Oct 12 16:29  set_permissions.sh
-rw-r--r-- 1 root     vboxuser   64 Oct 13 11:20  task-3.txt # now root can read write, groups and others can only read
vboxuser@Ubuntu ~/lab ❯ sudo chown vboxuser:vboxuser task-3.txt # change owner and group to vboxuser         
vboxuser@Ubuntu ~/lab ❯ ls -l
total 24
-rwx------ 1 vboxuser admin2    129 Oct 11 21:51  example.txt
-rw-rw-r-- 1 vboxuser vboxuser   20 Oct 12 19:25  input.txt
drwxrwxr-x 2 vboxuser vboxuser 4096 Oct 11 21:40 'my project'
drwxrwxr-x 3 newuser  admin2   4096 Oct 12 19:17  mydirectory_copy
-rwxrwx--- 1 vboxuser vboxuser  146 Oct 12 16:29  set_permissions.sh
-rw-r--r-- 1 vboxuser vboxuser   64 Oct 13 11:20  task-3.txt # now owner and group is vbox user, only owner can read/write, groups & others can only read
vboxuser@Ubuntu ~/lab ❯ 

```

## Notes
- Demonstrated my understanding of chmod and how to use it with numeric format, also demonstrated the use of chown

## Debugging

- Started getting the octal representation wrong at 1 point, mixed up chown and chmod 
