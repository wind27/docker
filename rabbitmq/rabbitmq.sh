#!/bin/bash

# init
function _init() {
	mkdir -p  /opt/data/rabbitmq-server/data /opt/data/rabbitmq-server/log
	chmod -R 777 /opt/data/rabbitmq-server
	yum -y install socat logrotate deltarpm
	cp /opt/install/rabbitmq-erlang.repo /etc/yum.repos.d/
	yum -y install erlang
}

# download 
function _download() {
	rabbitmq_md5='e22e647a38db369064f9ceb23585388a';
	flag=1;
	#while [ flag == 1 ]; do
		if [ ! -f "/opt/install/rabbitmq-server-3.7.7-1.el7.noarch.rpm" ];then
			wget -P /opt/install/ https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.7.7/rabbitmq-server-3.7.7-1.el7.noarch.rpm
		fi
		md5=`md5sum /opt/install/rabbitmq-server-3.7.7-1.el7.noarch.rpm | awk -F ' ' '{print $1}'`
		if [ $md5 == $rabbitmq_md5 ]; then
			flag=0;
		else
			rm -rf /opt/install/rabbitmq-server-3.7.7-1.el7.noarch.rpm
		fi
	#done
	echo "rabbitmq download finish !!!"
}

# install
function _install() {
	rabbitmq_is_install=`rpm -qa | grep rabbitmq |wc -l`
	if [ $rabbitmq_is_install == 0 ];then
		rpm --import https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc
		yum -y install /opt/install/rabbitmq-server-3.7.7-1.el7.noarch.rpm
		cp /opt/install/rabbitmq-env.conf /etc/rabbitmq
		cp /opt/install/rabbitmq.config /etc/rabbitmq
	fi
	echo "rabbitmq install success !!!"
}

# start 
function _start() {
	rabbitmq-server  -detached
	rabbitmq-plugins enable rabbitmq_management

	rabbitmqctl add_user admin admin
	rabbitmqctl set_permissions -p  "/" admin ".*" ".*" ".*"
	rabbitmqctl set_user_tags admin administrator
	rabbitmqctl list_users
	echo "rabbitmq start success !!!"
}

# chkconfig 设置开机启动
function _chkconfig() {
	cd /etc/rc.d/init.d/
	rm -rf /etc/rc.d/init.d/rabbitmq 
	touch /etc/rc.d/init.d/rabbitmq
	chmod +x /etc/rc.d/init.d/rabbitmq
	echo '#!/bin/bash' >> /etc/rc.d/init.d/rabbitmq
	echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/rabbitmq
	echo 'rabbitmq-server' >> /etc/rc.d/init.d/rabbitmq
	chkconfig --add rabbitmq
	echo "chkconfig add rabbitmq success"
}
_init
_download
_install
_start
_chkconfig