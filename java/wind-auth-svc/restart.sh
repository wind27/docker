#!/bin/bash

echo "start ..."
pid=`ps -aux|grep wind-auth-svc| grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]; then
	kill -9 $pid
	echo "kill pid : $pid"
fi
nohup java -Ddev=DEV -Ddev_meta=http://apollo:8080 -jar /opt/server/wind-auth-svc/lib/wind-auth-svc-0.0.1-SNAPSHOT.jar &
echo "start finish"