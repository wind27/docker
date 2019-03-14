#!/bin/bash

# 安装依赖
function _yumInstall() {
	# 安装pidof
	yum -y install sysvinit-tools
}

# 创建用户和用户组
function _setGroupAndUser() {
	# 创建用户组
	groupadd dev
	# 创建用户
	useradd -g dev dev
	# 修改密码
	echo "123456" | passwd dev --stdin > /dev/null 2>&1
}

# 设置 Jenkins 免密码登录
function _ssh() {
	mkdir -p /home/dev/.ssh/
	rm -rf /home/dev/.ssh/*
	mv /opt/install/authorized_keys  /home/dev/.ssh/
	chown -R dev.dev /home/dev/
	chmod 700 /home/dev/.ssh
	chmod 600 /home/dev/.ssh/authorized_keys
}

# 初始化环境
function _init() {
	# 创建目录
	mkdir -p /opt/workspace/wind-config/ /opt/server/wind-config/ /opt/logs/
	mkdir -p /opt/server/wind-config/bin/ /opt/server/wind-config/conf/ /opt/server/wind-config/lib/ /opt/server/wind-config/ext/ /opt/server/wind-config/config/
	sh /opt/install/wrapper.sh
	chown -R dev.dev /opt/
	
	mkdir -p /etc/rc.d/init.d/
	touch /etc/rc.d/init.d/java_env
	echo 'export JAVA_HOME=/usr/java/jdk1.8.0_181-amd64/' >> /etc/rc.d/init.d/java_env
	echo 'export MAVEN_HOME=/usr/local/maven/apache-maven-3.5.4' >> /etc/rc.d/init.d/java_env
	echo 'export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin' >> /etc/rc.d/init.d/java_env

	touch /etc/rc.d/init.d/wind-config
	echo 'sh /opt/install/restart.sh' >> /etc/rc.d/init.d/wind-config
}

_yumInstall
_setGroupAndUser
_ssh
_init
