#!/bin/bash

pid=`ps -ef|grep -w 'rabbitmq'|grep -v grep|cut -c 9-15`
if [ $pid ]; then
	su - rabbitmq -c "kill -9 $pid"
	echo "kill pid : $pid"
fi
su - rabbitmq -c "rabbitmq-server -detached"
echo "start rabbitmq success"