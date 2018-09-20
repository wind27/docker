#!/bin/bash

# install tools
echo "install tools wget telnet vim git net-tools lsof openssh-server openssh-clients..."
yum -y install wget telnet  vim git net-tools lsof openssh-server openssh-clients > /opt/install/mysql_install.log
yum -y groupinstall "fonts" > /opt/install/mysql_install.log
echo "install tools wget telnet vim git net-tools lsof openssh-server openssh-clients finish !!!"

# install mysql
sh /opt/install/user.sh

sh /opt/install/mysql.sh