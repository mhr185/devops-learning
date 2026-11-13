#!/bin/bash

#yum update -y
#yum install -y httpd
#systemctl enable httpd
#systemctl start httpd

get_token() {
    curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 300"
}

TOKEN=$(get_token)

get_metadata() {
    curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/$1

}

INSTANCE_ID=$(get_metadata instance-id)
PRIVATE_IP=$(get_metadata local-ipv4)
AZ=$(get_metadata placement/region)

echo "Instance ID: $INSTANCE_ID"
echo "Private IP: $PRIVATE_IP"
echo "Availability Zone: $AZ"


