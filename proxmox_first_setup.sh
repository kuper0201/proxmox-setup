#!/bin/bash

# Static to DHCP
sed -i 's/static/dhcp/g' /etc/network/interfaces
sed -i '/address/d' /etc/network/interfaces
sed -i '/gateway/d' /etc/network/interfaces

# Disable proxmox sub-repo
echo "#`cat /etc/apt/sources.list.d/pve-enterprise.list`" > /etc/apt/sources.list.d/pve-enterprise.list

# Enable proxmox community-repo
echo -e "\ndeb http://download.proxmox.com/debian/pve bullseye pve-no-subscription​" >> /etc/apt/sources.list​
