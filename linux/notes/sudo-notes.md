# Practice with sudo commands

Will come back to these notes at a later date and explain what I've learnt 

## Commands I used and what they do

 ```bash
vboxuser@Ubuntu ~/lab ❯ sudo useradd newuser # add a new user named newuser      
vboxuser@Ubuntu ~/lab ❯ sudo passwd newuser  # set password for newuser
New password: 
BAD PASSWORD: The password is shorter than 8 characters
Retype new password: 
passwd: password updated successfully
vboxuser@Ubuntu ~/lab ❯ su - newuser  # switch to newuser     
Password: # enter new users password
su: warning: cannot change directory to /home/newuser: No such file or directory
$ whoami # print current user
newuser
$ sudo apt-get update
sudo: I'm sorry newuser. I'm afraid I can't do that # newuser cannot use sudo as not a member of sudo group
$ exit # exit to main user terminal
vboxuser@Ubuntu ~/lab ❯ sudo usermod -aG sudo newuser  # add newuser to sudo group
[sudo: authenticate] Password:       
vboxuser@Ubuntu ~/lab ❯ su - newuser                 
Password: 
su: warning: cannot change directory to /home/newuser: No such file or directory
$ sudo apt-get update
[sudo: authenticate] Password:     
Hit:1 http://gb.archive.ubuntu.com/ubuntu resolute InRelease
Hit:2 http://gb.archive.ubuntu.com/ubuntu resolute-updates InRelease
Hit:3 http://gb.archive.ubuntu.com/ubuntu resolute-backports InRelease     
Hit:4 http://security.ubuntu.com/ubuntu resolute-security InRelease        
Reading package lists... Done                                            # newuser was able to use sudo now
$ sudo ls /root	
snap  vboxpostinstall.sh
$ ls root
ls: cannot access 'root': No such file or directory # showing without sudo we cannot look in root directory
$ exit
vboxuser@Ubuntu ~/lab ❯ sudo deluser newuser sudo # delete user from sudo group      
vboxuser@Ubuntu ~/lab ❯ su - newuser             
Password: 
su: warning: cannot change directory to /home/newuser: No such file or directory
$ sudo apt-get update
sudo: I'm sorry newuser. I'm afraid I can't do that  # confirms newuser removed from sudo group
$ 

```

## Notes

- Shows the power of sudo and some use cases
- Explored adding new users and setting passwords
- Explored sudo group membership cmds, such as adding or removing from groups
- Explored switching between users



