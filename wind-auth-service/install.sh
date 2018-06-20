#!/bin/bash

# 设置 Jenkins 免密码登录
mkdir -p ~/.ssh/
rm -rf ~/.ssh/*
touch ~/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8PTJyTN8bm6EbpSC96D/aXn/DuVp/WQj0SQ6QUeUqKLG4qBLUrSB8Mb899VFGdN4J9e7df2qdfR9DOJbHxKHQzu8nMYLX5Jq0VCNtZVKmEN01FG1yFYvVzq6N2xnUQD4TFO5zKawmxnF+YFhxugp3SJgffskdGaIhMuVvk6WJnWZumAljG+ITn5P7ZiaE5YnaqClSnjmr/VnC4rloLb69lsXbPbe8bBjI7BrYBCkFn70rePXf92OESUVWIKLpVaUAEhvh5cKUPwxHaoCCZLpwqJfJhXQrAXlzE1yUBG9OiXX09MAf3Zq8wfDp/aEyLdoxc/idjNhQGvvrUq+/Umlr root@d25bf626219d' >> ~/.ssh/authorized_keys
chmod -R 600 ~/.ssh/authorized_keys


# 创建目录
mkdir -p /opt/workspace/wind-auth-service/
mkdir -p /opt/server/wind-auth-service/