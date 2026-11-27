# DevOps Learning
 
My portfolio from the CoderCo DevOps bootcamp: notes, labs and projects as I work through each module.
 
## About me
 
- 🏥 I'm an Applications Support Engineer in the NHS, keeping clinical systems and EPR infrastructure running smoothly. When those systems go down, patient care feels it, so I take that seriously.
- 🏆 I started out as an apprentice on a council's SAP team and was named Digital and IT Apprentice of the Year 2023.
- 🐧 Running Linux home labs, self-hosting apps and automating anything that doesn't need a human is what pulled me towards DevOps. I want to build and automate the infrastructure, not just support it.
## Repo structure
 
| Folder | What's in it |
|---|---|
| [linux](./linux) | Linux notes and my OverTheWire Bandit write-ups |
| [bash-scripting](./bash-scripting) | Bash scripts with notes and example output |
| [networking](./networking) | Networking notes and my domain + EC2 + DNS project |
| [docker](./docker/Challenge/) | Flask + Redis visit counter, three replicas behind an NGINX load balancer |
| [aws](./aws) | Custom VPC build and a highly available ALB + Auto Scaling setup |
 
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
| Docker | ✅ Complete |
| AWS | ✅ Complete |
| Terraform | 🟡 In progress |
| CI/CD | ⚪ Not started |
| Kubernetes | ⚪ Not started |
 
## Highlights
 
**[AWS: VPC, ALB and Auto Scaling](./aws)**: A custom VPC from scratch, then a highly available web app across two AZs on my own domain.
- Public/private subnets, NAT gateway and a bastion host over SSH ProxyJump
- ALB with HTTPS (ACM) on aws.hamzahrashid.co.uk, via Cloudflare → Route 53 delegation
- Private EC2s reached through SSM Session Manager, with no SSH or bastion
- Auto Scaling Group at 50% CPU target tracking, with self-healing and instance refresh tested
- IMDSv2 user-data script giving each instance its own Arabic word and AZ colour
- CloudWatch alarms and SNS email alerts
**[Docker multi-container app](./docker/Challenge/)**: A Flask app counting visits in Redis, scaled to three replicas behind an NGINX load balancer.
- Health-checked startup so services only start once their dependencies are ready
- NGINX spreading traffic across the replicas
**[Domain + EC2 + DNS](./networking)**: NGINX on AWS EC2, served on my own domain through Cloudflare.
- Security group locked down, with SSH limited to my IP (/32)
- Fixed a Cloudflare 521 error and learnt how the SSL/TLS modes reach the origin
- Sorted SSH publickey errors and stale apt package lists
**[Bash scripting](./bash-scripting)**: Scripts built to match exact example outputs.
- File handling, backups, a bc calculator and a system monitor with timestamped logs
- Error handling with exit codes, set -u and bash -x debugging
- Script layout with a main function and small, single-purpose functions
**[OverTheWire Bandit](./linux/bandit)**: Levels 0 → 20, each with the command, an explanation and what I learnt, mistakes included.
- Text processing, encoding and unpacking files through eight layers of compression
- SSH keys, scp, nc, port scanning and openssl s_client
- setuid permissions and getting around a broken .bashrc
 
