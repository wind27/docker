#!/bin/bash

#下载 wrapper 
cd /opt/install/
wget -O /opt/install/wrapper-linux-x86-64-3.5.37.tar.gz https://download.tanukisoftware.com/wrapper/3.5.37/wrapper-linux-x86-64-3.5.37.tar.gz
tar -xvf /opt/install/wrapper-linux-x86-64-3.5.37.tar.gz -C /opt/install/

cp /opt/install/wrapper-linux-x86-64-3.5.37/bin/wrapper /opt/server/wind-config/bin/
cp /opt/install/wrapper-linux-x86-64-3.5.37/src/bin/sh.script.in /opt/server/wind-config/bin/run.sh

cp /opt/install/wrapper-linux-x86-64-3.5.37/lib/* /opt/server/wind-config/ext/
cp /opt/install/wrapper.conf /opt/server/wind-config/config/
cp /opt/install/run.sh /opt/server/wind-config/bin/run.sh