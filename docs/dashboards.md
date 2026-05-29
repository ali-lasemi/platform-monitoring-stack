# Grafana Dashboards

This repository includes example Grafana dashboards for platform, infrastructure and container monitoring.

---

## Included Dashboards

```txt
examples/grafana/dashboard.json
examples/grafana/container-dashboard.json
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

## Dashboard: Container Monitoring Overview

The container dashboard provides visibility into:

- Running containers
- Container CPU usage
- Container memory usage
- Container network receive traffic
- Container network transmit traffic

---

## Import Dashboard

1. Open Grafana
2. Go to Dashboards
3. Click Import
4. Upload one of the dashboard JSON files
5. Select Prometheus as the data source

---

## Metrics Used

The dashboards use metrics from:

- Prometheus
- Node Exporter
- cAdvisor

---

## Future Improvements

- Loki logs dashboard
- Alert overview dashboard
- SLO / SLI dashboard