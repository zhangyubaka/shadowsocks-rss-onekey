#!/bin/bash

echo "One key script by AmedaGintoki@mikelei.me"
echo "Thanks to breakwa11 and clowwindy"

if grep -Eqi "CentOS" /etc/issue; then
    CentOS_Install
elif grep -Eqi "Ubuntu" /etc/issue; then
    Ubuntu_Install
else
    Echo_Red "Your distribution is not supported, please use Ubuntu or CentOS to install"
    exit 1
fi

CentOS_Install()
{
    Echo_Red "Sorry, CentOS is not supported now"
    exit 1
}

Ubuntu_Install()
{
    apt-get update && apt-get upgrade -y
    apt-get install python-pip
    apt-get install m2crypto git
    pip install cymysql
    cd ~/
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git
    Config
}

Config()
{
    Echo_Red "Sorry, function does not finish"
    Echo_Red "For more infomation please go to https://github.com/breakwa11/shadowsocks-rss/wiki/Server-Setup(manyuser)"
    exit 1
}