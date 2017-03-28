FROM ubuntu:xenial
LABEL MAINTAINER='Jim T. Tang<maxubuntu@gmail.com>'
ENV DEBIAN_FRONTEND noninteractive
RUN for i in xenial xenial-updates xenial-security; do echo deb http://provision.htc.com/ubuntu $i main restricted universe multiverse; done > /etc/apt/sources.list
RUN apt-get update -qq && apt-get dist-upgrade -y && \
    apt-get install aptitude python python3-pip python-pip python-dev software-properties-common wget curl libffi-dev libssl-dev -y && \
    pip3 install -U pip six requests[security] simplejson && \
    pip install -U pip six requests[security] simplejson

## install Ansible 2.3.0.0
RUN wget -q http://releases.ansible.com/ansible/ansible-2.3.0.0-0.2.rc2.tar.gz -O- | tar zxf - && \
    cd ansible-2.3.0.0 && echo "make..."; make >/dev/null && \
       echo "make install..."; make install >/dev/null && \
       mkdir /etc/ansible; echo 'localhost' > /etc/ansible/hosts; \
    cd -; rm -rvf ansible-2.3.0.0; \    
    apt-get clean all && apt-get autoremove -y && \
    echo 'localhost' > /etc/ansible/hosts

CMD ["/bin/bash"]
