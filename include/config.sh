#!/bin/bash

echo "Please input your mysql ip and press [Enter]"
read ip
echo "Please input mysql port and press [Enter]"
read port
echo "Please input your mysql user and press [Enter]"
read user
echo "Please input your mysql password and press [Enter]"
read pass
echo "Please input the db name and press [Enter]"
read db
rm -f ~/shadowsocks/Config.py
cat > ~/shadowsocks/Config.py << EOF
#Config
MYSQL_HOST = '$ip'
MYSQL_PORT = $port
MYSQL_USER = '$user'
MYSQL_PASS = '$pass'
MYSQL_DB = '$db'

MANAGE_PASS = 'ss233333333'
#if you want manage in other server you should set this value to global ip
MANAGE_BIND_IP = '127.0.0.1'
#make sure this port is idle
MANAGE_PORT = 23333
EOF
echo "Config file is create in ~/shadowsocks/Config.py"