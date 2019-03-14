#!/bin/bash

echo "wind-config restart ..."
pid=`ps -aux|grep wind-config| grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]; then
	kill -9 $pid
	echo "kill pid : $pid"
fi

su - dev -c "nohup sh /opt/install/restart.sh &"
echo "wind-config restart finish"