#!/bin/bash

# 安装 hbase

echo "init hbase ...";
mkdir -p /usr/local/hbase/ /opt/data/hbase/zookeeper/
rm -rf /usr/local/hbase/*
rm -rf /opt/install/hbase-2.0.0-bin.tar.gz

cd /opt/install/
wget http://archive.apache.org/dist/hbase/2.0.0/hbase-2.0.0-bin.tar.gz
tar -zxvf hbase-2.0.0-bin.tar.gz -C /usr/local/hbase/
cp /opt/install/zoo.cfg /usr/local/hbase/hbase-2.0.0/conf/
cp /opt/install/hbase-site.xml /usr/local/hbase/hbase-2.0.0/conf/
echo 'export JAVA_HOME=/usr/java/jdk1.8.0_171-amd64/' >> /usr/local/hbase/hbase-2.0.0/conf/hbase-env.sh
echo 'export HBASE_MANAGES_ZK=false' >> /usr/local/hbase/hbase-2.0.0/conf/hbase-env.sh
echo "init hbase finish";

echo "init PATH ..."
echo 'export HBASE_HOME=/usr/local/hbase/hbase-2.0.0/' >> ~/.bashrc
echo 'export PATH=$PATH:$HBASE_HOME/bin' >> ~/.bashrc
source ~/.bashrc
echo "init PATH finish"