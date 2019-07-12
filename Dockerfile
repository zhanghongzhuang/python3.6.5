FROM centos
MAINTAINER  <zhang_hongzhuang@163.com>

RUN yum -y groupinstall 'Development Tools'

RUN yum -y install epel-release && \
    yum -y install gcc && \
    yum -y install zlib-devel && \
    yum -y install bzip2-devel && \
    yum -y install openssl-devel && \
    yum -y install ncurses-devel && \
    yum -y install wget && \
    yum -y install zlib* && \
    yum -y install sqlite-devel

ADD sqlite-autoconf-3230100.tar.gz /

RUN cd sqlite-autoconf-3230100 && \
   ./configure && \
   make && \
   make install  

ADD Python-3.6.5.tgz /


RUN mkdir -p /usr/local/python3

RUN cd /Python-3.6.5/ && \
    ./configure --prefix=/usr/local/python3 --enable-optimizations && \
    make && \
    make install

RUN ln -s /usr/local/python3/bin/python3.6 /usr/bin/python3 && \
    ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3


RUN pip3 install --upgrade pip

