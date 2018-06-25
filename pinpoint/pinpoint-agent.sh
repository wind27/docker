#!/bin/bash

echo "install pinpoint-agent ..."
mkdir -p /usr/local/agent/
rm -rf /usr/local/agent/*
rm -rf /opt/install/apache-tomcat-8.5.31.tar.gz

cd /opt/install/
wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz
tar -zxvf apache-tomcat-8.5.31.tar.gz -C /usr/local/agent/

cd /opt/install/
rm -rf /usr/local/agent/apache-tomcat-8.5.31/webapps/ROOT/*
wget https://github.com/naver/pinpoint/releases/download/1.7.3/pinpoint-agent-1.7.3.tar.gz
tar -zxvf /opt/install/pinpoint-agent-1.7.3.tar.gz -C /usr/local/agent/apache-tomcat-8.5.31/webapps/ROOT




echo "init PATH ..."
echo 'export AGENT_PATH=/usr/local/agent/apache-tomcat-8.5.31/webapps/ROOT/' >> ~/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc
source ~/.bashrc




echo 'CATALINA_OPTS="$CATALINA_OPTS -javaagent:$AGENT_PATH/pinpoint-bootstrap-$VERSION.jar"' >> /usr/local/agent/apache-tomcat-8.5.31/bin/catalina.sh
echo 'CATALINA_OPTS="$CATALINA_OPTS -Dpinpoint.agentId=$AGENT_ID"' >> /usr/local/agent/apache-tomcat-8.5.31/bin/catalina.sh
echo 'CATALINA_OPTS="$CATALINA_OPTS -Dpinpoint.applicationName=$APPLICATION_NAME"' >> /usr/local/agent/apache-tomcat-8.5.31/bin/catalina.sh
echo "install pinpoint-agent finish"