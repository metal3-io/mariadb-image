ARG BASE_IMAGE=quay.io/centos/centos:stream9@sha256:06cfbf69d99f47f45f327d18fec086509ca0c74afdb178fb8c5bc45184454cc0

FROM $BASE_IMAGE

ENV PKGS_LIST=main-packages-list.txt
ARG EXTRA_PKGS_LIST

COPY ${PKGS_LIST} ${EXTRA_PKGS_LIST:-$PKGS_LIST} /tmp/
COPY prepare-image.sh configure-nonroot.sh runmariadb /bin/

RUN /bin/prepare-image.sh && rm -f /bin/prepare-image.sh
RUN /bin/configure-nonroot.sh && rm -f /bin/configure-nonroot.sh

ENTRYPOINT /bin/runmariadb
