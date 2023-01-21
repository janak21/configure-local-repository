#!/bin/bash
sudo cat > /etc/yum.repos.d/local.repo <<EOL
[AppStream]
name=My Local Repository
baseurl=/run/media/$USERNAME/RHEL-9-0-0-BaseOS-x86_64/AppStream
enabled=1
gpgcheck=0

[BaseOS]
name=My Local Repository
baseurl=/run/media/$USERNAME/RHEL-9-0-0-BaseOS-x86_64/BaseOS
enabled=1
gpgcheck=0
EOL
subscription-manager repos --enable codeready-builder-for-rhel-9-$(arch)-rpms
dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
yum repolist
yum update repolist
yum install -y ansible-core
yum install -y podman
