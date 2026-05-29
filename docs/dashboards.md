# Grafana Dashboards

This repository includes example Grafana dashboards for platform, infrastructure and container monitoring.

---

## Included Dashboards

- examples/grafana/dashboard.json
- examples/grafana/container-dashboard.json

---

## Provisioning

Grafana provisioning examples are available in:

- examples/grafana/provisioning/datasources/datasources.yml
- examples/grafana/provisioning/dashboards/dashboards.yml

These files automatically configure:

- Prometheus datasource
- Loki datasource
- Dashboard loading from filesystem

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

## Manual Import

1. Open Grafana
2. Go to Dashboards
3. Click Import
4. Upload one of the dashboard JSON files
5. Select Prometheus as the data source

---

## Automated Provisioning

When using the provided Docker Compose stack, Grafana loads datasources and dashboards automatically from the provisioning directory.

---

## Metrics Used

The dashboards use metrics from:

- Prometheus
- Node Exporter
- cAdvisor
- Loki

---

## Future Improvements

- Loki logs dashboard
- Alert overview dashboard
- SLO / SLI dashboard