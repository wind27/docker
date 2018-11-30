#!/bin/bash

# 设置 Jenkins 免密码登录
mkdir -p ~/.ssh/
rm -rf ~/.ssh/*
mv /opt/install/authorized_keys  ~/.ssh/
chmod -R 600 ~/.ssh/authorized_keys

# 创建目录
mkdir -p /opt/workspace/wind-rabbitmq/
mkdir -p /opt/server/wind-auth-rabbitmq/

mkdir /etc/rc.d/init.d/java_env
echo 'export JAVA_HOME=/usr/java/jdk1.8.0_181-amd64/' >> /etc/rc.d/init.d/java_env
echo 'export MAVEN_HOME=/usr/local/maven/apache-maven-3.5.4' >> /etc/rc.d/init.d/java_env
echo 'export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin' >> /etc/rc.d/init.d/java_env