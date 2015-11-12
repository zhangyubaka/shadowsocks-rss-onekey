#!/bin/bash

echo "One key script by AmedaGintoki@mikelei.me"
echo "Thanks to breakwa11 and clowwindy"

if grep "Arch Linux" /etc/issue; then
    ins="Archlinux"
elif grep -Eqi "CentOS" /etc/issue; then
    ins="CentOS"
elif grep -Eqi "Ubuntu" /etc/issue; then
    ins="Ubuntu"
else
    echo "Your distribution is not supported, please use Ubuntu or CentOS or Archlinux to install"
    exit 1
fi

Archlinux_Install()
{
    pacman -Syu --noconfirm
    pacman -S python-pip git
    pip install cymysql
    pip install m2crypto
    cd ~/
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git
}

CentOS_Install()
{
    echo "Sorry, CentOS is not supported now"
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
}

Config()
{
    echo "Sorry, function does not finish"
    echo "For more infomation please go to https://github.com/breakwa11/shadowsocks-rss/wiki/Server-Setup(manyuser)"
    exit 1
}

case "${ins}" in
    CentOS)
        CentOS_Install
        Config
        ;;
    Ubuntu)
        Ubuntu_Install
        Config
        ;;
    Archlinux)
        Archlinux_Install
        Config
        ;;
esac
