#!/bin/bash

# Disable proxmox sub-repo
echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription​" > /etc/apt/sources.list.d/pve-enterprise.list

# Enable proxmox community-repo
#echo -e "" >> /etc/apt/sources.list

# Ceph-repo
echo "deb http://download.proxmox.com/debian/ceph-quincy bookworm no-subscription" > /etc/apt/sources.list.d/ceph.list
