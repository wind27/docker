#!/bin/bash

# install tools
echo "install tools wget telnet vim git net-tools lsof openssh-server openssh-clients..."
yum -y install wget telnet  vim git net-tools lsof openssh-server openssh-clients > /opt/install/mysql_install.log
yum -y groupinstall "fonts" > /opt/install/mysql_install.log
echo "install tools wget telnet vim git net-tools lsof openssh-server openssh-clients finish !!!"

# install mysql
sh /opt/install/mysql.sh

# echo "init database tables finish"

# 设置开机启动
# cd /etc/rc.d/init.d/
# rm -rf /etc/rc.d/init.d/mysql 
# touch /etc/rc.d/init.d/mysql
# chmod +x /etc/rc.d/init.d/mysql
# echo '#!/bin/bash' >> /etc/rc.d/init.d/mysql
# echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/mysql
# echo 'systemctl start mysqld' >> /etc/rc.d/init.d/mysql
# chkconfig --add mysql
# echo 'chkconfig add mysql'