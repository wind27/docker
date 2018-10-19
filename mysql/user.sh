#!/bin/bash

# 创建用户组
groupadd mysql
	# 创建用户
useradd -g mysql mysql
# 修改密码
echo "123456" | passwd mysql --stdin > /dev/null 2>&1