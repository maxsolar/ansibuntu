FROM maxsolar/ubuntu-hardy
MAINTAINER Jim T. Tang<maxubuntu@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ADD provision-priv-repo_2017.0216_all.deb /root
ADD ansible-init.sh /root
RUN bash /root/ansible-init.sh

CMD ["/bin/bash"]
