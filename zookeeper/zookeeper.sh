#!/bin/bash


# download 
function zookeeper_download() {
	zookeeper_md5='f43cca610c2e041c71ec7687cddbd0c3';
	flag=1;
	#while [ flag == 1 ]; do
		if [ ! -f "/opt/install/zookeeper-3.4.12.tar.gz" ];then
			wget -P /opt/install/ http://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.4.12/zookeeper-3.4.12.tar.gz
		fi
		md5=`md5sum /opt/install/zookeeper-3.4.12.tar.gz | awk -F ' ' '{print $1}'`
		if [ $md5 == $zookeeper_md5 ]; then
			flag=0;
		else
			rm -rf /opt/install/zookeeper-3.4.12.tar.gz
		fi
	#done
	echo "zookeeper download finish !!!"
}

# install
function zookeeper_install() {
	if [ ! -d /usr/local/zookeeper/zookeeper-3.4.12/ ]; then
		rm -rf /usr/local/zookeeper/*
		mkdir -p /usr/local/zookeeper
		tar -zxvf /opt/install/zookeeper-3.4.12.tar.gz -C /usr/local/zookeeper
	fi
	cp /opt/install/zoo.cfg /usr/local/zookeeper/zookeeper-3.4.12/conf/
	echo "zookeeper install success !!!"
}

# start zookeeper
function zookeeper_start() {
	sh /usr/local/zookeeper/zookeeper-3.4.12/bin/zkServer.sh start
	echo "zookeeper start success !!!"
}

# chkconfig 设置开机启动
function zookeeper_chkconfig() {
	cd /etc/rc.d/init.d/
	rm -rf /etc/rc.d/init.d/zookeeper 
	touch /etc/rc.d/init.d/zookeeper
	chmod +x /etc/rc.d/init.d/zookeeper
	echo '#!/bin/bash' >> /etc/rc.d/init.d/zookeeper
	echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/zookeeper
	echo 'sh /usr/local/zookeeper/zookeeper-3.4.12/bin/zkServer.sh start' >> /etc/rc.d/init.d/zookeeper
	chkconfig --add zookeeper
	echo "chkconfig add zookeeper success"
}

zookeeper_download
zookeeper_install
zookeeper_start
zookeeper_chkconfig