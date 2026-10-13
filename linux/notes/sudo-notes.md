# Practice with sudo commands

Will come back to these notes at a later date and explain what I've learnt 

## Commands I used and what they do

 ```bash
vboxuser@Ubuntu ~/lab ❯ sudo useradd newuser       
vboxuser@Ubuntu ~/lab ❯ sudo passwd newuser 
New password: 
BAD PASSWORD: The password is shorter than 8 characters
Retype new password: 
passwd: password updated successfully
vboxuser@Ubuntu ~/lab ❯ su - newuser       
Password: 
su: warning: cannot change directory to /home/newuser: No such file or directory
$ whoami
newuser
$ sudo apt-get update
sudo: I'm sorry newuser. I'm afraid I can't do that
$ exit
vboxuser@Ubuntu ~/lab ❯ sudo usermod -aG sudo newuser
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
Reading package lists... Done
$ sudo ls /root	
snap  vboxpostinstall.sh
$ ls root
ls: cannot access 'root': No such file or directory
$ exit
vboxuser@Ubuntu ~/lab ❯ sudo deluser newuser sudo       
vboxuser@Ubuntu ~/lab ❯ su - newuser             
Password: 
su: warning: cannot change directory to /home/newuser: No such file or directory
$ sudo apt-get update
sudo: I'm sorry newuser. I'm afraid I can't do that
$ 

```

## Notes

## Debugging


