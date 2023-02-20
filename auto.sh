#!/bin/bash

wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/proxmox_first_setup.sh
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/proxmox_gpu_passthrough.sh

chmod +x proxmox_first_setup.sh
chmod +x proxmox_gpu_passthrough.sh

./proxmox_first_setup.sh
./proxmox_gpu_passthrough.sh

reboot