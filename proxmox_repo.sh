#!/bin/bash

# Disable proxmox sub-repo
echo "#`cat /etc/apt/sources.list.d/pve-enterprise.list`" > /etc/apt/sources.list.d/pve-enterprise.list

# Enable proxmox community-repo
echo -e "\ndeb http://download.proxmox.com/debian/pve bookworm pve-no-subscription​" >> /etc/apt/sources.list​
