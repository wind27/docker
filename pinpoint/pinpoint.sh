#!/bin/bash

echo "init pinpoint ..."
cd /opt/install/
# git clone https://github.com/naver/pinpoint.git
# tar -zxvf pinpoint.tar.gz
wget https://github.com/naver/pinpoint/releases/download/1.7.3/pinpoint-agent-1.7.3.tar.gz
wget https://github.com/naver/pinpoint/releases/download/1.7.3/pinpoint-collector-1.7.3.war
wget https://github.com/naver/pinpoint/releases/download/1.7.3/pinpoint-web-1.7.3.war
echo "clone download finish"

cd pinpoint
mvn install -Dmaven.test.skip=true
#sh mvnw install -Prelease -Dmaven.test.skip=true


cd /opt/install/
rm -rf apache-tomcat-8.5.31.tar.gz
wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz



