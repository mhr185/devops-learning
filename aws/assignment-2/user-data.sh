#!/bin/bash

WORDS_AR=("نَصَرَ" "كَانَ" "قَرْيَة" "شَرِبَ" "قَهْوَة")
WORDS_EN=("to help" "to be" "village" "to drink" "coffee")

get_token() {
   curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 300"
}

TOKEN=$(get_token)

get_metadata() {
    curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/$1

}

INSTANCE_ID=$(get_metadata instance-id)
PRIVATE_IP=$(get_metadata local-ipv4)
AZ=$(get_metadata placement/availability-zone)

echo "Instance ID: $INSTANCE_ID"
echo "Private IP: $PRIVATE_IP"
echo "Availability Zone: $AZ"

pick_word() {
    local checksum
    checksum=$(echo -n "$INSTANCE_ID" | cksum | cut -d' ' -f1)
    #echo "Checksum: $checksum"
    local index
    index=$((checksum % ${#WORDS_AR[@]}))
    #echo "Index: $index"
    WORD_AR=${WORDS_AR[$index]}
    echo "Arabic Word: $WORD_AR"
    WORD_EN=${WORDS_EN[$index]}
    echo "English Word: $WORD_EN"
}
pick_word

pick_accent() {
    if [[ $AZ == "eu-west-2a" ]]; then
        ACCENT="#d4a64a"
    elif [[ $AZ == "eu-west-2b" ]]; then
        ACCENT="#6fa8dc"
    else
        ACCENT="#9aa7b8"
    fi
    echo "Accent: $ACCENT"
}
pick_accent


#yum update -y
#yum install -y httpd
#systemctl enable httpd
#systemctl start httpd