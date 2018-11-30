#!/bin/bash
downloan_url='https://artifacts.elastic.co/downloads/logstash/logstash-6.4.0.tar.gz'
install_dir='/usr/local/logstash/'
file_dir='logstash-6.4.0'
downloan_file_name='logstash-6.4.0.tar.gz'


logstash_home=${install_dir}${file_dir}
logstash_md5='a8bf7e7ba6c1a4a0d9867bc770cd8f92';

data_path=/opt/logstash/data/
log_path=/opt/logstash/log/

# init
function _init() {
	chown -R dev.dev /opt
	mkdir -p ${data_path} ${log_path} ${install_dir}
}

# download 
function _download() {
	rm -rf /opt/install/${downloan_file_name}
	wget -P /opt/install/ ${downloan_url}
	md5=`md5sum /opt/install/${downloan_file_name} | awk -F ' ' '{print $1}'`
	if [ $md5 != $logstash_md5 ]; then
		echo "logstash download fail !!!"
		exit -1;
	fi
	echo "logstash download finish !!!"
}

# install
function _install() {
	if [ ! -d ${logstash_home} ]; then
		tar -zxvf /opt/install/${downloan_file_name} -C ${install_dir}
	fi
	cp /opt/install/mysql_es.conf /usr/local/logstash/logstash-6.4.0/config/mysql_es.conf
	chown -R dev.dev ${install_dir}
	chown -R dev.dev /opt/logstash/
	echo "logstash install success !!!"
}
# start
function _start() {
	su dev -c 'sh /usr/local/logstash/logstash-6.4.0/bin/logstash -f /usr/local/logstash/logstash-6.4.0/config/mysql_es.conf &'
	echo "logstash start success !!!"
}

# chkconfig 设置开机启动
function _chkconfig() {
	cd /etc/rc.d/init.d/
	rm -rf /etc/rc.d/init.d/logstash 
	touch /etc/rc.d/init.d/logstash
	chmod +x /etc/rc.d/init.d/logstash
	echo '#!/bin/bash' >> /etc/rc.d/init.d/logstash
	echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/logstash

	echo 'export JAVA_HOME=/usr/java/jdk1.8.0_181-amd64/' >> /etc/rc.d/init.d/jenkins
	echo 'export MAVEN_HOME=/usr/local/maven/apache-maven-3.5.4' >> /etc/rc.d/init.d/jenkins
	echo 'export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin' >> /etc/rc.d/init.d/jenkins

	echo 'su dev -c "sh /usr/local/logstash/logstash-6.4.0/bin/logstash -f /usr/local/logstash/logstash-6.4.0/config/mysql_es.conf &"' >> /etc/rc.d/init.d/logstash
	chkconfig --add logstash
	echo "chkconfig add logstash success"
}

_init
_download
_install
_start
_chkconfig