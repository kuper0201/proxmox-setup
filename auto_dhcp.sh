#!/bin/bash

# DHCP Configuration
wget https://raw.githubusercontent.com/kuper0201/proxmox-setup/master/proxmox_first_setup.sh

chmod +x proxmox_first_setup.sh
./proxmox_first_setup.sh

reboot
