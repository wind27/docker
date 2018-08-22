#!/bin/bash

pid=`ps -efww|grep -w 'jenkins'|grep -v grep|cut -c 9-15`
if [ $pid ]; then
	kill -9 $pid
	echo "kill pid : $pid"
fi
nohup java -jar /usr/lib/jenkins/jenkins.war --ajp13Port=-1 --httpPort=8080 --prefix=/jenkins &  
echo "start jenkins success"