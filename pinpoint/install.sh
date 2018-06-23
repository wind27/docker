#!/bin/bash

echo "init PATH ..."
echo 'export JAVA_6_HOME=/usr/java/jdk1.8.0_171-amd64/' >> ~/.bashrc
echo 'export JAVA_7_HOME=/usr/java/jdk1.8.0_171-amd64/' >> ~/.bashrc
echo 'export JAVA_8_HOME=/usr/java/jdk1.8.0_171-amd64/' >> ~/.bashrc
echo 'export JAVA_9_HOME=/usr/java/jdk1.8.0_171-amd64/' >> ~/.bashrc
source ~/.bashrc
echo "init PATH finish"

sh /opt/install/tomcat.sh
#sh /opt/install/pinpoint.sh