#!/bin/bash

mkdir -p /usr/local/hbase/
rm -rf /usr/local/hbase/*

cd /opt/install/


wget http://archive.apache.org/dist/hbase/2.0.0/hbase-2.0.0-bin.tar.gz
tar -zxvf hbase-2.0.0-bin.tar.gz .