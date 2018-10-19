#!/bin/bash

echo "restart mysql ..."
su mysql -c 'systemctl restart mysqld'
echo "restart mysql finish"