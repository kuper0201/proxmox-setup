#!/bin/bash

# Input the tokens
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

# This is for proxmox_cert.sh script
echo "CF_Account_ID=$CF_Account_ID" >> cf_api.txt
echo "CF_Token=$CF_Token" >> cf_api.txt

# Certificates Setup
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/main/proxmox_cert.sh
chmod +x proxmox_cert.sh
./proxmox_cert.sh

# Network Setup
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/main/proxmox_network.sh
chmod +x proxmox_network.sh
./proxmox_network.sh

# Repository Setup
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/main/proxmox_repo.sh
chmod +x proxmox_repo.sh
./proxmox_repo.sh

# GPU Passthrough
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/main/proxmox_gpu_passthrough.sh
chmod +x proxmox_gpu_passthrough.sh
./proxmox_gpu_passthrough.sh

# Power Off Automatically
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/main/auto_off.sh
chmod +x auto_off.sh
mv auto_off.sh /usr/local/bin/auto_off.sh

wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/main/thermal.sh
chmod +x thermal.sh

# CloudFlare DDNS Setup
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/main/update-cloudflare-dns.sh
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/main/update-cloudflare-dns.conf

sed -i "s/zoneid_here/$CF_Zone_ID/g" update-cloudflare-dns.conf
sed -i "s/apitoken_here/$CF_Token/g" update-cloudflare-dns.conf
sed -i "s/telegram_chat_id_here/$TG_Chat_ID/g" update-cloudflare-dns.conf
sed -i "s/telegram_bot_token_here/$TG_Bot_Token/g" update-cloudflare-dns.conf

chmod +x update-cloudflare-dns.sh
mv update-cloudflare-dns.sh /usr/local/bin/update-cloudflare-dns
mv update-cloudflare-dns.conf /usr/local/bin/update-cloudflare-dns.conf
(crontab -l 2>/dev/null; echo -e "@reboot sleep 10 && /usr/local/bin/update-cloudflare-dns\n0 * * * * /usr/local/bin/update-cloudflare-dns\n0 */2 * * * /usr/local/bin/auto_off.sh") | crontab -

# Cleanup
rm -rf ./proxmox_cert.sh
rm -rf ./proxmox_network.sh
rm -rf ./proxmox_gpu_passthrough.sh
rm -rf ./proxmox_repo.sh
rm -rf ./cf_api.txt

reboot
