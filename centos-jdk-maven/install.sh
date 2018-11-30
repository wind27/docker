#!/bin/bash

# 修改 root 用户密码
function _changeRootPassword() {
	echo "update root password ..."
	echo "123456" | passwd root --stdin > /dev/null 2>&1
	echo "update root password finish"
}

# 安装依赖包
function _yumBasePackage() {
	# install tools
	echo "install tools wget telnet vim git net-tools lsof openssh-server openssh-clients unzip zip ..."
	yum -y install wget telnet  vim git net-tools lsof openssh-server openssh-clients unzip zip;
	yum -y groupinstall "fonts"
	echo "install tools wget telnet vim git net-tools lsof openssh-server openssh-clients unzip zip finish !!!"
}

# 系统启动时设置环境变量
function _setJavaPath() {
	mv /opt/install/java_env_var /etc/rc.d/init.d/
}

# 安装JDK， maven
function _install() {
	sh jdk.sh
	sh maven.sh
}

_changeRootPassword
_yumBasePackage
_setJavaPath
_install