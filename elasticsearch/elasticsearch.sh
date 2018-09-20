#!/bin/bash
downloan_url='https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.4.0.tar.gz'
install_dir='/usr/local/elasticsearch/'
downloan_file_name='elasticsearch-6.4.0.tar.gz'

elasticsearch_home=${install_dir}${downloan_file_name}
elasticsearch_md5='5c23c99a52600b250a6871bf6a744e8b';

data_path=/opt/elasticsearch/data/
log_path=/opt/elasticsearch/log/

# init
function _init() {
	# rm -rf ${data_path} ${log_path}
	mkdir -p ${data_path} ${log_path} ${install_dir}
}

# download 
function _download() {
	rm -rf /opt/install/${downloan_file_name}
	wget -P /opt/install/ ${downloan_url}
	md5=`md5sum /opt/install/${downloan_file_name} | awk -F ' ' '{print $1}'`
	if [ $md5 != $elasticsearch_md5 ]; then
		echo "elasticsearch download fail !!!"
		exit -1;
	fi
	echo "elasticsearch download finish !!!"
}

# install
function _install() {
	if [ ! -d ${elasticsearch_home} ]; then
		tar -zxvf /opt/install/${downloan_file_name} -C ${install_dir}
	fi
	echo "elasticsearch install success !!!"
}

# start
function _start() {
	/usr/local/elasticsearch/elasticsearch-6.4.0/bin/elasticsearch
	echo "elasticsearch start success !!!"
}

# chkconfig 设置开机启动
function _chkconfig() {
	cd /etc/rc.d/init.d/
	rm -rf /etc/rc.d/init.d/elasticsearch 
	touch /etc/rc.d/init.d/elasticsearch
	chmod +x /etc/rc.d/init.d/elasticsearch
	echo "#!/bin/bash" >> /etc/rc.d/init.d/elasticsearch
	echo "# chkconfig: 12345 95 05" >> /etc/rc.d/init.d/elasticsearch
	echo "/usr/local/elasticsearch/elasticsearch-6.4.0/bin/elasticsearch" >> /etc/rc.d/init.d/elasticsearch
	chkconfig --add elasticsearch
	echo "chkconfig add elasticsearch success"
}

_init
_download
_install
_start
_chkconfig