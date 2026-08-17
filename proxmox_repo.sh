#!/usr/bin/env bash

set -euo pipefail

readonly CODENAME="$(. /etc/os-release && printf '%s' "$VERSION_CODENAME")"
readonly SOURCES_DIR="/etc/apt/sources.list.d"
readonly KEYRING="/usr/share/keyrings/proxmox-archive-keyring.gpg"

if [[ "$CODENAME" != "trixie" ]]; then
    echo "This repository setup is intended for Proxmox VE 9 (Debian 13/Trixie)." >&2
    exit 1
fi

install -d -m 0755 "$SOURCES_DIR"

# Disable the subscription-only PVE enterprise repository.
tee "$SOURCES_DIR/pve-enterprise.sources" >/dev/null <<EOF
Types: deb
URIs: https://enterprise.proxmox.com/debian/pve
Suites: $CODENAME
Components: pve-enterprise
Signed-By: $KEYRING
Enabled: no
EOF

# Enable the PVE no-subscription repository using the PVE 9 Deb822 format.
tee "$SOURCES_DIR/proxmox.sources" >/dev/null <<EOF
Types: deb
URIs: http://download.proxmox.com/debian/pve
Suites: $CODENAME
Components: pve-no-subscription
Signed-By: $KEYRING
EOF

# Replace the Ceph enterprise repository with Ceph Squid no-subscription.
tee "$SOURCES_DIR/ceph.sources" >/dev/null <<EOF
Types: deb
URIs: http://download.proxmox.com/debian/ceph-squid
Suites: $CODENAME
Components: no-subscription
Signed-By: $KEYRING
EOF

# Remove legacy entries created by older versions of this script.
rm -f "$SOURCES_DIR/pve-enterprise.list" "$SOURCES_DIR/ceph.list"

# Disable the subscription reminder popup (PVE 9).
sed -i '/data\.status/{s/\!//;s/active/NoMoreNagging/}' \
    /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js

apt-get update
