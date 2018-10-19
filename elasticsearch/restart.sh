#!/bin/bash

echo "restart elasticsearch ..."
pid=`ps -aux|grep elasticsearch| grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]; then
	su dev -c 'kill -9 $pid'
	echo "kill pid : $pid"
fi
su dev -c 'nohup sh /usr/local/elasticsearch/elasticsearch-6.4.0/bin/elasticsearch &'
echo "restart elasticsearch finish"

echo "restart kibana ..."
pid=`ps -aux|grep kibana| grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]; then
	su dev -c 'kill -9 $pid'
	echo "kill pid : $pid"
fi
su dev -c 'sh /usr/local/kibana/kibana-6.4.0-linux-x86_64/bin/kibana -d'
echo "restart kibana finish"