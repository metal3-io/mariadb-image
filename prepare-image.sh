#!/usr/bin/bash

set -euxo pipefail

echo "install_weak_deps=False" >> /etc/dnf/dnf.conf
# Tell RPM to skip installing documentation
echo "tsflags=nodocs" >> /etc/dnf/dnf.conf

dnf install -y 'dnf-command(config-manager)' \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
dnf config-manager --set-disabled epel

xargs -rtd'\n' dnf install -y < /tmp/"${PKGS_LIST}"

if [[ -n "${EXTRA_PKGS_LIST:-}" ]]; then
    if [[ -s /tmp/"${EXTRA_PKGS_LIST}" ]]; then
        xargs -rtd'\n' dnf install -y < /tmp/"${EXTRA_PKGS_LIST}"
    fi
fi

dnf install -y --enablerepo=epel inotify-tools

dnf clean all
rm -rf /var/cache/{yum,dnf}/*
