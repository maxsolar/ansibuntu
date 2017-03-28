FROM ubuntu:xenial
LABEL MAINTAINER='Jim T. Tang<maxubuntu@gmail.com>'
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get dist-upgrade -y && \
    apt-get install aptitude python python3-pip python-pip python-dev python-sphinx software-properties-common wget curl libyaml-dev libffi-dev libssl-dev -y && \
    pip3 install -U pip six requests[security] simplejson && \
    pip install -U pip six requests[security] simplejson

## install Ansible 2.3.0.0
RUN wget -q http://releases.ansible.com/ansible/ansible-2.3.0.0-0.2.rc2.tar.gz -O- | tar zxf - && \
    cd ansible-2.3.0.0 && echo "make..."; make >/dev/null && \
       echo "make install..."; make install >/dev/null && \
       mkdir /etc/ansible; echo 'localhost' > /etc/ansible/hosts; \
    cd -; rm -rvf ansible-2.3.0.0; \    
    apt-get clean all && apt-get autoremove -y 

CMD ["/bin/bash"]
