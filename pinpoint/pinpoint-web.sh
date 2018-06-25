#!/bin/bash

echo "install pinpoint-web ..."
mkdir -p /usr/local/web/
rm -rf /usr/local/web/*
rm -rf /opt/install/apache-tomcat-8.5.31.tar.gz

cd /opt/install/
wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz
tar -zxvf apache-tomcat-8.5.31.tar.gz -C /usr/local/web/


cd /opt/install/
rm -rf /usr/local/web/apache-tomcat-8.5.31/webapps/ROOT/*
wget https://github.com/naver/pinpoint/releases/download/1.7.3/pinpoint-web-1.7.3.war
unzip /opt/install/pinpoint-web-1.7.3.war -d /usr/local/web/apache-tomcat-8.5.31/webapps/ROOT

sed -i 's/hbase.client.host=localhost/hbase.client.host=zookeeper/g'  /usr/local/web/apache-tomcat-8.5.31/webapps/ROOT/WEB-INF/classes/hbase.properties
echo "install pinpoint-web finish"