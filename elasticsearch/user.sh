#!/bin/bash

# 创建用户组
groupadd elasticsearch
	# 创建用户
useradd -g elasticsearch elasticsearch
# 修改密码
echo "123456" | passwd elasticsearch --stdin > /dev/null 2>&1

# 切换用户
su elasticsearch