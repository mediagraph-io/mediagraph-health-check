# MediaGraph Health Check 

[![Production Health Check](https://github.com/mediagraph-io/mediagraph-health-check/actions/workflows/production_health_check.yml/badge.svg)](https://github.com/mediagraph-io/mediagraph-health-check/actions/workflows/production_health_check.yml)

To trigger:

```bash
curl -XPOST https://api.github.com/repos/mediagraph-io/mediagraph-health-check/dispatches -H 'authorization: Bearer <personal-access-token-with-repo-scope>' -d '{"event_type":"Run Production Health Check"}'
```