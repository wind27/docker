#!/bin/bash

echo "install tomcat ..."
rm -rf /opt/install/apache-tomcat-8.5.31.tar.gz
cd /opt/install/
wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz
tar -zxvf apache-tomcat-8.5.31.tar.gz -C /usr/local/tomcat/
echo "install tomcat finish"