# Grafana Dashboards

This repository includes example Grafana dashboards for platform and infrastructure monitoring.

---

## Included Dashboard

```txt
examples/grafana/dashboard.json
```

---

## Dashboard: Platform Monitoring Overview

The dashboard provides visibility into:

- Target availability
- CPU usage
- Memory usage
- Network receive traffic
- Network transmit traffic

---

## Import Dashboard

1. Open Grafana
2. Go to Dashboards
3. Click Import
4. Upload `examples/grafana/dashboard.json`
5. Select Prometheus as the data source

---

## Metrics Used

The dashboard uses metrics from:

- Prometheus
- Node Exporter
- cAdvisor

---

## Future Improvements

- Container-level dashboard
- Loki logs dashboard
- Alert overview dashboard
- SLO / SLI dashboard