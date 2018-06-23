#!/bin/bash

#sh hbase.sh
#sh pinpoint.sh

echo "init PATH ..."
echo 'export JAVA_HOME=/usr/java/jdk1.8.0_171-amd64/' >> ~/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc
source ~/.bashrc
echo "init PATH finish"

sh /opt/install/hbase.sh