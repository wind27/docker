#!/bin/bash

# install tools
echo "install tools wget telnet vim git net-tools lsof openssh-server openssh-clients..."
yum -y install wget telnet  vim git net-tools lsof openssh-server openssh-clients openssl
yum -y groupinstall "fonts"
echo "install tools wget telnet vim git net-tools lsof openssh-server openssh-clients finish !!!"

# install nginx
sh /opt/install/nginx.sh