#!/bin/bash

# install jdk8
echo "install jdk8 ..."
cd /opt/install/
rm -rf jdk-8u171-linux-x64.rpm
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.rpm
rpm -ivh jdk-8u171-linux-x64.rpm
echo "install jdk8 finish"