#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

Advanced_Encryption_ArchLinux()
{
	pacman -Syu --noconfirm
	pacman -S libsodium
	ldconfig
	exit 1
}

Advanced_Encryption_CentOS()
{
	yum -y groupinstall 'Development Tools'
	cd ~/
	wget https://github.com/jedisct1/libsodium/releases/download/1.0.6/libsodium-1.0.6.tar.gz
	tar xf libsodium-1.0.6.tar.gz && cd libsodium-1.0.6
	./configure && make -j2 && make install
	ldconfig
	exit 1
}

Advanced_Encryption_Debian()
{
	apt-get install build-essential -y
	cd ~/
	wget https://github.com/jedisct1/libsodium/releases/download/1.0.6/libsodium-1.0.6.tar.gz
	tar xf libsodium-1.0.6.tar.gz && cd libsodium-1.0.6
	./configure && make -j2 && make install
	ldconfig
	exit 1
}

Advanced_Encryption_Gentoo()
{
	emerge --sync
	emerge dev-libs/libsodium
	env-update
	ldconfig
	exit 1
}

Advanced_Encryption_Ubuntu()
{
	apt-get install build-essential -y
	cd ~/
	wget https://github.com/jedisct1/libsodium/releases/download/1.0.6/libsodium-1.0.6.tar.gz
	tar xf libsodium-1.0.6.tar.gz && cd libsodium-1.0.6
	./configure && make -j2 && make install
	ldconfig
	exit 1
}