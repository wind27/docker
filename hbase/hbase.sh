#!/bin/bash

# download 
function hbase_download() {
	hbase_md5='398d89ad29facaf4998edecb9b4729d3';
	flag=1;
	#while [ flag == 1 ]; do
		if [ ! -f "/opt/install/hbase-2.0.0-bin.tar.gz" ];then
			wget -P /opt/install/ wget http://archive.apache.org/dist/hbase/2.0.0/hbase-2.0.0-bin.tar.gz
		fi
		md5=`md5sum /opt/install/hbase-2.0.0-bin.tar.gz | awk -F ' ' '{print $1}'`
		if [ $md5 == $hbase_md5 ]; then
			flag=0;
		else
			rm -rf /opt/install/hbase-2.0.0-bin.tar.gz
		fi
	#done
	echo "hbase download finish !!!"
}

# install
function hbase_install() {
	if [ ! -d /usr/local/hbase/hbase-2.0.0 ]; then
		rm -rf /usr/local/hbase/*
		tar -zxvf /opt/install/hbase-2.0.0-bin.tar.gz -C /usr/local/hbase
	fi
	cp /opt/install/zoo.cfg /usr/local/hbase/hbase-2.0.0/conf/
	cp /opt/install/hbase-site.xml /usr/local/hbase/hbase-2.0.0/conf/
	echo "hbase install success !!!"
	echo 'export JAVA_HOME=/usr/java/jdk1.8.0_171-amd64/' >> /usr/local/hbase/hbase-2.0.0/conf/hbase-env.sh
	echo 'export HBASE_MANAGES_ZK=false' >> /usr/local/hbase/hbase-2.0.0/conf/hbase-env.sh
	echo "init hbase finish";
}

# start hbase
function hbase_start() {
	sh /usr/local/hbase/hbase-2.0.0/bin/start-hbase.sh start
	sh /usr/local/hbase/hbase-2.0.0/bin/hbase shell /opt/install/hbase-create.hbase # 初始化数据表
	echo "init hbase data finish"
}

# chkconfig 设置开机启动
function hbase_chkconfig() {
	cd /etc/rc.d/init.d/
	rm -rf /etc/rc.d/init.d/hbase 
	touch /etc/rc.d/init.d/hbase
	chmod +x /etc/rc.d/init.d/hbase
	echo '#!/bin/bash' >> /etc/rc.d/init.d/hbase
	echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/hbase
	echo 'sh /usr/local/hbase/hbase-2.0.0/bin/start-hbase.sh start' >> /etc/rc.d/init.d/hbase
	chkconfig --add hbase
	echo "chkconfig add hbase success"
}


mkdir -p /usr/local/hbase/ /opt/data/hbase/zookeeper/
rm -rf /usr/local/hbase/*


hbase_download
hbase_install
hbase_start
hbase_chkconfig