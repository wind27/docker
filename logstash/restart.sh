#!/bin/bash

echo "restart logstash ..."
pid=`ps -aux|grep logstash| grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]; then
	su dev -c 'kill -9 $pid'
	echo "kill pid : $pid"
fi
su dev -c 'sh /usr/local/logstash/logstash-6.4.0/bin/logstash -f /usr/local/logstash/logstash-6.4.0/config/mysql_es.conf &'
echo "restart logstash finish"