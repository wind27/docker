#!/bin/bash

downloan_url='http://download.redis.io/releases/redis-4.0.11.tar.gz'
downloan_file_name='redis-4.0.11.tar.gz'
install_dir='/usr/local/redis'
redis_home='/usr/local/redis/redis-4.0.11'
redis_md5='e62d3793f86a6a0021609c9f905cb960';

# init
function _init() {
	mkdir -p /usr/local/redis
	rm -rf /usr/local/redis/*
	rm -rf /opt/install/${downloan_file_name}
}

# download 
function _download() {
	wget -P /opt/install/ ${downloan_url}
	md5=`md5sum /opt/install/${downloan_file_name} | awk -F ' ' '{print $1}'`
	if [ $md5 != $redis_md5 ]; then
		echo "redis download fail !!!"
		exit -1
	fi
	echo "redis download finish !!!"
}

# install
function _install() {
	if [ ! -d /usr/local/redis/redis-3.4.12/ ]; then
		tar -zxvf /opt/install/${downloan_file_name} -C /usr/local/redis
		cd /usr/local/redis/redis-4.0.11/src/
		make install
	fi
	echo "redis install success !!!"
}

# start redis
function _start() {
	${redis_home}/src/redis-server ${redis_home}/redis.conf &
	echo "redis start success !!!"
}

# chkconfig 设置开机启动
function _chkconfig() {
	cd /etc/rc.d/init.d/
	rm -rf /etc/rc.d/init.d/redis 
	touch /etc/rc.d/init.d/redis
	chmod +x /etc/rc.d/init.d/redis
	echo "#!/bin/bash" >> /etc/rc.d/init.d/redis
	echo "# chkconfig: 12345 95 05" >> /etc/rc.d/init.d/redis
	echo 'su - dev -c "/usr/local/redis/redis-4.0.11/src/redis-server /usr/local/redis/redis-4.0.11/redis.conf &"' >> /etc/rc.d/init.d/redis
	chkconfig --add redis
	echo "chkconfig add redis success"
}

_init
_download
_install
_start
_chkconfig