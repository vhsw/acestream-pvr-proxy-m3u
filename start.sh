#!/bin/bash
sed -i  "s/ACE_PLAYLIST/$1/" /aceproxy/plugins/config/torrenttv.py
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf