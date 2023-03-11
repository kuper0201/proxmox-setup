#!/bin/bash

echo "CF_Account_ID="
read CF_Account_ID

echo "CF_Token="
read CF_Token

echo "CF_Zone_ID="
read CF_Zone_ID

echo "Telegram_Chat_ID="
read TG_Chat_ID

echo "Telegram_Bot_Token="
read TG_Bot_Token

echo "CF_Account_ID=$CF_Account_ID" >> cf_api.txt
echo "CF_Token=$CF_Token" >> cf_api.txt

# Setup Certificates
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/proxmox_cert.sh
chmod +x proxmox_cert.sh
./proxmox_cert.sh

# DHCP, GPU Passthrough
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/proxmox_dhcp.sh
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/proxmox_gpu_passthrough.sh

chmod +x proxmox_dhcp.sh
chmod +x proxmox_gpu_passthrough.sh

./proxmox_dhcp.sh
./proxmox_gpu_passthrough.sh

# CloudFlare DDNS
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/update-cloudflare-dns.sh
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/update-cloudflare-dns.conf

sed -i "s/zoneid_here/$CF_Zone_ID/g" update-cloudflare-dns.conf
sed -i "s/apitoken_here/$CF_Token/g" update-cloudflare-dns.conf
sed -i "s/telegram_chat_id_here/$TG_Chat_ID/g" update-cloudflare-dns.conf
sed -i "s/telegram_bot_token_here/$TG_Bot_Token/g" update-cloudflare-dns.conf

chmod +x update-cloudflare-dns.sh
mv update-cloudflare-dns.sh /usr/local/bin/update-cloudflare-dns
mv update-cloudflare-dns.conf /usr/local/bin/update-cloudflare-dns.conf
(crontab -l 2>/dev/null; echo "0 * * * * /usr/local/bin/update-cloudflare-dns") | crontab -

# Cleanup
rm -rf ./proxmox_cert.sh
rm -rf ./proxmox_dhcp.sh
rm -rf ./proxmox_gpu_passthrough.sh
rm -rf ./cf_api.txt

reboot
