#!/bin/bash

# 设置 Jenkins 免密码登录
mkdir -p ~/.ssh/
rm -rf ~/.ssh/*
mv /opt/install/authorized_keys  ~/.ssh/
chmod -R 600 ~/.ssh/authorized_keys

# 创建目录
mkdir -p /opt/workspace/wind-eureka/
mkdir -p /opt/server/wind-auth-eureka/