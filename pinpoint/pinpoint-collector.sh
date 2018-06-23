#!/bin/bash

echo "install pinpoint-collector ..."
mkdir -p /usr/local/collector/
rm -rf /usr/local/collector/*
rm -rf /opt/install/apache-tomcat-8.5.31.tar.gz

cd /opt/install/
wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz
tar -zxvf apache-tomcat-8.5.31.tar.gz -C /usr/local/collector/

sed -i 's/port="8005"/port="18005"/g' /usr/local/collector/apache-tomcat-8.5.31/conf/server.xml
sed -i 's/port="8080"/port="18080"/g' /usr/local/collector/apache-tomcat-8.5.31/conf/server.xml
sed -i 's/port="8443"/port="18443"/g' /usr/local/collector/apache-tomcat-8.5.31/conf/server.xml
sed -i 's/port="8009"/port="18009"/g' /usr/local/collector/apache-tomcat-8.5.31/conf/server.xml
sed -i 's/redirectPort="8443"/redirectPort="18443"/g' /usr/local/collector/apache-tomcat-8.5.31/conf/server.xml
#sed -i "s/localhost/`ifconfig eth0 | grep 'inet addr' | awk '{print $2}' | awk -F: '{print $2}'`/g"

cd /opt/install/
rm -rf /opt/install/pinpoint-collector-1.7.3.war
rm -rf /usr/local/collector/apache-tomcat-8.5.31/webapps/ROOT/*
wget https://github.com/naver/pinpoint/releases/download/1.7.3/pinpoint-collector-1.7.3.war
unzip /opt/install/pinpoint-collector-1.7.3.war -d /usr/local/collector/apache-tomcat-8.5.31/webapps/ROOT
sed -i 's/hbase.client.host=localhost/hbase.client.host=zookeeper/g'  /usr/local/collector/apache-tomcat-8.5.31/webapps/ROOT/WEB-INF/classes/hbase.properties
echo "install pinpoint-collector finish"