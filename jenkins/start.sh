#!/bin/bash

echo "start jenkins ..."
ps -efww|grep -w 'jenkins'|grep -v grep|cut -c 9-15 |  xargs kill -9
nohup java -jar /usr/lib/jenkins/jenkins.war --ajp13Port=-1 --httpPort=8082 &  
echo "start jenkins finish"