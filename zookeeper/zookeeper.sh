#!/bin/bash

downloan_url='http://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.4.12/zookeeper-3.4.12.tar.gz'
downloan_file_name='zookeeper-3.4.12.tar.gz'
install_dir='/usr/local/zookeeper'
zookeeper_home='/usr/local/zookeeper/zookeeper-3.4.12'
zookeeper_md5='f43cca610c2e041c71ec7687cddbd0c3';

# init
function _init() {
	mkdir -p /usr/local/zookeeper
	rm -rf /usr/local/zookeeper/*
	rm -rf /opt/install/${downloan_file_name}
}

# download 
function _download() {
	wget -P /opt/install/ ${downloan_url}
	md5=`md5sum /opt/install/${downloan_file_name} | awk -F ' ' '{print $1}'`
	if [ $md5 != $zookeeper_md5 ]; then
		echo "zookeeper download fail !!!"
		exit -1
	fi
	echo "zookeeper download finish !!!"
}

# install
function _install() {
	if [ ! -d /usr/local/zookeeper/zookeeper-3.4.12/ ]; then
		tar -zxvf /opt/install/${downloan_file_name} -C /usr/local/zookeeper
	fi
	cp /opt/install/zoo.cfg ${zookeeper_home}/conf/
	echo "zookeeper install success !!!"
}

# start zookeeper
function _start() {
	sh ${zookeeper_home}/bin/zkServer.sh start
	echo "zookeeper start success !!!"
}

# chkconfig 设置开机启动
function _chkconfig() {
	cd /etc/rc.d/init.d/
	rm -rf /etc/rc.d/init.d/zookeeper 
	touch /etc/rc.d/init.d/zookeeper
	chmod +x /etc/rc.d/init.d/zookeeper
	echo "#!/bin/bash" >> /etc/rc.d/init.d/zookeeper
	echo "# chkconfig: 12345 95 05" >> /etc/rc.d/init.d/zookeeper

	echo 'export JAVA_HOME=/usr/java/jdk1.8.0_181-amd64/' >> /etc/rc.d/init.d/jenkins
	echo 'export MAVEN_HOME=/usr/local/maven/apache-maven-3.5.4' >> /etc/rc.d/init.d/jenkins
	echo 'export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin' >> /etc/rc.d/init.d/jenkins

	echo "sh ${zookeeper_home}/bin/zkServer.sh start" >> /etc/rc.d/init.d/zookeeper
	chkconfig --add zookeeper
	echo "chkconfig add zookeeper success"
}

_init
_download
_install
_start
_chkconfig