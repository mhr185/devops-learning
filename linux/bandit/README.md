# Bandit OverTheWire games answers & notes



## Bandit Level 0 ---> Level 1 answer
Level Goal

The password for the next level is stored in a file called readme located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game.

**Solution:**
 ```bash

bandit0@bandit:~$ ls
readme
bandit0@bandit:~$ cat readme 
Congratulations on your first steps into the bandit game!!
Please make sure you have read the rules at https://overthewire.org/rules/
If you are following a course, workshop, walkthrough or other educational activity,
please inform the instructor about the rules as well and encourage them to
contribute to the OverTheWire community so we can keep these games free!

The password you are looking for is: 6y2kwnwK6grgvwvpvLaa2T1cpFEKOhNR

```
**Explanation:**

**Password:**[6y2kwnwK6grgvwvpvLaa2T1cpFEKOhNR]
**What I learned:**

## Bandit Level 1 ---> Level 2
Level Goal

The password for the next level is stored in a file called - located in the home directory

**Solution:**
```bash
bandit1@bandit:~$ cat ~/-
PK8fYLZg2hnHSz83plBL1iEPKdD3QToB
bandit1@bandit:~$ 
```
**Explanation:**

**Password:**[PK8fYLZg2hnHSz83plBL1iEPKdD3QToB]
**What I learned:**

## Level 2 ----> Level 3
Level Goal

The password for the next level is stored in a file called --spaces in this filename-- located in the home directory

**Solution:**
```bash
bandit2@bandit:~$ ls -la
total 24
-rw-r-----   1 bandit3 bandit2   33 Sep 26 21:53 --spaces in this filename--
drwxr-xr-x   2 root    root    4096 Sep 26 21:53 .
drwxr-xr-x 150 root    root    4096 Sep 26 21:56 ..
-rw-r--r--   1 root    root     220 Feb 13  2026 .bash_logout
-rw-r--r--   1 root    root    3851 Sep 26 21:38 .bashrc
-rw-r--r--   1 root    root     807 Feb 13  2026 .profile
bandit2@bandit:~$ cat ~/--spaces\ in\ this\ filename-- 
7ZZ2LFrykP2zEyvBl4m3clcL7tGYJPME

```
**Explanation:**

**Password:**[7ZZ2LFrykP2zEyvBl4m3clcL7tGYJPME]

**What I learned:**
## Level 3 ---> Level 4
Level Goal

The password for the next level is stored in a hidden file in the inhere directory.

**Solution:**
```bash
bandit3@bandit:~/inhere$ ls -la
total 12
drwxr-xr-x 2 root    root    4096 Sep 26 21:53 .
drwxr-xr-x 3 root    root    4096 Sep 26 21:53 ..
-rw-r----- 1 bandit4 bandit3   33 Sep 26 21:53 ...Hiding-From-You
bandit3@bandit:~/inhere$ cat ...Hiding-From-You 
xzTXq1rDJQVVAzdv5cHq1TQytTWufAMq
```
**Explanation:**

**Password:**[xzTXq1rDJQVVAzdv5cHq1TQytTWufAMq]

**What I learned:**
## Level 4 ---> Level 5
Level Goal

The password for the next level is stored in the only human-readable file in the inhere directory. Tip: if your terminal is messed up, try the “reset” command.
**Solution:**
```bash
bandit4@bandit:~/inhere$ cat ~/inhere/-file07
6C7h9GD8M6ai5nr7wo1RonrzFjj9yIrG
bandit4@bandit:~/inhere$ 
```
**Explanation:**
- `find . -type f -size 1033c` searches for files exactly 1033 bytes
- `! -executable` excludes executable files
- `-exec file {} \;` runs `file` command on each result
- `grep text` filters for human-readable files

**Password:**[6C7h9GD8M6ai5nr7wo1RonrzFjj9yIrG]
**What I learned:** 
## Level 5 ---> Level 6

**Challenge:** Find a file with these properties:
- Human-readable
- 1033 bytes in size
- Not executable

**Solution:**
```bash

bandit5@bandit:~/inhere$ du -a -b | grep 1033 # figured out the easier way by using grep
1033	./maybehere07/.file2
bandit5@bandit:~/inhere$ 

```
**Explanation:**
- `find . -type f -size 1033c` searches for files exactly 1033 bytes
- `! -executable` excludes executable files
- `-exec file {} \;` runs `file` command on each result
- `grep text` filters for human-readable files

**Password:** [password here]

**What I learned:**

## Level 6 ---> Level 7

Level Goal

The password for the next level is stored somewhere on the server and has all of the following properties:

    owned by user bandit7
    owned by group bandit6
    33 bytes in size

**Solution**


```bash
bandit6@bandit:/$ find -size 33c -user bandit7 -group bandit6 -type f # the type -f option got me to solve it after trying a few times
find: ‘./root’: Permission denied
find: ‘./boot/efi’: Permission denied
find: ‘./boot/lost+found’: Permission denied
find: ‘./etc/stunnel’: Permission denied
find: ‘./etc/ssl/private’: Permission denied
find: ‘./etc/sudoers.d’: Permission denied
find: ‘./etc/polkit-1/rules.d’: Permission denied
find: ‘./etc/multipath’: Permission denied
find: ‘./etc/xinetd.d’: Permission denied
find: ‘./etc/credstore.encrypted’: Permission denied
find: ‘./etc/credstore’: Permission denied
find: ‘./home/bandit5/inhere’: Permission denied
find: ‘./home/drifter8/chroot’: Permission denied
find: ‘./home/leviathan0/.backup’: Permission denied
find: ‘./home/ubuntu’: Permission denied
find: ‘./home/leviathan4/.trash’: Permission denied
find: ‘./home/bandit31-git’: Permission denied
find: ‘./home/drifter6/data’: Permission denied
find: ‘./home/bandit27-git’: Permission denied
find: ‘./home/bandit29-git’: Permission denied
find: ‘./home/bandit30-git’: Permission denied
find: ‘./home/bandit28-git’: Permission denied
find: ‘./snap’: Permission denied
find: ‘./lost+found’: Permission denied
find: ‘./proc/tty/driver’: Permission denied
find: ‘./proc/1/task/1/fd’: Permission denied
find: ‘./proc/1/task/1/fdinfo’: Permission denied
find: ‘./proc/1/task/1/ns’: Permission denied
find: ‘./proc/1/fd’: Permission denied
find: ‘./proc/1/map_files’: Permission denied
find: ‘./proc/1/fdinfo’: Permission denied
find: ‘./proc/1/ns’: Permission denied
find: ‘./proc/2/task/2/fd’: Permission denied
find: ‘./proc/2/task/2/fdinfo’: Permission denied
find: ‘./proc/2/task/2/ns’: Permission denied
find: ‘./proc/2/fd’: Permission denied
find: ‘./proc/2/map_files’: Permission denied
find: ‘./proc/2/fdinfo’: Permission denied
find: ‘./proc/2/ns’: Permission denied
find: ‘./proc/120/task/120/fd/6’: No such file or directory
find: ‘./proc/120/task/120/fdinfo/6’: No such file or directory
find: ‘./proc/120/fd/5’: No such file or directory
find: ‘./proc/120/fdinfo/5’: No such file or directory
find: ‘./drifter/drifter14_src/axTLS’: Permission denied
find: ‘./tmp’: Permission denied
find: ‘./sys/kernel/tracing’: Permission denied
find: ‘./sys/kernel/debug’: Permission denied
find: ‘./sys/fs/pstore’: Permission denied
find: ‘./sys/fs/bpf’: Permission denied
find: ‘./dev/mqueue’: Permission denied
find: ‘./dev/shm’: Permission denied
find: ‘./manpage/manpage3-pw’: Permission denied
find: ‘./run/pam_pidns’: Permission denied
find: ‘./run/udisks2’: Permission denied
find: ‘./run/chrony’: Permission denied
find: ‘./run/user/11010’: Permission denied
find: ‘./run/user/11023’: Permission denied
find: ‘./run/user/11019’: Permission denied
find: ‘./run/user/11015’: Permission denied
find: ‘./run/user/11003’: Permission denied
find: ‘./run/user/8001’: Permission denied
find: ‘./run/user/16002’: Permission denied
find: ‘./run/user/11022’: Permission denied
find: ‘./run/user/11008’: Permission denied
find: ‘./run/user/11007’: Permission denied
find: ‘./run/user/11014’: Permission denied
find: ‘./run/user/11009’: Permission denied
find: ‘./run/user/11024’: Permission denied
find: ‘./run/user/11006/systemd/inaccessible/dir’: Permission denied
find: ‘./run/user/11002’: Permission denied
find: ‘./run/user/11001’: Permission denied
find: ‘./run/user/11004’: Permission denied
find: ‘./run/user/11013’: Permission denied
find: ‘./run/user/11000’: Permission denied
find: ‘./run/user/11005’: Permission denied
find: ‘./run/user/11012’: Permission denied
find: ‘./run/user/16001’: Permission denied
find: ‘./run/user/11011’: Permission denied
find: ‘./run/sudo’: Permission denied
find: ‘./run/screen/S-bandit19’: Permission denied
find: ‘./run/screen/S-bandit21’: Permission denied
find: ‘./run/screen/S-bandit0’: Permission denied
find: ‘./run/screen/S-bandit3’: Permission denied
find: ‘./run/screen/S-bandit2’: Permission denied
find: ‘./run/screen/S-bandit23’: Permission denied
find: ‘./run/screen/S-bandit25’: Permission denied
find: ‘./run/screen/S-bandit24’: Permission denied
find: ‘./run/screen/S-bandit15’: Permission denied
find: ‘./run/screen/S-leviathan5’: Permission denied
find: ‘./run/screen/S-bandit20’: Permission denied
find: ‘./run/multipath’: Permission denied
find: ‘./run/cryptsetup’: Permission denied
find: ‘./run/lock/lvm’: Permission denied
find: ‘./run/lvm’: Permission denied
find: ‘./run/cloud-init/share’: Permission denied
find: ‘./run/credentials/getty@tty1.service’: Permission denied
find: ‘./run/credentials/serial-getty@ttyS0.service’: Permission denied
find: ‘./run/credentials/systemd-networkd.service’: Permission denied
find: ‘./run/credentials/systemd-resolved.service’: Permission denied
find: ‘./run/credentials/systemd-journald.service’: Permission denied
find: ‘./run/systemd/ask-password-block’: Permission denied
find: ‘./run/systemd/inaccessible/dir’: Permission denied
find: ‘./var/spool/cron/crontabs’: Permission denied
find: ‘./var/spool/bandit24’: Permission denied
find: ‘./var/spool/rsyslog’: Permission denied
find: ‘./var/tmp’: Permission denied
find: ‘./var/log’: Permission denied
find: ‘./var/cache/apt/archives/partial’: Permission denied
find: ‘./var/cache/private’: Permission denied
find: ‘./var/cache/apparmor/f6da0254.0’: Permission denied
find: ‘./var/cache/apparmor/147ee081.0’: Permission denied
find: ‘./var/cache/ldconfig’: Permission denied
find: ‘./var/crash’: Permission denied
find: ‘./var/lib/udisks2’: Permission denied
find: ‘./var/lib/update-notifier/package-data-downloads/partial’: Permission denied
find: ‘./var/lib/amazon’: Permission denied
find: ‘./var/lib/apt/lists/partial’: Permission denied
find: ‘./var/lib/ubuntu-advantage/apt-esm/var/lib/apt/lists/partial’: Permission denied
find: ‘./var/lib/private’: Permission denied
find: ‘./var/lib/snapd/cookie’: Permission denied
find: ‘./var/lib/snapd/void’: Permission denied
find: ‘./var/lib/chrony’: Permission denied
./var/lib/dpkg/info/bandit7.password
bandit6@bandit:/$ cat ./var/lib/dpkg/info/bandit7.password
Bmnnvf82KzQlfxgAI2d1zYbr1u9pr3E3

```
**Explanation:**

**Password:** [Bmnnvf82KzQlfxgAI2d1zYbr1u9pr3E3]
**What I learned:**

## Level 7 → Level 8
Level Goal

The password for the next level is stored in the file data.txt next to the word millionth

**Solution**
```bash
bandit7@bandit:~$ cat data.txt | grep millionth 
millionth	VR1ljMayciFxbnUokuQmJFw6QC9VKtub
bandit7@bandit:~$ exit
```
**Explanation:**

**Password:** [VR1ljMayciFxbnUokuQmJFw6QC9VKtub]
**What I learned:**

## Bandit Level 8 → Level 9
Level Goal
The password for the next level is stored in the file data.txt and is the only line of text that occurs only once

**Solution**
```bash
bandit8@bandit:~$ sort data.txt | uniq -u

```
**Explanation:**

**Password:** [EjmOSvuAu7sGAHqHVcBDPirRe9T03kxl] 

**What I learned:**
- first i tried cat data.txt | sort | uniq -c
- I learnt to swap the -c for -u, as this will print lines that aren't repeated

## Bandit Level 9 → Level 10
Level Goal
The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.

**Solution:**
```bash
bandit9@bandit:~$ strings data.txt | grep -E '={3,}'
```

**Explanation:**

data.txt is mostly binary data. strings pulls out only the human-readable text, and grep -E '={3,}' keeps the lines that contain three or more = signs in a row.

**Password:** [B0s2khmbT9u0geKuOoVGW3JZKhndE3BG]

**What I learned:**

- First I tried grep '==========' data.txt -a. The -a flag makes grep treat a binary file as text, which found the password but printed lots of binary junk around it.
strings extracts the readable text from a binary file, so piping it into grep gives clean output without needing -a.
- Searching for a single = matched lots of random noise. Making the pattern stricter (== or more) filtered it down to just the lines I wanted. 
- With grep -E (extended regex), {3,} means “3 or more of the previous character”. Other quantifiers: {3} means exactly 3, + means 1 or more, * means 0 or more, and ? means 0 or 1.

## Bandit Level 10 → Level 11

Level Goal
The password for the next level is stored in the file data.txt, which contains base64 encoded data.

**Solution**

```bash
bandit10@bandit:~$ base64 -d data.txt
```
**Explanation:**

data.txt holds a single line of base64-encoded text. base64 -d decodes it back to plain text, which reveals the password.

**Password:** [pYfOY6HwUsDj5rL9UvyhU7MCmv8vN5Ro]

**What I learned:**

- First I used cat data.txt to look at the contents. It was a single string of letters, numbers, and = signs, which is typical of base64.
- base64 -d decodes base64 data, and base64 with no flag encodes it. It can read a file directly, so cat isn’t needed.
- The == at the end of base64 is padding. It fills the output to the right length and is a quick way to spot base64.
- Base64 is encoding, not encryption. Anyone can reverse it with no key, so it should never be used to hide secrets. It’s commonly used to send binary data through text-only systems, such as email attachments, data in    URLs, and Kubernetes secrets.

## Bandit Level 11 → Level 12

Level Goal
The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions.

**Solution**

```bash
bandit11@bandit:~$ cat data.txt | tr abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM
```

**Explanation:**

data.txt contains text encoded with ROT13, where every letter is shifted 13 places along the alphabet. tr swaps each character in the first set for the character in the same position in the second set, so a becomes n, b becomes o, and so on, wrapping round at z. Both the lowercase and uppercase alphabets are included so every letter gets rotated back. This reverses the encoding and reveals the password.

**Password:** [GROozWPO8QyN0mGrjUkID0WCYkZiQxrN]

**What I learned:**

- tr translates characters. It needs two sets, a "from" set and a "to" set, and it maps them position by position.
- tr doesn't take a filename. It only reads from standard input, so the file has to be piped in (cat data.txt | tr ...) or redirected (tr ... < data.txt).
- My first working attempt only rotated lowercase letters, so "Ghe" came out half decoded. Adding the uppercase alphabet to both sets fixed it.
- A cleaner way is to use ranges instead of typing out every letter: tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt. It does exactly the same job, and the redirect removes the need for cat.
- ROT13 is its own inverse. Running the same command again re-encodes the text, because rotating by 13 twice gets you back to the start (26 letters).

## Bandit Level 12 → Level 13

Level Goal
The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work. Use mkdir with a hard to guess directory name. Or better, use the command "mktemp -d". Then copy the datafile using cp, and rename it using mv (read the manpages!)

**Solution**

```bash
bandit12@bandit:~$ mktemp -d
bandit12@bandit:~$ cp --copy-contents data.txt /tmp/tmp.LP5uW9x79V/dat.txt
bandit12@bandit:~$ cd /tmp/tmp.LP5uW9x79V/
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ mv dat.txt data.txt
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ xxd -r data.txt > data1.txt
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ file data1.txt                # gzip
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ cp data1.txt data1.gz
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ gzip -d data1.gz
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ file data1                    # bzip2
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ cp data1 data2.bz2
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ bzip2 -d data2.bz2
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ file data2                    # gzip
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ cp data2 data4.gz
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ gzip -d data4.gz
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ file data4                    # tar
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ cp data4 data5.tar
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ tar -xvf data5.tar
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ file data5.bin                # tar
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ cp data5.bin data6.tar
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ tar -xvf data6.tar
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ file data6.bin                # bzip2
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ cp data6.bin data7.bz2
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ bzip2 -d data7.bz2
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ file data7                    # tar
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ cp data7 data8.tar
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ tar -xvf data8.tar
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ file data8.bin                # gzip
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ cp data8.bin data9.gz
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ gzip -d data9.gz
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ file data9                    # ASCII text
bandit12@bandit:/tmp/tmp.LP5uW9x79V$ cat data9
```

**Explanation:**

data.txt is a hexdump, so the first step is turning it back into the original binary with xxd -r. From there it's a loop: run file to find out what compression format the current file uses, give it the extension that format expects, then decompress it with the matching tool (gzip -d, bzip2 -d or tar -xvf). After eight layers of gzip, bzip2 and tar, file finally reports ASCII text, which contains the password.

**Password:** [qQYQiHOBPR8zR61qxYqX45quvihF2uzk]

**What I learned:**

- First I kept running hexdump -C on the file and saving the output to new files, which just made a hexdump of a hexdump and got bigger each time. data.txt was already a hexdump, so I needed to go backwards, not forwards.
- xxd -r reverses a hexdump back into the original binary file.
- file identifies a file's real type from its contents, regardless of its name or extension. It was the key to knowing which tool to use at each step.
- gzip -d insists on a .gz extension and refuses to decompress a file without one. That's why each file needed renaming before decompressing.
- bzip2 -d won't overwrite a file that already exists. I got stuck for a while because decompressing data1.bz2 tried to create data1, which was already there. Using a new name (data2.bz2) fixed it.
- bzip2 -z compresses rather than decompresses. I used it by mistake while trying to fix the overwrite problem.
- tar -xvf extracts an archive: x for extract, v for verbose (lists the files), f for the archive file. Unlike gzip and bzip2, tar archives can contain files with any name, like data5.bin, so I had to check the output to see what came out.
- cp data1 > data2.bz2 doesn't work. cp takes a source and a destination as arguments, not a redirect.
- mktemp -d creates a uniquely named temporary directory, which keeps the work separate and tidy. cp --copy-contents wasn't needed here; plain cp works.
- A cleaner way is to use mv instead of cp at each step, so files get renamed rather than copied and the directory doesn't fill up. For example: mv data1 data1.bz2 then bzip2 -d data1.bz2.

## Bandit Level 13 → Level 14

Level Goal
The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don't get the next password, but you get a private SSH key that can be used to log into the next level. Look at the commands that log you into previous levels, and find out how to use the key for this level.

**Solution**

```bash
bandit13@bandit:~$ cat sshkey.private
vboxuser@Ubuntu ~/.ssh ❯ vim bandit14
vboxuser@Ubuntu ~/.ssh ❯ sudo chmod 600 bandit14
vboxuser@Ubuntu ~/.ssh ❯ ssh -i bandit14 bandit14@bandit.labs.overthewire.org -p 2220
bandit14@bandit:~$ cat /etc/bandit_pass/bandit14
```

**Explanation:**

bandit13's home directory contains a private SSH key for bandit14. Logging in to bandit14 from inside the Bandit server is blocked, so I copied the key's contents into a file on my own Ubuntu VM. ssh refuses to use a private key that other users can read, so I locked the permissions down to 600 (read and write for the owner only). Then I logged in as bandit14 using ssh -i to point at the key. As bandit14, I could read /etc/bandit_pass/bandit14, which holds bandit14's password, needed for the next level.

**Password:** [aaWecNkG4FhxJQxz07uiwzVP6bJiYS65]

**What I learned:**

- First I tried to give myself access to the password file with sudo chown, sudo chmod and sudo usermod. None of these work because I'm not root and sudo isn't available. The level wants me to become bandit14, not change the file.
- I also tried scp on the Bandit server to send the password file to bandit14. That failed because I couldn't read the file as bandit13, and connections from the server back to itself are blocked.
- ssh -i lets you log in with a private key instead of a password.
- The first time you connect to a server, ssh shows its fingerprint and asks if you trust it. You have to type yes in full; pressing Enter counts as no and gives "Host key verification failed".
- "Could not create directory .ssh" and "Failed to add the host to the list of known hosts" are only warnings. They mean ssh couldn't save the server's fingerprint, but they don't stop the login.
- Bandit blocks ssh connections from localhost, so the key had to be used from my own machine.
- authorized_keys is for public keys allowed to log in to your machine. A private key for logging in somewhere else goes in its own file.
- ssh refuses to use a private key with loose permissions, such as rw-rw-r--. chmod 600 makes it readable only by me. I used sudo, but it wasn't needed because I own the file.
- Pasting a private key into the terminal with echo makes the shell try to run each line as a command, and it can end up in shell history. Opening a file in vim and pasting it there is safer.
- A cleaner way to get the key is scp, run from my own machine rather than the Bandit server: scp -P 2220 bandit13@bandit.labs.overthewire.org:sshkey.private . This logs in as bandit13 and copies the key into my current folder. scp uses a capital -P for the port, unlike ssh's lowercase -p.
- The password I found is bandit14's own password, not bandit15's. It lets me log in to bandit14 normally and is needed to solve the next level.

## Bandit Level 14 → Level 15

Level Goal
The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost.

**Solution**

```bash
bandit14@bandit:~$ nc localhost 30000
aaWecNkG4FhxJQxz07uiwzVP6bJiYS65
Correct!
```

**Explanation:**

A service is listening on port 30000 on the Bandit server. nc (netcat) opens a connection to it, and anything I type is sent straight to the service. When I sent bandit14's password, the service replied with "Correct!" and the password for bandit15.

**Password:** [pbLYuZtTg4MgaqfJx8jbA9gKKGqM68A7]

**What I learned:**

- First I tried putting the password into the nc command itself, as a flag (-aaWec...) and then as an argument before localhost. nc's format is nc [options] host port, so it treated the password as the host and localhost as the port, giving "port number invalid".
- nc connects to a host and port, then sends whatever I type over the connection. The data goes in after connecting, not in the command.
- -u switches nc to UDP. The service on port 30000 uses TCP, so nothing came back.
- -l makes nc listen for connections instead of making one. "Address already in use" meant the service was already listening on port 30000.
- -z checks whether a port is open without sending any data. It confirmed something was listening on 30000, which is useful for checking a service is up.
- -s sets the source address, so nc tried to look up the password as a hostname and failed with "Temporary failure in name resolution".
- eof isn't a command. To send end-of-file in a terminal, press Ctrl+D.
- A cleaner way is to pipe the password straight in without typing it: cat /etc/bandit_pass/bandit14 | nc localhost 30000. This is also how you'd send data to a service in a script.

## Bandit Level 15 → Level 16

Level Goal
The password for the next level can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL/TLS encryption.

**Solution**

```bash
bandit15@bandit:~$ openssl s_client -crlf -connect localhost:30001 -servername localhost
pbLYuZtTg4MgaqfJx8jbA9gKKGqM68A7
Correct!
```

**Explanation:**

The service on port 30001 only accepts encrypted connections, so nc from the previous level won't work. openssl s_client acts as a TLS client: it connects to the port, performs the TLS handshake, prints the server's certificate and session details, and then waits for input. Once the connection was set up, I sent bandit15's password, and the service replied with "Correct!" and the password for bandit16.

**Password:** [kS0Hf0u5HiXFwKMKFqXvPdOTNGGa0X8V]

**What I learned:**

- nc sends plain unencrypted text, so it can't talk to a service that expects SSL/TLS. openssl s_client is the tool for that, acting like an encrypted version of nc.
- -connect host:port sets where to connect. Unlike nc, the host and port are joined with a colon.
- -servername sends the hostname as part of the handshake (SNI). Servers that host several sites use it to choose the right certificate.
- -crlf sends Windows-style line endings (carriage return plus line feed) when pressing Enter. Some network services expect these.
- The output shows the certificate chain, TLS version (TLSv1.3) and cipher, which is useful for checking how a service is secured.
- "Verify return code: 18 (self-signed certificate)" means the certificate wasn't issued by a trusted authority. The server signed it itself (CN=SnakeOil). The connection is still encrypted, but in the real world a self-signed certificate on a public site is a warning sign.
- "read R BLOCK" means the connection is ready and waiting for input, so that's the point to type or paste the password.
- A cleaner way is to cut out the certificate output and pipe the password in: cat /etc/bandit_pass/bandit15 | openssl s_client -connect localhost:30001 -quiet. -quiet hides the session details and certificate, leaving just the reply.


## Bandit Level 16 → Level 17

Level Goal
The credentials for the next level can be retrieved by submitting the password of the current level to a port on localhost in the range 31000 to 32000. First find out which of these ports have a server listening on them. Then find out which of those speak SSL/TLS and which don't. There is only 1 server that will give the next credentials, the others will simply send back to you whatever you send to it.

**Solution**

```bash
bandit16@bandit:~$ nc -z localhost 31000-32000
bandit16@bandit:~$ openssl s_client -crlf -nocommands -connect localhost:31790
kS0Hf0u5HiXFwKMKFqXvPdOTNGGa0X8V
Correct!
vboxuser@Ubuntu ~/.ssh ❯ vim bandit16
vboxuser@Ubuntu ~/.ssh ❯ chmod 600 bandit16
vboxuser@Ubuntu ~/.ssh ❯ ssh -i bandit16 bandit17@bandit.labs.overthewire.org -p 2220
```

**Explanation:**

nc -z scanned ports 31000 to 32000 and found five with something listening: 31046, 31518, 31691, 31790 and 31960. Connecting to each with openssl s_client showed which ones spoke SSL/TLS. Three failed the handshake straight away, so they weren't using TLS. Of the two that worked, one just echoed back what I sent, and 31790 was the real service. Once I stopped openssl from treating my input as commands, sending bandit16's password returned an SSH private key for bandit17. I saved it on my VM, set its permissions to 600, and used it to log in as bandit17.

**Password:** [None. This level gives an SSH private key for bandit17 instead.]

**What I learned:**

- nc -z accepts a port range, such as 31000-32000, and lists every open port. It's a quick way to scan when you don't know where a service is.
- An SSL/TLS service shows a certificate when you connect with openssl s_client. A non-TLS service fails the handshake with errors like "unexpected message" and "no peer certificate available".
- My password kept coming back "Wrong!" with KEYUPDATE printed underneath. In interactive mode, openssl s_client treats some letters at the start of a line as commands. The password starts with k, which tells it to update the encryption keys, so the password was never sent properly.
- Wrapping the password in quotes didn't help, because the quotes got sent as part of the password.
- -nocommands turns off those single-letter commands so the line is sent as normal text. Options have to come before the address in the command; when I put -nocommands right after -connect, openssl treated it as the address.
- The reply was a private key rather than a password, so I used it the same way as in Level 13: save it to a file, chmod 600, then ssh -i.
- ssh refused the key at first with "WARNING: UNPROTECTED PRIVATE KEY FILE!" because new files are created with permissions 664. chmod 600 fixed it, this time without sudo.
- A cleaner way to find the right port is nmap, which can scan the range and identify the services in one go: nmap -sV -p 31000-32000 localhost. It labels which ports use SSL and which just echo.
- A cleaner way to send the password is to pipe it in with -quiet, which also stops the single-letter commands: cat /etc/bandit_pass/bandit16 | openssl s_client -connect localhost:31790 -quiet.

## Bandit Level 17 → Level 18

Level Goal
There are 2 files in the homedirectory: passwords.old and passwords.new. The password for the next level is in passwords.new and is the only line that has been changed between passwords.old and passwords.new.

**Solution**

```bash
bandit17@bandit:~$ diff passwords.new passwords.old
42c42
< OQxXZjELndr90zuhOTDYBEomI0SZITXI
---
> z7vPcsOPfFxnloUxixqYv4aWHUrx49K6
```

**Explanation:**

diff compares two files line by line and prints only the lines that differ. Line 42 is the only change. Lines starting with < come from the first file I gave diff (passwords.new) and lines starting with > come from the second (passwords.old). The password is in passwords.new, so it's the < line.

**Password:** [OQxXZjELndr90zuhOTDYBEomI0SZITXI]

**What I learned:**

- diff file1 file2 shows only the lines that differ between two files, which is much faster than reading both.
- In diff's output, < means the line is from the first file and > means it's from the second. Swapping the order of the files swaps the arrows, so it's important to check which file is which.
- 42c42 means line 42 was changed (c) in both files. diff also uses a for lines added and d for lines deleted.
- diff passwords.new passwords.old > cat doesn't send output to the cat command. > redirects output into a file, so it tried to create a file called cat in my home directory, which failed because home directories are read-only on Bandit. To pass output to a command, use a pipe (|) instead.
- A cleaner way that reads more naturally is to put the old file first, so > marks the new line: diff passwords.old passwords.new.
- Another way to print only the new line, with no diff markers, is grep -vxFf passwords.old passwords.new. This prints the lines in passwords.new that don't appear in passwords.old.
- Comparing files with diff is everyday work in DevOps, for example spotting what changed between two versions of a config file. Git uses the same idea to show changes in a commit.

## Bandit Level 18 → Level 19

Level Goal
The password for the next level is stored in a file readme in the homedirectory. Unfortunately, someone has modified .bashrc to log you out when you log in with SSH.

**Solution**

```bash
vboxuser@Ubuntu ~/.ssh ❯ scp -P 2220 bandit18@bandit.labs.overthewire.org:~/readme .
vboxuser@Ubuntu ~/.ssh ❯ cat readme
```

**Explanation:**

Logging in to bandit18 normally starts an interactive bash shell, which runs .bashrc. Someone has edited .bashrc to print "Byebye !" and log you out straight away. scp copies a file over the SSH connection without starting an interactive shell, so .bashrc never runs. I copied readme from bandit18's home directory to my VM and read it there.

**Password:** [KpsOfPkcP7i1FlIExk2QEjyt6dw8dxZI]

**What I learned:**

- .bashrc runs every time bash starts an interactive shell. If it contains a command that logs you out, you get kicked out as soon as you log in.
- ssh -v shows debug output. It proved my password was accepted ("Authenticated ... using password") and that the logout happened after login, so the problem was on the server, not my connection.
- scp doesn't start an interactive shell, so it gets around a broken .bashrc. In scp, ~ on the remote side of the colon refers to the remote user's home directory.
- I also tried ssh bandit18@bandit.labs.overthewire.org -p 2220 cat ~/readme. It failed because my local shell expanded ~ to /home/vboxuser before ssh ran, so the server looked for a file that doesn't exist there.
- A cleaner way is to give ssh a command to run instead of a shell: ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme. Anything after the host runs on the server as a one-off command, skipping .bashrc. The plain filename works because remote commands run from the home directory. Quoting also works: 'cat ~/readme'.
- Another way is to force a different shell: ssh -p 2220 -t bandit18@bandit.labs.overthewire.org /bin/sh. -t gives you a proper terminal, and sh doesn't read .bashrc.
- Running one-off commands over ssh, like ssh server "df -h", is a common way to check remote servers quickly or from scripts.

## Bandit Level 19 → Level 20

Level Goal
To gain access to the next level, you should use the setuid binary in the homedirectory. Execute it without arguments to find out how to use it. The password for this level can be found in the usual place (/etc/bandit_pass), after you have used the setuid binary.

**Solution**

```bash
bandit19@bandit:~$ ls -la
bandit19@bandit:~$ ./bandit20-do
bandit19@bandit:~$ ./bandit20-do whoami
bandit19@bandit:~$ ./bandit20-do cat /etc/bandit_pass/bandit20
```

**Explanation:**

bandit20-do is a setuid program owned by bandit20. A setuid program runs with the permissions of its owner rather than the person running it, so any command I pass to bandit20-do runs as bandit20. Running ./bandit20-do whoami confirmed this by printing bandit20. The password file for bandit20 can only be read by bandit20, so running cat through bandit20-do let me read it.

**Password:** [4pIjcunZ0fK2vmp3IwfG8Vf7VhxD6pOA]

**What I learned:**

- setuid isn't a command. It's a special permission on a file. My first attempt was to type setuid, which just gave "command not found".
- In ls -la, setuid shows up as an s where the owner's x would normally be: rwsr-x---.
- A setuid program runs as the file's owner, not as me. bandit20-do is owned by bandit20, so commands run through it act as bandit20.
- The group permissions (r-x for bandit19) mean only users in the bandit19 group can run it. Everyone else gets no access.
- Running a program without arguments is a good first step, because many programs print their usage instructions.
- whoami prints which user you're running as. It's a safe way to test what a setuid program actually does before using it for anything else.
- ./bandit20-do whoami | cat /etc/bandit_pass/bandit20 didn't work. The pipe only sends whoami's output to cat, but cat itself still runs as me (bandit19), so it couldn't read the file. The cat command has to be passed to bandit20-do so that it runs as bandit20.
- ./ is needed to run a program in the current directory, because the shell only searches the folders listed in PATH for commands.
- Real tools like sudo and passwd use setuid, so they can do things normal users can't. That's also why setuid programs are a common security risk: if one can run any command, like this one, anyone who can run it effectively becomes its owner.
