# Metal3 MariaDB Container

This repo contains the files needed to build the MariaDB image optionally used
by Metal3.

## DEPRECATION WARNING

The last release of Metal3-io mariadb-image will be done for the
v1.11 release of cluster-api-provider-metal3 (CAPM3).

After the support ends for v1.11 CAPM3 the mariadb-image repository will be
archived.

From v1.12 release of CAPM3 and the related baremetal-operator (BMO) release
will be tested only with the upstream mariadb-operator.

## Description

The following environment variables can be passed in to customize run-time
functionality:

- `MARIADB_PASSWORD` - The database password. Must match one on Ironic.
   Alternatively, mount a secret with `password` (optionally with a `username`)
   at `/auth/mariadb` mount point.
- `MARIADB_CERT_FILE` and `MARIADB_KEY_FILE` - Paths to the TLS certificates.
   Default to `/certs/mariadb/tls.crt` and `/certs/mariadb/tls.key`.
   TLS is enabled if these exist.
- `MARIADB_MAX_CONNECTIONS` - MariaDB max connection option
