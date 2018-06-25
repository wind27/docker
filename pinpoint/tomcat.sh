#!/bin/bash

echo "install tomcat ..."
mkdir -p /usr/local/tomcat/
rm -rf /usr/local/tomcat/*
rm -rf /opt/install/apache-tomcat-8.5.31.tar.gz
cd /opt/install/
wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz
tar -zxvf apache-tomcat-8.5.31.tar.gz -C /usr/local/tomcat/
echo "install tomcat finish"

echo "init PATH ..."
echo 'export TOMCAT_HOME=/usr/local/tomcat/apache-tomcat-8.5.31' >> ~/.bashrc
echo 'export PATH=$PATH:$TOMCAT_HOME/bin' >> ~/.bashrc
source ~/.bashrc
echo "init PATH finish"