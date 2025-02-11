# Metal3 MariaDB Container

This repo contains the files needed to build the MariaDB image optionally used
by Metal3.

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
