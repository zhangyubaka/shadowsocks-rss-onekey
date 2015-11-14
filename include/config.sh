#!/bin/bash

Config()
{
    #Config.py
    echo "Please input your mysql IP address"
    read ip
    echo "Please input mysql port"
    read port
    echo "Please input your mysql username"
    read user
    echo "Please input your mysql password of user ${user}"
    read pass
    echo "Please input your database name"
    read db

    #config.json
    echo "Please input the encrypt method you want to use"
    read encrypt
    echo "Please input the protocol you want to use"
    read protocol
    echo "Please input the obfs confusion method you want to use"
    read obfs
    echo "Please input the obfs param you want to use"
    read obfs_param

    rm -f ~/shadowsocks/Config.py
    rm -f ~/shadowsocks/config.json

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

    cat > ~/shadowsocks/config.json << EOF
{
    "server": "0.0.0.0",
    "server_ipv6": "::",
    "server_port": 8388,
    "local_address": "127.0.0.1",
    "local_port": 1080,
    "password": "m",
    "timeout": 120,
    "method": "$encrypt",
    "protocol": "$protocol",
    "obfs": "$obfs",
    "obfs_param": "$obfs_param",
    "dns_ipv6": true,
    "fast_open": true,
    "workers": 1
}
EOF
    echo "Config file is create in ~/shadowsocks/config.json"
}