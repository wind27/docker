#!/bin/bash

echo "stop elasticsearch ..."
pid=`ps -aux|grep elasticsearch| grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]; then
	kill -9 $pid
	echo "kill pid : $pid"
fi
echo "stop elasticsearch finish"

echo "start elasticsearch ..."
/usr/local/elasticsearch/elasticsearch-6.4.0/bin/elasticsearch
echo "start elasticsearch finish"