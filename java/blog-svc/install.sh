#!/bin/bash

# 创建用户和用户组
function _setGroupAndUser() {
	# 创建用户组
	groupadd dev
	# 创建用户
	useradd -g dev dev
	# 修改密码
	echo "123456" | passwd dev --stdin > /dev/null 2>&1
}

# 初始化环境
function _init() {
	# 创建目录
	mkdir -p /opt/workspace/blog-svc/
	mkdir -p /opt/server/blog-svc/
	mkdir -p /usr/local/filebeat/

	chown -R dev.dev /opt/
	chown -R dev.dev /usr/local/filebeat/
}

# 设置 Jenkins 免密码登录
function _ssh() {
	mkdir -p /home/dev/.ssh/
	mv /opt/install/authorized_keys /home/dev/.ssh/
	chmod -R 600 /home/dev/.ssh/authorized_keys
}

function _env() {
	touch /etc/rc.d/init.d/java_env
	echo 'export JAVA_HOME=/usr/java/jdk1.8.0_181-amd64/' >> /etc/rc.d/init.d/java_env
	echo 'export MAVEN_HOME=/usr/local/maven/apache-maven-3.5.4' >> /etc/rc.d/init.d/java_env
	echo 'export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin' >> /etc/rc.d/init.d/java_env
}

_setGroupAndUser
_init
_ssh
_env