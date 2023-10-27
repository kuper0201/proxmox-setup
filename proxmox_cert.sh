#!/bin/bash
pvenode acme account register cloudflare me@jeong-jun.su
pvenode acme plugin add dns cloudflare --api cf --data ./cf_api.txt --validation-delay 30
pvenode config set --acmedomain0 jvirtual.jeong-jun.su,plugin=cloudflare
pvenode acme cert order
