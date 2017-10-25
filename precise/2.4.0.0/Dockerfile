FROM ubuntu:precise
LABEL MAINTAINER='Jim T. Tang<maxubuntu@gmail.com>'
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get dist-upgrade -y && \
    apt-get install aptitude build-essential python python-pip python-dev python-sphinx python-software-properties wget curl libyaml-dev libffi-dev libssl-dev -y && \
    pip install -U pip six requests[security] simplejson pyparsing appdirs

## install Ansible 2.4.0.0
RUN pip install ansible==2.4.0.0 && \
    mkdir /etc/ansible; echo '[local]' > /etc/ansible/hosts; \
    echo '127.0.0.1' >> /etc/ansible/hosts; \
    apt-get clean all && apt-get autoremove -y

CMD ["/bin/bash"]
