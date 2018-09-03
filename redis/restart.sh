#!/bin/bash

echo "stop redis ..."
pid=`ps -aux|grep redis| grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]; then
	kill -9 $pid
	echo "kill pid : $pid"
fi
echo "stop redis finish"

echo "start redis ..."
redis-server &
echo "start redis finish"