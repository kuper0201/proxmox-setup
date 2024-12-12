#!/bin/bash

running_qm=$(/usr/sbin/qm list | grep "running")
running_pct=$(/usr/sbin/pct list | grep "running")

if [ -z "$running_qm" ] && [ -z "$running_pct" ]; then
    /usr/sbin/poweroff
fi
