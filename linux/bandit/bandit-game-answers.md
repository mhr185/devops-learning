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
