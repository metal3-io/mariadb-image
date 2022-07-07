Metal3 MariaDB Container.
========================

This repo contains the files needed to build the MariaDB image used by Metal3.

Description
-----------

The following environment variables can be passed in to customize run-time functionality:
- `MARIADB_PASSWORD` - The database password. Must match one on Ironic.
- `MARIADB_CERT_FILE` and `MARIADB_KEY_FILE` - Paths to the TLS certificates.  Default to `/certs/mariadb/tls.crt` and `/certs/mariadb/tls.key`. TLS is enabled if these exist.
