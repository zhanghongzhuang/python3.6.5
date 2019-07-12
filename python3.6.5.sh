#/bin/bash

echo "安装变量"

yum clean all
yum makecache
yum -y groupinstall 'Development Tools'
yum -y install epel-release 
yum -y install gcc 
yum -y install zlib-devel
yum -y install bzip2-devel
yum -y install openssl-devel
yum -y install ncurses-devel
yum -y install wget
yum -y install zlib* 
yum -y install sqlite-devel

echo "输出当前目录"
The_current=$(pwd)
echo $The_current

echo "解压./sqlite-autoconf-3230100.tar.gz，并安装"
tar xvzf ./sqlite-autoconf-3230100.tar.gz
cd sqlite-autoconf-3230100 &&./configure
make && make install

echo "创建Python3文件夹"
mkdir -p /usr/local/python3

cd $The_current
rm -rf ./sqlite-autoconf-3230100

echo "编译安装Python3.6.5"
tar xvzf ./Python-3.6.5.tgz
cd ./Python-3.6.5
./configure --prefix=/usr/local/python3 --enable-optimizations && make && make install 
cd $The_current
rm -rf ./Python-3.6.5

ln -s /usr/local/python3/bin/python3.6 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3

echo "升级pip"
pip3 install --upgrade pip

