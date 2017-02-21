#!/usr/bin/env bash
# Ubuntu 10.04 LTS Lucid
# Author: Jim T. Tang<maxubntu@gmail.com; jim_tang@htc.com>
function make_init() {
    apt-get update -qq && apt-get dist-upgrade -y
    apt-get install wget curl rsync build-essential ca-certificates \
        libffi-dev  libbz2-dev zlib1g-dev libreadline5-dev \
        libncurses5-dev libssl-dev libperl5.10 libsqlite3-dev libgdbm-dev -y
}




function make_clean() {
    apt-get clean all && apt-get autoremove -y
}

function install_openssl() {
    wget -q https://www.openssl.org/source/old/1.0.2/openssl-1.0.2g.tar.gz -O - | tar zxvf -
    cd openssl-1.0.2g; ./config shared && make depend && make && echo make test && make install || exit 2
    rm -rf /usr/local/ssl/man
    cp /usr/local/ssl/bin/* /usr/local/bin/
    rsync -av /usr/local/ssl/include/openssl/ /usr/include/openssl/
    rsync -av /usr/local/ssl/lib/engines/ /usr/lib/ssl/engines/
    rsync -av /usr/local/ssl/misc/ /usr/lib/ssl/misc/
    cp -a /usr/local/ssl/lib/libcrypto.{a,so{,.1.0.0}} /usr/lib/
    cp -a /usr/local/ssl/lib/libssl.{a,so{,.1.0.0}} /usr/lib/
    cd -; rm -rf openssl-1.0.2g
}

function install_python27() {
    wget -q https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz -O - | tar zxvf -
    cd Python-2.7.10 && ./configure \
            --enable-shared     \
            --with-ensurepip=yes \
            --enable-unicode=ucs4 && make && echo make -k test && make install || exit 2
    cp -a /usr/local/lib/libpython* /usr/lib/
    cd -; rm -rf Python-2.7.10
    echo ============ $(python -V) ===============
}

function install_ansible() {
    pip install -U pip simplejson
    wget -q http://releases.ansible.com/ansible/ansible-2.2.1.0.tar.gz -O - | tar zxvf -
    cd ansible-2.2.1.0 && make && make install || exit 2
    cd -; rm -rf ansible-2.2.1.0
    mkdir /etc/ansible; echo -e '[local]\nlocalhost\n' > /etc/ansible/hosts
}

### main() ###
make_init && install_openssl && install_python27 && install_ansible && make_clean
