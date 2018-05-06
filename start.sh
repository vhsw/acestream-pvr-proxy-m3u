#!/bin/bash
mkdir -p /dev/disk/by-id
if [ -z "$1" ]
  then
    echo "No playlist supplied"
fi;

sed -i  "s,url='',url='$1'," /HTTPAceProxy/plugins/config/torrenttv.py
sed -i  "s,loglevel = logging.DEBUG,loglevel = logging.WARNING," /HTTPAceProxy/aceconfig.py
mkdir /var/log/aceproxy/
touch /var/log/aceproxy/aceproxy.log
sed -i  "s,logfile = None,logfile = '/var/log/aceproxy/aceproxy.log'," /HTTPAceProxy/aceconfig.py

exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf