# Metal3 MariaDB Container

[![CLOMonitor](https://img.shields.io/endpoint?url=https://clomonitor.io/api/projects/cncf/metal3-io/badge)](https://clomonitor.io/projects/cncf/metal3-io)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/metal3-io/cluster-api-provider-metal3/badge)](https://securityscorecards.dev/viewer/?uri=github.com/metal3-io/cluster-api-provider-metal3)
[![Ubuntu E2E Integration main build status](https://jenkins.nordix.org/buildStatus/icon?job=metal3_daily_main_e2e_integration_test_ubuntu&subject=Ubuntu%20e2e%20integration%20main)](https://jenkins.nordix.org/view/Metal3%20Periodic/job/metal3_daily_main_e2e_integration_test_ubuntu/)
[![CentOS E2E Integration main build status](https://jenkins.nordix.org/buildStatus/icon?job=metal3_daily_main_e2e_integration_test_centos&subject=Centos%20e2e%20integration%20main)](https://jenkins.nordix.org/view/Metal3%20Periodic/job/metal3_daily_main_e2e_integration_test_centos/)

This repo contains the files needed to build the MariaDB image optionally used
by Metal3.

## Description

The following environment variables can be passed in to customize run-time
functionality:

- `MARIADB_PASSWORD` - The database password. Must match one on Ironic.
- `MARIADB_CERT_FILE` and `MARIADB_KEY_FILE` - Paths to the TLS certificates.
   Default to `/certs/mariadb/tls.crt` and `/certs/mariadb/tls.key`.
   TLS is enabled if these exist.
- `MARIADB_MAX_CONNECTIONS` - MariaDB max connection option
