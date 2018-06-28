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

# 设置开机启动
cd /etc/rc.d/init.d/
rm -rf /etc/rc.d/init.d/zookeeper 
touch /etc/rc.d/init.d/zookeeper
chmod +x /etc/rc.d/init.d/zookeeper
echo '#!/bin/bash' >> /etc/rc.d/init.d/zookeeper
echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/zookeeper
echo 'sh /usr/local/zookeeper/zookeeper-3.4.12/bin/zkServer.sh start' >> /etc/rc.d/init.d/zookeeper
chkconfig --add zookeeper
echo "chkconfig add zookeeper"

# 启动 zookeeper
sh /usr/local/zookeeper/zookeeper-3.4.12/bin/zkServer.sh start
echo "start zookeeper"