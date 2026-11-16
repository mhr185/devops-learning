#!/bin/bash

WORDS_AR=("نَصَرَ" "كَانَ" "قَرْيَة" "شَرِبَ" "قَهْوَة")
WORDS_EN=("to help" "to be" "village" "to drink" "coffee")

get_token() {
   curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 300"
}



get_metadata() {
    curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/$1

}

pick_word() {
    local checksum
    checksum=$(echo -n "$INSTANCE_ID" | cksum | cut -d' ' -f1)
    local index
    index=$((checksum % ${#WORDS_AR[@]}))
    WORD_AR=${WORDS_AR[$index]}
    WORD_EN=${WORDS_EN[$index]}
}

pick_accent() {
    if [[ $AZ == "eu-west-2a" ]]; then
        ACCENT="#d4a64a"
    elif [[ $AZ == "eu-west-2b" ]]; then
        ACCENT="#9aa7b8"
    else
        ACCENT="#f3efe6"
    fi
}

main() {
    TOKEN=$(get_token)
    INSTANCE_ID=$(get_metadata instance-id)
    PRIVATE_IP=$(get_metadata local-ipv4)
    AZ=$(get_metadata placement/availability-zone)
    pick_word
    pick_accent
}
main

log_values() {
    echo "Instance ID=$INSTANCE_ID"
    echo "Private IP=$PRIVATE_IP"
    echo "Availability Zone=$AZ"
    echo "Arabic Word=$WORD_AR"
    echo "English Word=$WORD_EN"
    echo "Accent=$ACCENT"
}
log_values

write_page() {
yum update -y
yum install -y httpd
systemctl enable httpd
systemctl start httpd

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<meta charset="UTF-8">
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arabic Word</title>
    <style>
        body {
            background-color: $ACCENT;
            color: white;
            font-family: Arial, sans-serif;
            text-align: center;
            padding-top: 20%;
        }
        h1 {
            font-size: 3em;
        }
        p {
            font-size: 1.5em;
        }
    </style>
</head>
<body>
    <h1>Instance ID: $INSTANCE_ID</h1>
    <h1>Private IP: $PRIVATE_IP</h1>
    <h1>Availability Zone: $AZ</h1>
    <h1>$WORD_AR</h1>
    <p>$WORD_EN</p>
</body>
</html>
EOF
}
write_page