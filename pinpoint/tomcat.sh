#!/bin/bash

echo "install tomcat ..."
mkdir -p /user/local/tomcat/
rm -rf /opt/install/apache-tomcat-8.5.31.tar.gz
cd /opt/install/
wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz
tar -zxvf apache-tomcat-8.5.31.tar.gz -C /user/local/tomcat/
echo "install tomcat finish"

echo "init PATH ..."
echo 'export JAVA_6_HOME=/usr/java/jdk1.8.0_171-amd64/' >> ~/.bashrc
echo 'export JAVA_7_HOME=/usr/java/jdk1.8.0_171-amd64/' >> ~/.bashrc
echo 'export JAVA_8_HOME=/usr/java/jdk1.8.0_171-amd64/' >> ~/.bashrc
echo 'export JAVA_9_HOME=/usr/java/jdk1.8.0_171-amd64/' >> ~/.bashrc
echo 'export TOMCAT_HOME=/user/local/tomcat/apache-tomcat-8.5.31' >> ~/.bashrc
echo 'export PATH=$PATH:$TOMCAT_HOME/bin' >> ~/.bashrc
source ~/.bashrc
echo "init PATH finish"
