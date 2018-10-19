#!/bin/bash
downloan_url='https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.4.0-linux-x86_64.tar.gz'
install_dir='/usr/local/filebeat/'
file_dir='filebeat-6.4.0'
downloan_file_name='filebeat-6.4.0-linux-x86_64.tar.gz'


filebeat_home=${install_dir}${file_dir}
filebeat_md5='12c6219d3c07e3d72cead2e89b7d453c';

data_path=/opt/filebeat/data/
log_path=/opt/filebeat/log/

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
	if [ $md5 != $filebeat_md5 ]; then
		echo "filebeat download fail !!!"
		exit -1;
	fi
	echo "filebeat download finish !!!"
}

# install
function _install() {
	if [ ! -d ${filebeat_home} ]; then
		tar -zxvf /opt/install/${downloan_file_name} -C ${install_dir}
	fi
	su dev
	echo "filebeat install success !!!"
}

# start
function _start() {
	su dev -c 'nohup sh /usr/local/filebeat/filebeat-6.4.0-linux-x86_64/filebeat &'
	echo "filebeat start success !!!"
}

# chkconfig 设置开机启动
function _chkconfig() {
	cd /etc/rc.d/init.d/
	rm -rf /etc/rc.d/init.d/filebeat 
	touch /etc/rc.d/init.d/filebeat
	chmod +x /etc/rc.d/init.d/filebeat
	echo "#!/bin/bash" >> /etc/rc.d/init.d/filebeat
	echo "# chkconfig: 12345 95 05" >> /etc/rc.d/init.d/filebeat
	echo 'su dev -c "nohup sh /usr/local/filebeat/filebeat-6.4.0-linux-x86_64/filebeat &"' >> /etc/rc.d/init.d/filebeat
	chkconfig --add filebeat
	echo "chkconfig add filebeat success"
}

_init
_download
_install
_start
_chkconfig