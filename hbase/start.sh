#!/bin/bash

echo "start hbase and init ..."
ps -efww|grep -w 'hbase-daemon'|grep -v grep|cut -c 9-15 |  xargs kill -9
start-hbase.sh
hbase shell /opt/install/hbase-create.hbase 
echo "start hbase and init finish"