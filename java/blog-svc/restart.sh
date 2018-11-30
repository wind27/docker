#!/bin/bash

echo "blog-svc restart ..."
pid=`ps -aux|grep blog-svc| grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]; then
	su - dev -c "kill -9 $pid"
	echo "kill pid : $pid"
fi
su - dev -c "java -jar /opt/server/blog-svc/lib/blog-svc-0.0.1-SNAPSHOT.jar &"
echo "blog-svc restart finish"