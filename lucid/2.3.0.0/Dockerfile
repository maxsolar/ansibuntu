FROM maxsolar/ubuntu-lucid
LABEL MAINTAINER='Jim T. Tang<maxubuntu@gmail.com>'
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get dist-upgrade -y && \
    apt-get install wget curl rsync aptitude build-essential ca-certificates \
    libffi-dev libyaml-dev libbz2-dev zlib1g-dev libreadline5-dev python-software-properties \
    libncurses5-dev libssl-dev libperl5.10 libsqlite3-dev libyaml-dev libgdbm-dev -y





## install openssl 1.0.2g
RUN wget -q https://www.openssl.org/source/old/1.0.2/openssl-1.0.2g.tar.gz -O - | tar zxf - && \
    cd openssl-1.0.2g; echo "config shared..."; ./config shared >/dev/null && \
        echo -n "make depend..."; make depend >/dev/null && echo done && \
        echo -n "make..."; make >/dev/null && echo done && \
        echo -n "make install..."; make install >/dev/null && echo done && \
        rm -rf /usr/local/ssl/man && \
        cp /usr/local/ssl/bin/* /usr/local/bin/&& \
        rsync -av /usr/local/ssl/include/openssl/ /usr/include/openssl/&& \
        rsync -av /usr/local/ssl/lib/engines/ /usr/lib/ssl/engines/&& \
        rsync -av /usr/local/ssl/misc/ /usr/lib/ssl/misc/&& \
        cp -a /usr/local/ssl/lib/libcrypt* /usr/lib/&& \
        cp -a /usr/local/ssl/lib/libssl* /usr/lib/&& \
    cd -; rm -rf openssl-1.0.2g

## install Python 2.7.10
RUN wget -q https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz -O - | tar zxf - && \
    cd Python-2.7.10 && echo "configure... "; \
       ./configure --enable-shared --with-ensurepip=yes --enable-unicode=ucs4 >/dev/null && \
       echo "make..."; make >/dev/null && \
       echo "make install..."; make install >/dev/null && \
       cp -a /usr/local/lib/libpython* /usr/lib/&& \
    cd -; rm -rf Python-2.7.10

## install Ansible 2.3.0.0
RUN pip install -U pip && /usr/local/bin/pip install six requests[security] simplejson pyparsing appdirs Sphinx && \
    wget -q http://releases.ansible.com/ansible/ansible-2.3.0.0-0.2.rc2.tar.gz -O- | tar zxf - && \
    cd ansible-2.3.0.0 && echo "make..."; make >/dev/null && \
       echo "make install..."; make install >/dev/null && \
       mkdir /etc/ansible; echo 'localhost' > /etc/ansible/hosts; \
    cd -; rm -rf ansible-2.3.0.0; \
    apt-get clean all && apt-get autoremove -y

CMD ["/bin/bash"]
