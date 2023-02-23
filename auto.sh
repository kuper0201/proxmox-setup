#!/bin/bash

# DHCP, GPU Passthrough
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/proxmox_first_setup.sh
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/proxmox_gpu_passthrough.sh

chmod +x proxmox_first_setup.sh
chmod +x proxmox_gpu_passthrough.sh

./proxmox_first_setup.sh
./proxmox_gpu_passthrough.sh

# CloudFlare DDNS
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/update-cloudflare-dns.sh
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/update-cloudflare-dns.conf

chmod +x update-cloudflare-dns.sh
mv update-cloudflare-dns.sh /usr/local/bin/update-cloudflare-dns
mv update-cloudflare-dns.conf /usr/local/bin/update-cloudflare-dns.conf
(crontab -l 2>/dev/null; echo "*/10 * * * * /usr/local/bin/update-cloudflare-dns") | crontab -

reboot