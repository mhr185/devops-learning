#!/bin/bash

WORDS_AR=("نَصَرَ" "كَانَ" "قَرْيَة" "شَرِبَ" "قَهْوَة")
WORDS_EN=("to help" "to be" "village" "to drink" "coffee")

install_httpd() {
    yum update -y
    yum install -y httpd
    systemctl enable httpd
    systemctl start httpd

}

get_token() {
   curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 300"
}



get_metadata() {
    curl -s -H "X-aws-ec2-metadata-token: $TOKEN" "http://169.254.169.254/latest/meta-data/$1"

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
    install_httpd
    TOKEN=$(get_token)
    INSTANCE_ID=$(get_metadata instance-id)
    PRIVATE_IP=$(get_metadata local-ipv4)
    AZ=$(get_metadata placement/availability-zone)
    pick_word
    pick_accent
    echo "Instance ID=$INSTANCE_ID"
    echo "Private IP=$PRIVATE_IP"
    echo "Availability Zone=$AZ"
    echo "Arabic Word=$WORD_AR"
    echo "English Word=$WORD_EN"
    echo "Accent=$ACCENT"


cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${WORD_EN} | ${AZ}</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Amiri:wght@400;700&family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <style>
    :root {
      --bg: #0f1a2b;
      --card: #16243a;
      --gold: #d4a64a;
      --text: #f3efe6;
      --muted: #9aa7b8;
      --line: #2a3b55;
      --accent: ${ACCENT};
    }
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body {
      min-height: 100vh;
      background: var(--bg);
      color: var(--text);
      font-family: "Inter", system-ui, sans-serif;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 32px 20px;
    }
    .card {
      width: 100%;
      max-width: 560px;
      background: var(--card);
      border: 1px solid var(--line);
      border-top: 4px solid var(--accent);
      border-radius: 0 0 16px 16px;
      padding: 44px 40px 36px;
      text-align: center;
    }
    .eyebrow { color: var(--accent); font-size: 13px; letter-spacing: 3px; text-transform: uppercase; }
    .word {
      font-family: "Amiri", serif;
      direction: rtl;
      font-size: 84px;
      line-height: 1.3;
      color: var(--accent);
      margin: 18px 0 4px;
    }
    .meaning { font-size: 22px; font-weight: 600; margin-bottom: 28px; }
    .served {
      border-top: 1px solid var(--line);
      padding-top: 22px;
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 12px;
    }
    .label { color: var(--muted); font-size: 12px; letter-spacing: 1px; text-transform: uppercase; margin-bottom: 6px; }
    .label .ar { font-family: "Amiri", serif; font-size: 15px; text-transform: none; letter-spacing: 0; }
    .value { font-family: ui-monospace, "DejaVu Sans Mono", monospace; font-size: 13px; word-break: break-all; }
    .about { color: var(--muted); font-size: 14px; line-height: 1.6; margin-top: 28px; }
    footer { margin-top: 22px; color: var(--muted); font-size: 13px; }
    footer span { color: var(--accent); }
    @media (max-width: 520px) {
      .served { grid-template-columns: 1fr; }
      .word { font-size: 64px; }
    }
  </style>
</head>
<body>
  <main class="card">
    <p class="eyebrow">Word of this server</p>
    <p class="word">${WORD_AR}</p>
    <p class="meaning">${WORD_EN}</p>

    <div class="served">
      <div>
        <p class="label">Server <span class="ar">خادم</span></p>
        <p class="value">${INSTANCE_ID}</p>
      </div>
      <div>
        <p class="label">Zone <span class="ar">منطقة</span></p>
        <p class="value">${AZ}</p>
      </div>
      <div>
        <p class="label">Address <span class="ar">عنوان</span></p>
        <p class="value">${PRIVATE_IP}</p>
      </div>
    </div>

    <p class="about">I'm Hamzah. Every server in this Auto Scaling group teaches a word from my Arabic studies. Refresh to be load-balanced to another one, and its word and colour change with it.</p>
  </main>
  <footer>served via Application Load Balancer from <span>${AZ}</span></footer>
</body>
</html>
EOF
}
main
