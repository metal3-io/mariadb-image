ARG BASE_IMAGE=quay.io/centos/centos:stream8

FROM $BASE_IMAGE

ENV PKGS_LIST=main-packages-list.txt
ARG EXTRA_PKGS_LIST

COPY ${PKGS_LIST} ${EXTRA_PKGS_LIST:-$PKGS_LIST} /tmp/
COPY prepare-image.sh runmariadb /bin/

RUN /bin/prepare-image.sh && rm -f /bin/prepare-image.sh

ENTRYPOINT /bin/runmariadb
