#!/bin/bash

# Static IP(192.168.0.2)
sed -i "/address/c\address 192.168.0.2/24" /etc/network/interfaces
sed -i "/gateway/c\gateway 192.168.0.1" /etc/network/interfaces
