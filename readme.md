## How to install

### With GPU Passthrough and CloudFlare DDNS
```bash
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/auto.sh
chmod +x auto.sh
./auto.sh
```

### No GPU Passthrough and CloudFlare DDNS
```bash
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/auto_dhcp.sh
chmod +x auto_dhcp.sh
./auto_dhcp.sh
```

CloudFlare DDNS Scripts are forked from [fire1ce/DDNS-Cloudflare-Bash](https://github.com/fire1ce/DDNS-Cloudflare-Bash)