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
RUN wget -q https://www.openssl.org/source/old/1.0.2/openssl-1.0.2g.tar.gz -O - | tar zxvf - && \
    cd openssl-1.0.2g; ./config shared && make depend && make && echo make test && make install && \
    rm -rf /usr/local/ssl/man; \
    cp /usr/local/ssl/bin/* /usr/local/bin/; \
    rsync -av /usr/local/ssl/include/openssl/ /usr/include/openssl/; \
    rsync -av /usr/local/ssl/lib/engines/ /usr/lib/ssl/engines/; \
    rsync -av /usr/local/ssl/misc/ /usr/lib/ssl/misc/; \
    cp -a /usr/local/ssl/lib/libcrypto.{a,so{,.1.0.0}} /usr/lib/; \
    cp -a /usr/local/ssl/lib/libssl.{a,so{,.1.0.0}} /usr/lib/; \
    cd -; rm -rf openssl-1.0.2g

## install Python 2.7.10
RUN wget -q https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz -O - | tar zxvf - && \
    cd Python-2.7.10 && ./configure \
            --enable-shared     \
            --with-ensurepip=yes \
            --enable-unicode=ucs4 && \
    make && echo make -k test && make install && \
    cp -a /usr/local/lib/libpython* /usr/lib/; \
    cd -; rm -rf Python-2.7.10

## install Ansible 2.2.1.0
RUN pip install -U pip six requests[security] simplejson && \
    wget -q http://releases.ansible.com/ansible/ansible-2.2.1.0.tar.gz -O - | tar zxvf - && \
    cd ansible-2.2.1.0 && make && make install && \
    cd -; rm -rf ansible-2.2.1.0; \
    mkdir /etc/ansible; echo 'localhost' > /etc/ansible/hosts; \
    apt-get clean all && apt-get autoremove -y
    
CMD ["/bin/bash"]
