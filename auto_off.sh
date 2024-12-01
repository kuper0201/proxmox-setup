#!/bin/bash

running_qm=$(qm list | grep "running")
running_pct=$(pct list | grep "running")

if [ -z "$running_qm" ] && [ -z "$running_pct" ]; then
    poweroff
fi
