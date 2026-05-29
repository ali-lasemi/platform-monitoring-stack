# Alert Rules

This repository includes example Prometheus alert rules and Alertmanager routing for platform monitoring.

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
```

---

## Alertmanager Configuration

```txt
examples/alertmanager/alertmanager.yml
```

---

## Routing Strategy

```txt
critical alerts → urgent review
warning alerts  → scheduled review
default alerts  → fallback receiver
```

---

## Production Notes

- Tune thresholds based on real infrastructure
- Route critical alerts to urgent channels
- Route warning alerts to daily review channels
- Avoid noisy alerts
- Document alert response actions in runbooks
- Integrate receivers such as Slack, Telegram, email or PagerDuty in real environments