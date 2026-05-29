# Alert Rules

This repository includes example Prometheus alert rules and Alertmanager routing examples.

---

## Included Alerts

### TargetDown

Detects when a monitored target becomes unavailable.

### HighCPUUsage

Detects sustained high CPU utilization.

### HighMemoryUsage

Detects sustained high memory utilization.

### ContainerRestartingFrequently

Detects containers that appear to restart repeatedly.

---

## Alert Rules Location

examples/prometheus/rules/platform-alerts.yml

---

## Alertmanager Configuration

examples/alertmanager/alertmanager.yml

---

## Related Documentation

- alert-routing.md
- runbook.md

---

## Routing Overview

Critical Alerts:
- Immediate attention

Warning Alerts:
- Scheduled operational review

Info Alerts:
- Low-priority review

Default Alerts:
- Fallback receiver

---

## Production Recommendations

- Tune thresholds based on infrastructure
- Reduce noisy alerts
- Define escalation procedures
- Connect receivers to notification platforms
- Maintain incident runbooks