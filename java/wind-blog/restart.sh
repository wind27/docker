#!/bin/bash

echo "wind-blog restart ..."
pid=`ps -aux|grep wind-blog| grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]; then
	kill -9 $pid
	echo "kill pid : $pid"
fi
nohup java -Ddev=DEV -Ddev_meta=http://apollo:8080 -jar /opt/server/wind-blog/lib/wind-blog-0.0.1-SNAPSHOT.jar &
echo "wind-blog restart finish"