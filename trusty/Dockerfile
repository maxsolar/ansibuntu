FROM ubuntu:trusty
MAINTAINER Jim T. Tang<maxubuntu@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ADD provision-repo_2017.0223_all.deb /root
RUN dpkg -i /root/provision-repo_2017.0223_all.deb; apt-get update -qq && apt-get dist-upgrade -y && \
    apt-get install aptitude software-properties-common wget curl python-pip python-dev libffi-dev libssl-dev -y && \
    pip install -U pip && /usr/local/bin/pip install six requests[security] simplejson && \
    add-apt-repository ppa:ansible/ansible  && apt-get update -qq && \
    apt-get install ansible=2.2.1.0-1ppa~trusty -y && \
    apt-get clean all && apt-get autoremove -y && \
    echo 'localhost' > /etc/ansible/hosts

CMD ["/bin/bash"]
