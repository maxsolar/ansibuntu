FROM maxsolar/ubuntu-hardy
MAINTAINER Jim T. Tang<maxubuntu@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get dist-upgrade -y && \
    apt-get install wget curl rsync build-essential aptitude \
        libffi4-dev libbz2-dev zlib1g-dev libreadline5-dev \
        libncurses5-dev libssl-dev libperl5.8  libsqlite3-dev libgdbm-dev -y && \
    wget http://old-releases.ubuntu.com/ubuntu/pool/main/c/ca-certificates/ca-certificates_20141019ubuntu0.10.04.1_all.deb && \
    dpkg -i ca-certificates_20141019ubuntu0.10.04.1_all.deb || apt-get install -fy && \
    rm ca-certificates_20141019ubuntu0.10.04.1_all.deb

## install openssl 1.0.2g
RUN wget -q https://www.openssl.org/source/old/1.0.2/openssl-1.0.2g.tar.gz -O - | tar zxf - && \
    cd openssl-1.0.2g; echo "config shared..."; ./config shared >/dev/null && \
        echo "make depend..."; make depend >/dev/null && \
        echo "make..."; make >/dev/null && \
        echo "make install..."; make install >/dev/null && \
        rm -rf /usr/local/ssl/man && \
        cp /usr/local/ssl/bin/* /usr/local/bin/&& \
        rsync -av /usr/local/ssl/include/openssl/ /usr/include/openssl/&& \
        rsync -av /usr/local/ssl/lib/engines/ /usr/lib/ssl/engines/&& \
        rsync -av /usr/local/ssl/misc/ /usr/lib/ssl/misc/&& \
        cp -a /usr/local/ssl/lib/libcrypt* /usr/lib/&& \
        cp -a /usr/local/ssl/lib/libssl* /usr/lib/&& \
    cd -; rm -rvf openssl-1.0.2g

## install Python 2.7.10
RUN wget -q https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz -O - | tar zxf - && \
    cd Python-2.7.10 && echo "configure... "; \
       ./configure --enable-share --with-ensurepip=yes --enable-unicode=ucs4 >/dev/null && \
       echo "make..."; make >/dev/null && \
       echo "make install..."; make install >/dev/null && \
       cp -a /usr/local/lib/libpython* /usr/lib/&& \
    cd -; rm -rvf Python-2.7.10

## install Ansible 2.2.1.0
RUN pip install -U pip && /usr/local/bin/pip install six requests[security] simplejson && \
    wget -q http://releases.ansible.com/ansible/ansible-2.2.1.0.tar.gz -O- | tar zxf - && \
    cd ansible-2.2.1.0 && echo "make..."; make >/dev/null && \
       echo "make install..."; make install >/dev/null && \
       mkdir /etc/ansible; echo 'localhost' > /etc/ansible/hosts; \
    cd -; rm -rvf ansible-2.2.1.0; \
    apt-get clean all && apt-get autoremove -y
 
CMD ["/bin/bash"]
