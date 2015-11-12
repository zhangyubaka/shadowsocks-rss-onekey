#!/bin/bash

echo "One key script by AmedaGintoki@mikelei.me"
echo "Thanks to breakwa11 and clowwindy"

Get_Distribution()
{
  if grep -i "CentOS" /etc/issue; then
    CentOS_install
  elif grep -i "Ubuntu" /etc/issue; then
    Ubuntu_install
  else
    Echo_Red "Your distribution is not supported, please use Ubuntu or CentOS to install"
    exit 1
  fi
}

CentOS_install()
{
  Echo_Red "Sorry, CentOS is not supported now"
  exit 1
}

Ubuntu_install()
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