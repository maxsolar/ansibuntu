FROM ubuntu:trusty
LABEL MAINTAINER='Jim T. Tang<maxubuntu@gmail.com>'
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get dist-upgrade -y && \
    apt-get install aptitude python python-pip python-dev python-sphinx software-properties-common wget curl libyaml-dev libffi-dev libssl-dev -y && \
    pip install -U pip six requests[security] simplejson pyparsing appdirs

## install Ansible 2.3.0.0
RUN wget -q http://releases.ansible.com/ansible/ansible-2.3.0.0-0.2.rc2.tar.gz -O- | tar zxf - && \
    cd ansible-2.3.0.0 && echo "make..."; make >/dev/null && \
       echo "make install..."; make install >/dev/null && \
       mkdir /etc/ansible; echo 'localhost' > /etc/ansible/hosts; \
    cd -; rm -rf ansible-2.3.0.0; \    
    apt-get clean all && apt-get autoremove -y && \
    echo 'localhost' > /etc/ansible/hosts

CMD ["/bin/bash"]
