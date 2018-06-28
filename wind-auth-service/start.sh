#!/bin/bash

echo "start ..."
ps -efww|grep -w 'wind-auth-service'|grep -v grep|cut -c 9-15 |  xargs kill -9
nohup java -jar /opt/service/wind-auth-service/libs/wind-auth-service-0.0.1-SNAPSHOT.jar
echo "start finish"