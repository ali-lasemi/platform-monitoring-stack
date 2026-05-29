# Alert Rules

This repository includes example Prometheus alert rules for platform monitoring.

---

## Included Alerts

### TargetDown

Detects when a monitored target is unavailable.

### HighCPUUsage

Detects sustained high CPU usage using Node Exporter metrics.

### HighMemoryUsage

Detects sustained high memory usage using Node Exporter metrics.

### ContainerRestartingFrequently

Detects containers that appear to restart frequently using cAdvisor metrics.

---

## Alert Rule Location

```txt
examples/prometheus/rules/platform-alerts.yml