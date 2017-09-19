# How to use Ansibuntu
Ansibuntu contains various Ubuntu which was pre-installed Ansible. 
To use Ansibuntu as base image, just add line below in the Dockerfile:
```
FROM maxsolar/ansibuntu-xenial
```

or you can specify a version for tag:

```
FROM maxsolar/ansibuntu-xenial:2.4.0.0
```

# How to run Ansibuntu
If you'd like to run xenial with ansible installed, you can run:
```
docker run --name myxenial -it maxsolar/ansibuntu-xenial
```
and you'll get into Ubuntu 16.04 with ansible environment.

# Available versions of Ansibuntu
Ansibuntu is for pre-installed ansible Ubuntu LTS. Supported OS are:
* 16.04 (xenial)
* 14.04 (trusty)

# Available Ansible Versions
* 2.2.2.0
* 2.3.0.0
* 2.4.0.0

Any comments please mail me: maxubuntu at gmail dot com.
