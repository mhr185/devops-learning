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

pick_word() {
    local checksum
    checksum=$(echo -n "$INSTANCE_ID" | cksum | cut -d' ' -f1)
    local index
    index=$((checksum % ${#WORDS_AR[@]}))
    WORD_AR=${WORDS_AR[$index]}
    WORD_EN=${WORDS_EN[$index]}
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
}
pick_accent

log_values() {
    echo "Instance ID=$INSTANCE_ID"
    echo "Private IP=$PRIVATE_IP"
    echo "Availability Zone=$AZ"
    echo "Arabic Word=$WORD_AR"
    echo "English Word=$WORD_EN"
    echo "Accent=$ACCENT"
}
log_values

#yum update -y
#yum install -y httpd
#systemctl enable httpd
#systemctl start httpd
