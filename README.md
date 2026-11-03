# DevOps Learning
 
My portfolio from the CoderCo DevOps bootcamp: notes, labs and projects as I work through each module.
 
## About me
 
- I'm an Applications Support Engineer in the NHS, keeping clinical systems and EPR infrastructure running smoothly. When those systems go down, patient care feels it, so I take that seriously.
- I started out as an apprentice on a council's SAP team and was named Digital and IT Apprentice of the Year 2023.
- Running Linux home labs, self-hosting apps and automating anything that doesn't need a human is what pulled me towards DevOps. I want to build and automate the infrastructure, not just support it.
## Repo structure
 
| Folder | What's in it |
|---|---|
| [linux](./linux) | Linux notes and my OverTheWire Bandit write-ups |
| [bash-scripting](./bash-scripting) | Bash scripts I built, with notes and example output |
| [networking](./networking) | Networking notes and my domain + EC2 + DNS project |
 
## Progress
 
### Phase 1
 
| Module | Status |
|---|---|
| Linux | ✅ Complete (SadServers ongoing) |
| Bash | ✅ Complete |
| Git | ✅ Complete |
| Networking | ✅ Complete |
 
### Phase 2 – Applied DevOps
 
| Module | Status |
|---|---|
| Docker | 🟡 In progress |
| AWS | ⚪ Not started |
| Terraform | ⚪ Not started |
| CI/CD | ⚪ Not started |
| Kubernetes | ⚪ Not started |
 
 
## Highlights
 
**[Domain + EC2 + DNS](./networking)**: Deployed NGINX on an AWS EC2 instance and served it on my own domain, nginx.hamzahrashid.co.uk, through Cloudflare. Covers:
 
- Launching an Ubuntu EC2 instance and connecting over SSH with a key pair
- Locking down a security group: HTTP/HTTPS open to all, SSH restricted to my IP with a /32
- Installing, configuring and testing NGINX (nginx -t, systemctl, curl, ss)
- Creating a Cloudflare A record and understanding how proxying hides the origin IP
- Debugging a Cloudflare 521 error and how Cloudflare's SSL/TLS modes connect to the origin
- Troubleshooting SSH publickey errors and stale apt package lists

**[Bash scripting](./bash-scripting)**: A set of scripts built to match exact example outputs, debugged and refined as I went. Includes:
 
- file_ops.sh: creates directories and files, checking first whether they already exist
- file_checker.sh: checks whether a file exists and reports its permissions
- backup_text.sh: backs up .txt files into a backup folder, with error handling if a step fails
- An arithmetic calculator that takes two parameters, handles decimals with bc and guards against division by zero
- A system monitoring script reporting CPU, memory, disk and the top 5 processes by memory, with timestamped logging

**Along the way I learnt:**
 
- Quoting variables to prevent word-splitting, and how quoting works inside $( ) command substitution
- Using functions with local variables, and the difference between return and exit
- Error handling with || and exit codes
- Catching typos with set -u and tracing scripts with bash -x
- Structuring larger scripts with a main function and small single-purpose functions
- Parsing command output with grep and awk (top, free, df)

**[OverTheWire Bandit write-ups](./linux/bandit)**: Levels 0 → 20 complete, each with the command I used, an explanation, and what I learned along the way, including my mistakes and how I fixed them. Covers:
 
- Searching and filtering text with grep, sort and uniq
- Pulling readable text out of binary files with strings
- Decoding base64 and ROT13
- Reversing a hexdump and unpacking a file through eight layers of gzip, bzip2 and tar
- Logging in with SSH private keys, fixing key permissions, and copying files between machines with scp
- Sending data to network services with nc, and scanning a port range to find which ones are open
- Connecting to SSL/TLS services with openssl s_client and reading certificate details
- Comparing files with diff to find exactly what changed
- Getting around a broken .bashrc by running commands over ssh without an interactive shell
- Understanding setuid permissions and how a program can run as another user
