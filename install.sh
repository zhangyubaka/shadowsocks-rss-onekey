#!/bin/bash

echo "One key script by AmedaGintoki@mikelei.me"
echo "Thanks to breakwa11 and clowwindy"

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if grep -Eqi "Arch Linux" /etc/issue; then
    ins="Archlinux"
elif grep -Eqi "CentOS" /etc/issue; then
    ins="CentOS"
elif grep -Eqi "Ubuntu" /etc/issue; then
    ins="Ubuntu"
elif grep -Eqi "Debian" /etc/issue; then
    ins="Debian"
elif grep -Eqi "Debian" /etc/issue; then
    ins="Debian"
elif grep -Eqi "gentoo" /proc/version; then
    ins="Gentoo"
else
    echo "Your distribution is not supported, please use Ubuntu or CentOS or Archlinux or Gentoo or Debian to install"
    exit 1
fi

Archlinux_Install()
{
    pacman -Syu --noconfirm
    pacman -S python-pip git --noconfirm
    pip install cymysql
    pip install m2crypto
    cd ~/
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git
}

Gentoo_Install()
{
    emerge --sync
    emerge dev-vcs/git dev-python/pip
    pip install cymysql
    pip install m2crypto
    cd ~/
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git
}

CentOS_Install()
{
    yum -y update
    yum -y install epel-release
    yum -y install python-pip
    yum -y install m2crypto git
    pip install cymysql
    cd ~/
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git
}


Ubuntu_Install()
{
    apt-get update && apt-get upgrade -y
    apt-get install python-pip -y
    apt-get install m2crypto git -y
    pip install cymysql
    cd ~/
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git
}

Debian_Install()
{
    apt-get update && apt-get upgrade -y
    apt-get install python-pip -y
    apt-get install m2crypto git -y
    pip install cymysql
    cd ~/
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git
}

Config()
{
    echo "Please enter your sever ip and press [Enter]"
    read ip
    echo "Please enter your password and press [Enter]"
    read pass
    echo "Please enter server port and press [Enter]"
    read port
    echo "Please enter the ciper and press [Enter]"
    read ciper
    cat > /etc/shadowsocks.json << "EOF"
    {
    "server":"$ip",
    "server_port":$port,
    "local_address":"127.0.0.1",
    "local_port":1080,
    "password":"$pass",
    "timeout":300,
    "method":"$ciper",
    "workers":1
    }
    EOF
    echo "Config file is create in /etc/shadowsocks.json and local port is 1080"
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
    Debian)
        Debian_Install
        Config
        ;;
    Gentoo)
        Gentoo_Install
        Config
        ;;
esac
