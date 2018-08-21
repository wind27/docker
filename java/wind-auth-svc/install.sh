#!/bin/bash

# 设置 Jenkins 免密码登录
mkdir -p ~/.ssh/
rm -rf ~/.ssh/*
touch ~/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwmmQYPvQvzKgeCaR1Km+7/wAyAiMO0bwFNwMldrzrE1JSRot/dOOSz+YFsrHHCUUzV9d9f5z9+rabwy8WBSdg/Z6Anmvme9RPlX+Z1S4a/YIeuJhYlFDr+G6Sf9A2H+ZlE77KnGZxy4t3VBqknMluZelKkBaqwlOr4UQFHPcQvbeum7xvSy2KdtnGGqq8XC/8QhC3QDCP9h90G6wCKsil+O0yqmprhxUrp06m2OpTcS4PdZjQHjycaUw8moWcY6d8rcaz43G5xmau3ZuwczY35nhD70ZJySA5zO+c0AZj9sEoPj6UWbiCkPJXP/uupPPUknX5VLgWKJqgfA4ZZKrd root@1231ab808f93' >> ~/.ssh/authorized_keys
chmod -R 600 ~/.ssh/authorized_keys


# 创建目录
mkdir -p /opt/workspace/wind-auth-svc/
mkdir -p /opt/server/wind-auth-svc/