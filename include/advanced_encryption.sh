#!bin/bash

Advanced_Encryption_ArchLinux()
{

}

Advanced_Encryption_CentOS()
{

}

Advanced_Encryption_Debian()
{
apt-get install build-essential -y
cd ~/
wget https://github.com/jedisct1/libsodium/releases/download/1.0.1/libsodium-1.0.1.tar.gz
tar xf libsodium-1.0.1.tar.gz && cd libsodium-1.0.1
./configure && make -j2 && make install
ldconfig
}

Advanced_Encryption_Gentoo()
{

}

Advanced_Encryption_Ubuntu()
{
apt-get install build-essential -y
cd ~/
wget https://github.com/jedisct1/libsodium/releases/download/1.0.1/libsodium-1.0.1.tar.gz
tar xf libsodium-1.0.1.tar.gz && cd libsodium-1.0.1
./configure && make -j2 && make install
ldconfig
}