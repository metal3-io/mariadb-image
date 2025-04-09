ARG BASE_IMAGE=quay.io/centos/centos:stream9

FROM $BASE_IMAGE

# image.version is set during image build by automation
LABEL org.opencontainers.image.authors="metal3-dev@googlegroups.com"
LABEL org.opencontainers.image.description="Metal3 MariaDB container image"
LABEL org.opencontainers.image.documentation="https://github.com/metal3-io/mariadb-image"
LABEL org.opencontainers.image.licenses="Apache License 2.0"
LABEL org.opencontainers.image.title="Metal3 MariaDB"
LABEL org.opencontainers.image.url="https://github.com/metal3-io/mariadb-image"
LABEL org.opencontainers.image.vendor="Metal3-io"

ENV PKGS_LIST=main-packages-list.txt
ARG EXTRA_PKGS_LIST

COPY ${PKGS_LIST} ${EXTRA_PKGS_LIST:-$PKGS_LIST} /tmp/
COPY prepare-image.sh configure-nonroot.sh /bin/

RUN /bin/prepare-image.sh && rm -f /bin/prepare-image.sh
RUN /bin/configure-nonroot.sh && rm -f /bin/configure-nonroot.sh

COPY runmariadb /bin/
ENTRYPOINT /bin/runmariadb
