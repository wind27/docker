#!/bin/bash

# download mysql yum repo and install mysql
mkdir -p /opt/install/
cd /opt/install/
rm -rf jenkins-2.107.3-1.1.noarch.rpm
wget https://pkg.jenkins.io/redhat-stable/jenkins-2.107.3-1.1.noarch.rpm

echo "install jenkins-2.107 ..."
rpm -ivh jenkins-2.107.3-1.1.noarch.rpm
echo "install jenkins-2.107 finish"

echo "start jenkins ..."
nohup java -jar /usr/lib/jenkins/jenkins.war --ajp13Port=-1 --httpPort=8082 &  
echo "start jenkins finish"