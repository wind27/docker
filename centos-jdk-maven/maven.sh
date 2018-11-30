#!/bin/bash

downloan_url='http://mirrors.hust.edu.cn/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz'
downloan_file_name='apache-maven-3.5.4-bin.tar.gz'
install_dir='/usr/local/maven'
maven_home='/usr/local/maven/apache-maven-3.5.4'
maven_md5='89eea39183139e5f8a0c1601d495b3b6';

function _init() {
	mkdir -p /usr/local/maven
	rm -rf /usr/local/maven/*
	rm -rf /opt/install/${downloan_file_name}
}

# download 
function _download() {
	
	wget -P /opt/install/ ${downloan_url}
	md5=`md5sum /opt/install/${downloan_file_name} | awk -F ' ' '{print $1}'`
	if [ $md5 != $maven_md5 ]; then
		echo "maven download fail !!!"
		exit -1
	fi
	echo "maven download finish !!!"
}

# install
function _install() {
	tar -zxvf /opt/install/${downloan_file_name} -C /usr/local/maven
	mv ${maven_home}/conf/settings.xml ${maven_home}/conf/settings.xml.bak
	cp /opt/install/settings.xml ${maven_home}/conf/settings.xml
	echo "maven install success !!!"
}

_init
_download
_install