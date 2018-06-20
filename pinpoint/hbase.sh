#!/bin/bash

mkdir -p /usr/local/hbase/
rm -rf /usr/local/hbase/*

cd /opt/install/
wget http://archive.apache.org/dist/hbase/2.0.0/hbase-2.0.0-bin.tar.gz

tar -zxvf hbase-2.0.0-bin.tar.gz -C /usr/local/hbase/




echo 'export JAVA_HOME=/usr/java/jdk1.8.0_171-amd64/' >> /usr/local/hbase/hbase-2.0.0/conf/hbase-env.sh
echo 'export HBASE_MANAGES_ZK=false' >> /usr/local/hbase/hbase-2.0.0/conf/hbase-env.sh

cp /opt/install/zoo.cfg /usr/local/hbase/hbase-2.0.0/conf/





