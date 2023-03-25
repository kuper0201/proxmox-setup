#!/bin/bash

# Static IP(192.168.0.2)
sed -i 's/address/address 192.168.0.2/g' /etc/network/interfaces
sed -i 's/gateway/address 192.168.0.1/g' /etc/network/interfaces
sed -i 's/subnetmask/subnetmask 255.255.255.0/g' /etc/network/interfaces
