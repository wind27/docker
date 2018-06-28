#!/bin/bash

mkdir -p /usr/local/jenkins
rm -rf /usr/local/jenkins/*

# download 
if [ ! -d "/opt/install/jenkins-2.107.3-1.1.noarch.rpm" ];then
	wget -P /opt/install/ https://pkg.jenkins.io/redhat-stable/jenkins-2.107.3-1.1.noarch.rpm
fi

# install
jenkins_is_install=`rpm -qa | grep jenkins`
if [ `rpm -qa | grep jenkins |wc -l` -e 0 ];then
	rpm -ivh jenkins-2.107.3-1.1.noarch.rpm
	echo "install jenkins-2.107 finish"
fi
echo "jenkins install list : "