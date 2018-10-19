#!/bin/bash
downloan_url='https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.4.0.tar.gz'
install_dir='/usr/local/elasticsearch/'
downloan_file_name='/opt/install/elasticsearch-6.4.0.tar.gz'
elasticsearch_home=/usr/local/elasticsearch/elasticsearch-6.4.0
elasticsearch_md5='5c23c99a52600b250a6871bf6a744e8b';

data_path=/opt/elasticsearch/data/
log_path=/opt/elasticsearch/log/

# init
function _init() {
	chown -R dev.dev /opt
	mkdir -p ${data_path} ${log_path} ${install_dir}
}

# download 
function _download() {
	cp /opt/elasticsearch/elasticsearch-6.4.0.tar.gz /opt/install/elasticsearch-6.4.0.tar.gz
	# rm -rf ${downloan_file_name}
	# wget -P /opt/install/ ${downloan_url}
	md5=`md5sum ${downloan_file_name} | awk -F ' ' '{print $1}'`
	if [ $md5 != $elasticsearch_md5 ]; then
		echo "elasticsearch download fail !!!"
		exit -1;
	fi
	echo "elasticsearch download finish !!!"
}

# install
function _install() {
	if [ ! -d ${elasticsearch_home} ]; then
		tar -zxvf ${downloan_file_name} -C ${install_dir}
	fi
	mv ${elasticsearch_home}/config/elasticsearch.yml ${elasticsearch_home}/config/elasticsearch.yml.bak
	cp /opt/install/elasticsearch.yml ${elasticsearch_home}/config/elasticsearch.yml
	echo "elasticsearch install success !!!"
}

# start
function _start() {
	su dev -c "sh /usr/local/elasticsearch/elasticsearch-6.4.0/bin/elasticsearch -d"
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
	echo 'su dev -c "sh /usr/local/elasticsearch/elasticsearch-6.4.0/bin/elasticsearch -d"' >> /etc/rc.d/init.d/elasticsearch
	chkconfig --add elasticsearch
	echo "chkconfig add elasticsearch success"
}

_init
_download
_install
# _start
_chkconfig