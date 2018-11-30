#!/bin/bash

echo "restart filebeat ..."
pid=`ps -aux|grep filebeat| grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]; then
	su - dev -c "kill -9 $pid"
	echo "kill pid : $pid"
fi
su - dev -c "sh /usr/local/filebeat/filebeat-6.4.0-linux-x86_64/filebeat &"
echo "restart filebeat finish"