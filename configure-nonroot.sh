#!/usr/bin/bash
#
# configure mysql image to run with mysql user
# changes are backwards compatible for running as root

set -eux

# mysql user uid/gid
# NONROOT_UID=27
NONROOT_GID=27

mkdir -p /certs
chgrp -R "${NONROOT_GID}" /certs
chmod 2775 /certs

chgrp -R "${NONROOT_GID}" /etc/my.cnf.d
chmod 2775 /etc/my.cnf.d
chmod -R g+w /etc/my.cnf.d/*

mkdir -p /var/lib/mysql
chgrp -R "${NONROOT_GID}" /var/lib/mysql
chmod -R g+w /var/lib/mysql
