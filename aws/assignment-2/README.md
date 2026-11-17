# Assignment 2 - Application Load Balancer
 
Two web servers in private subnets across two Availability Zones, behind an internet-facing Application Load Balancer. The ALB handles all incoming traffic, and the instances can't be reached directly from the internet.
 
All the bonus tasks are done, plus a few extras:
- **Custom domain:** `aws.hamzahrashid.co.uk`, delegated from Cloudflare to a Route 53 hosted zone, with an ALIAS record pointing at the ALB
- **HTTPS:** an ACM certificate on an HTTPS:443 listener, with HTTP:80 redirecting to HTTPS
- **Auto Scaling group:** replaces the hand-built instances, scales on CPU and heals itself
- **Extras:** SSM Session Manager instead of SSH or a bastion, a regional NAT gateway, and a user data script that gives every instance its own Arabic-themed page, so the load balancing and scaling are visible in the browser

**The final site:** each AZ shows its own word and accent colour.
 
![Site served from eu-west-2a](images/26a-site-eu-west-2a.png)
![Site served from eu-west-2b](images/26b-site-eu-west-2b.png)
 

## Architecture
 
![Architecture diagram](images/architecture.drawio.png)
 
| Component | Configuration |
|---|---|
| Region | eu-west-2 (London), 2 Availability Zones (2a, 2b) |
| VPC | hamzah-custom-vpc, 10.0.0.0/16 (reused from Assignment 1) |
| Public subnets | 10.0.1.0/24 (2a), 10.0.3.0/24 (2b). Route: 0.0.0.0/0 → IGW |
| Private subnets | 10.0.2.0/24 (2a), 10.0.4.0/24 (2b). Route: 0.0.0.0/0 → regional NAT gateway |
| NAT gateway | Regional mode: one NAT for the whole VPC, spanning both AZs |
| ALB | hamzah-alb, internet-facing, in both public subnets |
| Listeners | HTTPS:443 → target group (ACM certificate). HTTP:80 → 301 redirect to HTTPS |
| Target group | hamzah-priv-web-servers, HTTP:80, health check on `/` |
| ALB security group | Inbound HTTP 80 and HTTPS 443 from 0.0.0.0/0 |
| EC2 security group | Inbound HTTP 80 from the ALB security group only. No SSH |
| Instances | t3.micro, Amazon Linux 2023, private subnets, no public IP, no key pair |
| Access | SSM Session Manager through an IAM role (AmazonSSMManagedInstanceCore) |
| DNS | Cloudflare (hamzahrashid.co.uk) delegates `aws.` to Route 53. ALIAS A record at the zone apex → ALB |
| Certificate | ACM, aws.hamzahrashid.co.uk, DNS-validated, RSA 2048 |
| Auto Scaling | web-server-scaling, launch template web-server, min 2 / desired 2 / max 4, target tracking at 50% average CPU, SNS email notifications |

## Challenges and how I solved them
 
| Problem | Cause | Fix |
|---|---|---|
| No CloudWatch alarms for the scaling policy | Going back to edit the group size in the ASG wizard reset the scaling policy option, so the policy was never created | Created the target tracking policy from the ASG's *Automatic scaling* tab. Its alarms then appeared |
| Load test didn't trigger scaling | One `yes` process uses one of the t3.micro's two vCPUs, so each instance sat at about 50%, exactly on the target | Ran two `yes` processes per instance; `top`'s *idle* figure showed the whole machine was busy |
| No scaling emails | I'd never confirmed the SNS subscription | Confirmed it; SNS doesn't deliver until the endpoint is confirmed |
| Health checks would have failed | User data wrote to `/var/http/html` instead of `/var/www/html`. Apache then serves its default page with a **403**, and the ALB marks the target unhealthy | Corrected the path, and confirmed it with `grep DocumentRoot /etc/httpd/conf/httpd.conf` |
| AZ showed as `eu-west-2` | I'd read `placement/region` instead of `placement/availability-zone` | Listed `placement/` to see what's there, then used the AZ path |
| Word variables empty or wrong | `WORD_AR=$(pick_word)` captured everything the function printed, and `$(...)` runs in a subshell, so the variables set inside it were lost | Called `pick_word` plainly so it sets the globals. `$(...)` is only for functions that print a single value |
| Arabic garbled in the launch template | Uploading the script with *Choose file* read the UTF-8 file as Latin-1 | Pasted the script into the user data field instead, and checked `/var/lib/cloud/instance/user-data.txt` on a new instance |
| `dig` not found | The package is called `bind9-dnsutils`, not `dig` | `sudo apt install bind9-dnsutils` |
| ACM certificate name | The certificate has to match the exact hostname users visit | Requested it for the zone apex, `aws.hamzahrashid.co.uk`, which is the name the ALIAS record uses |
 
## What I learnt

- **ALB:** An ALB is AWS managed. You select a public subnet in each AZ, and AWS runs a node in each one. This makes it highly available.
- **Security group references:** The EC2 instances only allow inbound HTTP from the ALB's security group. This follows the least-privilege model, and means the only way to reach the instances is through the ALB.
- **TLS termination:** The ALB decrypts HTTPS, so the instances only deal with HTTP. That simplifies the instances, but the last hop inside the VPC isn't encrypted.
- **DNS delegation:** Lets one provider hand a subdomain to another using NS records. An ALIAS is Route 53's answer to "a CNAME at the zone apex".
- **SSM:** Implementing SSM meant there was no need for SSH, key pairs or a bastion host. Access is controlled through an IAM role instead.
- **IMDSv2:** Using IMDSv2 helped me understand the `curl` command and HTTP requests. A PUT request gets a session token, then GET requests send that token in a header to read the instance's metadata. I've commented these steps in my user data script.
- **Bash functions:** Use `$(...)` to get a single printed value, call the function plainly when it sets several globals, and use `local` for working variables.
- **Auto Scaling:** Target tracking scales on the *group average*, scaling in is deliberately slower than scaling out, the maximum caps the group, and ELB health checks let the ASG replace instances that are running but broken. Any scaling activity was notified to me through SNS email.
- **Instance refresh:** A rolling deployment: new versions go out one instance at a time, with no downtime. I used this when updating my launch template with my new user data script.

## Trade-offs and what I'd do in production
 
- **Encryption in transit:** traffic from the ALB to the instances is plain HTTP inside the VPC. For regulated data (for example, patient data in an NHS system), I'd use end-to-end TLS: an HTTPS target group, with certificates on the instances.
- **Scaling speed:** basic monitoring (5-minute metrics) took over 10 minutes to trigger scaling. Detailed monitoring (1-minute metrics) reacts much faster, at a small cost.
- **ALB outbound rule:** the ALB SG still has the default "allow all" outbound rule. Tightening it to HTTP 80 to the EC2 SG only would be stricter.
- **Fully private AWS access:** SSM and package installs go out through the NAT gateway. VPC interface endpoints for SSM, plus an S3 gateway endpoint, would remove the need for internet access entirely.
- **Infrastructure as code:** everything here was built by hand in the console. In Terraform it would be reviewable, repeatable and easy to tear down, which is the next module.
- **Cost:** the ALB, NAT gateway and public IPv4 addresses are billed hourly even with no traffic, and the Route 53 hosted zone costs a monthly fee.
 
## What I built
 
The subnet numbering uses **odd numbers for public, even for private**, so you can tell a subnet's role from its CIDR.
 
### 1. Network changes
I reused the Assignment 1 VPC and added a public and a private subnet in a second AZ. An ALB needs subnets in at least two AZs, so that if one AZ fails, its node in the other AZ keeps serving. Each new subnet is explicitly associated with the right route table; a new subnet starts on the VPC's main route table, which has no route to the internet gateway.
 
![Subnets](images/01-subnets.png)
![Public route table subnet associations](images/02-public-route-tables-subnets.png)
![Private route table](images/03-private-route-table.png)
![Private route table subnet associations](images/04-private-route-tables-subnets.png)
 
### 2. Regional NAT gateway
The private instances need outbound internet access to install Apache and to reach SSM. I used the newer **regional** NAT gateway mode rather than a zonal one. It's a VPC-level resource that isn't placed in a subnet (the console shows a dash for Subnet), and it covers every AZ that has workloads. That removes the weakness from Assignment 1, where a single NAT in one AZ was a dependency for the other AZ.
 
![Regional NAT gateway](images/05-regional-nat-gateway.png)
 
### 3. Security groups
- **ALB SG:** HTTP 80 and HTTPS 443 from anywhere. The ALB is the only public entry point.
- **EC2 SG:** HTTP 80 with **the ALB's security group as the source**, and nothing else. Even if someone knew an instance's address, the only thing allowed to talk to it is the ALB. It also keeps working when the ALB's IPs change, which a list of IP addresses wouldn't.
![ALB security group](images/06-alb-sg.png)
![EC2 instances](images/06-ec2-instances.png)
![EC2 security group](images/07-ec2-sg.png)
 
### 4. Access with SSM instead of SSH
There's no bastion, no port 22 and **no key pair** on the instances. Each instance has an IAM role with AmazonSSMManagedInstanceCore. The SSM agent (preinstalled on Amazon Linux 2023) makes an **outbound** HTTPS connection through the NAT gateway and keeps it open, and Session Manager sends my shell over that connection. Security groups are stateful, so no inbound rule is needed. Every session is logged in Session Manager's history.
 
![SSM IAM role](images/08-ssm-iam-role.png)
![Fleet Manager](images/14-ssm-fleet-manager.png)
![Session Manager shell](images/15-ssm-session.png)
![Session history](images/16-ssm-session-history.png)
 
### 5. Application Load Balancer and target group
- **Internet-facing**, mapped to both public subnets
- **HTTPS:443** forwards to the target group, and **HTTP:80** returns a 301 redirect to HTTPS
- The target group checks `/` on each instance and expects a 200. Unhealthy targets stop receiving traffic, and they're added back automatically once they recover
![ALB details](images/09a-alb-details.png)
![ALB listeners](images/09b-alb-listeners.png)
![Target group health check](images/10-target-group-health-check.png)
 
### 6. Custom domain: Cloudflare → Route 53 delegation
My domain's DNS is on Cloudflare, so instead of moving it I **delegated a subdomain**:
1. Created a Route 53 public hosted zone for `aws.hamzahrashid.co.uk`, which gets four AWS name servers
2. Added four **NS records** for `aws` in Cloudflare pointing at those name servers. Cloudflare now answers any question about `*.aws.hamzahrashid.co.uk` with "ask Route 53"
3. Created an **ALIAS A record** at the zone apex pointing at the ALB
Cloudflare is only involved in the lookup. NS records can't be proxied, so the browser connects straight to the ALB. An alias (unlike a CNAME) works at the top of a zone, follows the ALB if its IPs change, and its queries are free.
 
![Cloudflare NS records](images/11a-cloudflare-ns-records.png)
![Route 53 hosted zone](images/11b-route53-hosted-zone.png)
![dig showing the delegation and ALB IPs](images/11c-dig-ns-and-a.png)
 
### 7. HTTPS with ACM
- Requested a public certificate for `aws.hamzahrashid.co.uk` with DNS validation; the "Create records in Route 53" button added the validation CNAME. The record stays in place so ACM can renew the certificate automatically.
- The certificate is in **eu-west-2**, the same region as the ALB. (CloudFront in Assignment 3 needs its certificates in us-east-1.)
- **TLS terminates at the ALB:** browsers connect over HTTPS, and the ALB forwards plain HTTP to the instances inside the VPC. That's why the instances only need port 80.
![ACM certificate issued](images/12a-acm-certificate-issued.png)
![Browser certificate](images/12b-browser-certificate.png)
![HTTP to HTTPS redirect](images/12c-http-redirect-301.png)
 
### 8. Auto Scaling group
- **Launch template** (web-server): AMI, instance type, EC2 SG, SSM role, user data, no public IP
- **ASG** across both private subnets, attached to the target group, with **ELB health checks** so instances that fail the ALB's check on `/` get replaced, not only instances whose hardware fails
- **Min 2 / desired 2 / max 4**, so there's always one instance per AZ, with room to grow
- **Target tracking** on average CPU at 50%, with a 300-second warm-up
- **SNS** emails on every launch and termination
![Launch template](images/17a-launch-template.png)
![ASG review](images/17b-asg-review.png)
![ASG details](images/17c-asg-details.png)
![ASG details](images/17d-asg-details.png)
![Scaling policy](images/17e-scaling-policy.png)
 
### 9. The user data script: an Arabic word per server
[`user-data.sh`](user-data.sh) runs once, as root, when each instance first boots:
 
1. Installs and starts Apache
2. Gets an **IMDSv2 token** (a PUT to `/latest/api/token`), then uses it to read the instance ID, private IP and Availability Zone from instance metadata
3. **Hashes the instance ID** with `cksum`, takes the result modulo the length of a word list, and uses that as the index. The same instance always gets the same word, and different instances usually get different ones
4. Picks an accent colour by AZ: gold for eu-west-2a, blue-grey for eu-west-2b
5. Logs what it chose to `/var/log/cloud-init-output.log`
6. Writes the page with a heredoc
The words come from my Arabic classes: نَصَرَ (to help), كَانَ (to be), قَرْيَة (village), شَرِبَ (to drink) and قَهْوَة (coffee). The colours match my Docker project, Arabic Counter Pro.
 
![What the script logged on one instance](images/27-user-data-log.png)
 
## Testing
 
**Load balancing across both AZs:** refreshing `https://aws.hamzahrashid.co.uk` alternates between instances in 10.0.2.x (2a) and 10.0.4.x (2b).
 
![ALB response](images/13a-alb-response.png)
![ALB response](images/13b-alb-response.png)
![ALB response](images/13c-alb-response.png)
![ALB response](images/13d-alb-response.png)
 
**The final site:** each AZ shows its own word and accent colour.
 
![Site served from eu-west-2a](images/26a-site-eu-west-2a.png)
![Site served from eu-west-2b](images/26b-site-eu-west-2b.png)
 
**Instances can't be reached directly:**
 
![Direct access blocked](images/23-ec2-direct-access-blocked.png)
 
**Scaling out:** I loaded every instance with `yes > /dev/null`. A t3.micro has 2 vCPUs and CPUUtilization is averaged across them, so one `yes` process per instance only reached about 50%, right on the target, and nothing happened. With **two per instance**, the average went well past 50%, the AlarmHigh alarm fired, and the ASG scaled to 3 and then 4 instances. It stopped at 4 because that's the group's maximum.
 
![CPU stress command](images/18a-instance-cpu-stress.png)
![CloudWatch alarms](images/18b-cloudwatch-alarms.png)
![Alarm triggered](images/18c-cloudwatch-alarm-triggered.png)
![Scale-out triggered](images/19a-scale-out-triggered.png)
![4 instances](images/19b-scale-out-4-instances.png)
![At maximum](images/19c-scale-out-max-instances.png)
![Target group during scale-out](images/19d-scale-out-target-group.png)
![Target group with 3 targets](images/19e-scale-out-target-group-3.png)
![Target group at maximum](images/19f-scale-out-target-group-max.png)
 
**Scaling in:** after stopping the load, the AlarmLow alarm (deliberately slower than AlarmHigh) brought the group back down to 2. Terminating targets drained first: the ALB stopped sending them new requests and let in-flight requests finish.
 
![Scale-in activity](images/20a-scale-in-activity.png)
![Scale-in email](images/20b-scale-in-email.png)
![Activity history](images/21-asg-activity-history.png)
 
**Self-healing:** I terminated an instance myself, and the ASG launched a replacement to get back to 2.
 
![Self-healing](images/22-self-healing.png)
 
**Rolling deployment:** I put the Arabic page into a new launch template version, set it as the default, and ran an **instance refresh**. The ASG replaced the instances one at a time while the site stayed up.
 
![Launch template versions](images/24-launch-template-versions.png)
![Instance refresh successful](images/25-instance-refresh-successful.png)

## Clean-up
 
1. Deleted the **Auto Scaling group** first, because otherwise it replaces any instance I terminate
2. Deleted the ALB and the target group
3. Deleted the NAT gateway, then released any Elastic IPs it left behind
4. Deleted the launch template
5. Kept the VPC, subnets and route tables (free), and the **Route 53 hosted zone**, which I'm reusing for Assignment 3
 
