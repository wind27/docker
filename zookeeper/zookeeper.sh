#!/bin/bash

# 创建安装目录
echo "install zookeeper-3.4.12 ..."
mkdir -p /usr/local/zookeeper /opt/data/zookeeper /opt/logs/zookeeper
rm -rf /usr/local/zookeeper/* /opt/data/zookeeper/* /opt/logs/zookeeper/*

cd /opt/install/
rm -rf zookeeper-3.4.12.tar.gz
wget http://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.4.12/zookeeper-3.4.12.tar.gz
tar -zxvf zookeeper-3.4.12.tar.gz -C /usr/local/zookeeper
cp zoo.cfg /usr/local/zookeeper/zookeeper-3.4.12/conf
echo "install zookeeper-3.4.12 finish"

echo "init PATH ..."
echo 'export ZK_HOME=/usr/local/zookeeper/zookeeper-3.4.12' >> ~/.bashrc
echo 'export PATH=$PATH:$ZK_HOME/bin' >> ~/.bashrc
source ~/.bashrc
echo "init PATH finish"

# 开机启动
echo "start zookeeper ..."
chmod +x /etc/rc.d/rc.local
chmod +x /opt/install/start.sh
echo 'sh /opt/install/start.sh' >> /etc/rc.d/rc.local
echo "start zookeeper finish"