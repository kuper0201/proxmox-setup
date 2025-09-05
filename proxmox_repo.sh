#!/bin/bash

# Enable proxmox community-repo
echo "deb http://download.proxmox.com/debian/pve trixie pve-no-subscription" > /etc/apt/sources.list.d/pve-enterprise.list

# Ceph-repo
echo "deb http://download.proxmox.com/debian/ceph-quincy trixie no-subscription" > /etc/apt/sources.list.d/ceph.list

# Disable Valid Pop-Up(8.0)
# sed -i "s/\tExt.Msg.show/void/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js

# Disable Valid Pop-Up(9.0)
sed -i '/data\.status/{s/\!//;s/active/NoMoreNagging/}' /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
