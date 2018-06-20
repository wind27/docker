#!/bin/bash

rm -rf /usr/local/jenkins/*
mkdir -p /usr/local/jenkins

# download mysql yum repo and install mysql
cd /opt/install/
rm -rf jenkins-2.107.3-1.1.noarch.rpm
wget https://pkg.jenkins.io/redhat-stable/jenkins-2.107.3-1.1.noarch.rpm

echo "install jenkins-2.107 ..."
rpm -ivh jenkins-2.107.3-1.1.noarch.rpm
rm -rf jenkins-2.107.3-1.1.noarch.rpm
echo "install jenkins-2.107 finish"