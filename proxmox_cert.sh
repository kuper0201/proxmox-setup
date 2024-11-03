#!/bin/bash
pvenode acme account register cloudflare me@junsu.me
pvenode acme plugin add dns cloudflare --api cf --data ./cf_api.txt --validation-delay 30
pvenode config set --acmedomain0 jvirtual.junsu.me,plugin=cloudflare
pvenode acme cert order
