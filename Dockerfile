ARG BASE_IMAGE=quay.io/centos/centos:stream9

FROM $BASE_IMAGE

ENV PKGS_LIST=main-packages-list.txt
ARG EXTRA_PKGS_LIST

COPY ${PKGS_LIST} ${EXTRA_PKGS_LIST:-$PKGS_LIST} /tmp/
COPY prepare-image.sh configure-nonroot.sh /bin/

RUN /bin/prepare-image.sh && rm -f /bin/prepare-image.sh
RUN /bin/configure-nonroot.sh && rm -f /bin/configure-nonroot.sh

COPY runmariadb /bin/
ENTRYPOINT /bin/runmariadb
