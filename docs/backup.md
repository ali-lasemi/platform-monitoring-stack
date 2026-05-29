# Backup Strategy

This document describes backup and recovery practices for the monitoring stack.

---

## Backup Goals

- Preserve Grafana dashboards
- Preserve Grafana configuration
- Preserve monitoring configuration files
- Support disaster recovery
- Reduce operational risk

---

## What Should Be Backed Up

### Grafana Data

Grafana stores dashboards, users and configuration data in its persistent volume.

### Configuration Files

Important configuration files:

- examples/prometheus/prometheus.yml
- examples/prometheus/rules/platform-alerts.yml
- examples/alertmanager/alertmanager.yml
- examples/loki/loki-config.yml
- examples/grafana/provisioning/

---

## Backup Script

The repository includes:

```txt
scripts/backup-grafana.sh