#!/bin/bash

downloan_url='https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.7.7/rabbitmq-server-3.7.7-1.el7.noarch.rpm'
downloan_file_name='rabbitmq-server-3.7.7-1.el7.noarch.rpm'
rabbitmq_md5='e22e647a38db369064f9ceb23585388a';
rabbitmq_release_signing_key_url='https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc'

# init
function _init() {
	mkdir -p  /opt/rabbitmq-server/data /opt/rabbitmq-server/log
	chmod -R 777 /opt/rabbitmq-server
	yum -y install socat logrotate deltarpm
	cp /opt/install/rabbitmq-erlang.repo /etc/yum.repos.d/
	yum -y install erlang
}

# download 
function _download() {
	rm -rf /opt/install/${downloan_file_name}	
	wget -P /opt/install/ ${downloan_url}
	md5=`md5sum /opt/install/${downloan_file_name} | awk -F ' ' '{print $1}'`
	if [ $md5 != $rabbitmq_md5 ]; then
		echo "download fail !!!"
		exit -1;
	fi
	#done
	echo "rabbitmq download finish !!!"
}

# install
function _install() {
	rabbitmq_is_install=`rpm -qa | grep rabbitmq |wc -l`
	if [ $rabbitmq_is_install == 0 ];then
		rpm --import ${rabbitmq_release_signing_key_url}
		yum -y install /opt/install/${downloan_file_name}
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