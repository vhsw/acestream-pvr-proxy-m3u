#!/bin/bash
mkdir -p /dev/disk/by-id
sed -i  "s,url='',url='$1'," /HTTPAceProxy/plugins/config/torrenttv.py
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf