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

# 设置开机启动
cd /etc/rc.d/init.d/
rm -rf /etc/rc.d/init.d/hbase 
touch /etc/rc.d/init.d/hbase
chmod +x /etc/rc.d/init.d/hbase
echo '#!/bin/bash' >> /etc/rc.d/init.d/hbase
echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/hbase
echo 'sh /usr/local/hbase/hbase-2.0.0/bin/start-hbase.sh start' >> /etc/rc.d/init.d/hbase
chkconfig --add hbase
echo 'chkconfig add hbase'

# 启动 hbase
sh /usr/local/hbase/hbase-2.0.0/bin/start-hbase.sh start
echo "start hbase finish"

# 初始化数据表
hbase shell /opt/install/hbase-create.hbase 
echo "init hbase data finish"