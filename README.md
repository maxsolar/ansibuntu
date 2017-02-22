# How to use Ansibuntu
Ansibuntu contains various Ubuntu which was pre-installed Ansible. 
To use Ansibuntu as base image, just add line below in the Dockerfile:
```
FROM maxsolar/ansibuntu-xenial
```

# How to run Ansibuntu
If you'd like to run xenial with ansible installed, you can run:
```
docker run --name myxenial -it maxsolar/ansibuntu-xenial
```
and you'll get into Ubuntu 16.04 with ansible environment.

# Select a version of Ansibuntu
Ansibuntu is for pre-installed ansible Ubuntu LTS. Supported OS are:
* 16.04 (xenial)
* 14.04 (trusty)
* 12.04 (precise)
* 10.04 (lucid)
*  8.04 (hardy)

# Ansible Version
Ansible version is 2.2.1.0 for all OSes. Will update Ansible version if there are security/feature updates in the future, but it may not be very frequently.

# How do you install Ansible 2.2.1.0 on legacy OS like Hardy and Lucid?
It is not possible to install Ansible 2.2.1.0 by default. Therefore, I installed Python 2.7.10 with OpenSSL 1.0.2g prior to install Ansible. If you prefer to use Python2.6/2.5, then you'll need to download the Dockerfile and replace `make install` with `make altinstall`.

Any comments please mail me: maxubuntu at gmail dot com.
