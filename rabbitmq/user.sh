#!/bin/bash

# 创建用户组
groupadd rabbitmq
	# 创建用户
useradd -g rabbitmq rabbitmq
# 修改密码
echo "123456" | passwd rabbitmq --stdin > /dev/null 2>&1