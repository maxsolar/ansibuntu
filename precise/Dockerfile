FROM ubuntu:precise
MAINTAINER Jim T. Tang<maxubuntu@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get dist-upgrade -y && \
    apt-get install aptitude python-software-properties wget curl python-pip python-dev -y && \
    add-apt-repository ppa:ansible/ansible && apt-get update -qq && \
    apt-get install ansible=2.2.1.0-1ppa~precise -y && \
    pip install simplejson && \
    apt-get clean all && apt-get autoremove -y && \
    echo 'localhost' > /etc/ansible/hosts

CMD ["/bin/bash"]
