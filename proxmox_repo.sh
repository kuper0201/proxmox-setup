#!/bin/bash

# Enable proxmox community-repo
echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-enterprise.list

# Ceph-repo
echo "deb http://download.proxmox.com/debian/ceph-quincy bookworm no-subscription" > /etc/apt/sources.list.d/ceph.list

# Disable Valid Pop-Up
sed -i "s/\tExt.Msg.show/void/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
