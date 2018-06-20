#!/bin/bash

# install apache-maven-3.5.3
echo "install apache-maven-3.5.3 ..."
mkdir -p /usr/local/maven
rm -rf /usr/local/maven/*

cd /opt/install/
rm -rf apache-maven-3.5.3-bin.tar.gz
wget http://mirror.bit.edu.cn/apache/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz
tar -zxvf apache-maven-3.5.3-bin.tar.gz -C /usr/local/maven
mv /usr/local/maven/apache-maven-3.5.3/conf/settings.xml /usr/local/maven/apache-maven-3.5.3/conf/settings.xml.bak
cp /opt/install/settings.xml /usr/local/maven/apache-maven-3.5.3/conf/settings.xml
echo "install apache-maven-3.5.3 finish"

echo "init PATH ..."
echo 'export MAVEN_HOME=/usr/local/maven/apache-maven-3.5.3' >> /etc/profile
echo 'export PATH=$PATH:$MAVEN_HOME/bin' >> /etc/profile 
sleep 1
`source /etc/profile`
sleep 1
echo "init PATH finish"