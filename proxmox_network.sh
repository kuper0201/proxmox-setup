#!/bin/bash

# Static IP(192.168.0.2)
sed -i "/address/c\\\taddress 192.168.0.2/24" /etc/network/interfaces
sed -i "/gateway/c\\\tgateway 192.168.0.1" /etc/network/interfaces
