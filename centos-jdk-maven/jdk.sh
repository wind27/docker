#!/bin/bash

downloan_url='http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.rpm'
downloan_file_name='jdk-8u181-linux-x64.rpm'

jdk_md5='e7c0593a310b83b4ca69ea22f850c71f';

function _init() {
	rm -rf /opt/install/${downloan_file_name}
}

# download 
function _download() {
	wget  -P /opt/install/ --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" ${downloan_url}
	md5=`md5sum /opt/install/${downloan_file_name} | awk -F ' ' '{print $1}'`
	if [ $md5 != $jdk_md5 ]; then
		echo "jdk download fail !!!"
		exit -1
	fi
	echo "jdk download finish !!!"
}

# install
function _install() {
	rpm -ivh /opt/install/${downloan_file_name}
	echo "jdk install success !!!"
}

_init
_download
_install




















