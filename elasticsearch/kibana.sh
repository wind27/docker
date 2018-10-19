#!/bin/bash
downloan_url='https://artifacts.elastic.co/downloads/kibana/kibana-6.4.0-linux-x86_64.tar.gz'
install_dir='/usr/local/kibana/'
downloan_file_name='/opt/install/kibana-6.4.0-linux-x86_64.tar.gz'
kibana_home=/usr/local/kibana/kibana-6.4.0-linux-x86_64
kibana_md5='1acb0f775fb1c895fa7e1c20035abbae';

data_path=/opt/kibana/data/
log_path=/opt/kibana/log/

# init
function _init() {
	chown -R dev.dev /opt
	mkdir -p ${data_path} ${log_path} ${install_dir}
}

# download 
function _download() {
	cp /opt/elasticsearch/kibana-6.4.0-linux-x86_64.tar.gz /opt/install/kibana-6.4.0-linux-x86_64.tar.gz
	# rm -rf ${downloan_file_name}
	# wget -P /opt/install/ ${downloan_url}
	md5=`md5sum ${downloan_file_name} | awk -F ' ' '{print $1}'`
	if [ $md5 != $kibana_md5 ]; then
		echo "kibana download fail !!!"
		exit -1;
	fi
	echo "kibana download finish !!!"
}

# install
function _install() {
	if [ ! -d ${kibana_home} ]; then
		tar -zxvf ${downloan_file_name} -C ${install_dir}
	fi
	mv ${kibana_home}/config/kibana.yml ${kibana_home}/config/kibana.yml.bak
	cp /opt/install/kibana.yml ${kibana_home}/config/kibana.yml
	echo "kibana install success !!!"
}

# start
function _start() {
	su dev -c 'sh /usr/local/kibana/kibana-6.4.0-linux-x86_64/bin/kibana &'
	echo "kibana start success !!!"
}

# chkconfig 设置开机启动
function _chkconfig() {
	cd /etc/rc.d/init.d/
	rm -rf /etc/rc.d/init.d/kibana 
	touch /etc/rc.d/init.d/kibana
	chmod +x /etc/rc.d/init.d/kibana
	echo '#!/bin/bash' >> /etc/rc.d/init.d/kibana
	echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/kibana
	echo 'su dev -c "sh /usr/local/kibana/kibana-6.4.0-linux-x86_64/bin/kibana &"' >> /etc/rc.d/init.d/kibana
	chkconfig --add kibana
	echo "chkconfig add kibana success"
}

_init
_download
_install
_start
_chkconfig