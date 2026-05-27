# Grafana Dashboards

This repository includes example Grafana dashboards for platform monitoring.

---

## Included Dashboard

```txt
examples/grafana/dashboard.json
```

---

## Import Dashboard

1. Open Grafana
2. Go to Dashboards
3. Click Import
4. Upload `examples/grafana/dashboard.json`
5. Select Prometheus as the data source

---

## Dashboard Goals

- Service health overview
- Prometheus target visibility
- Operational metrics
- Incident investigation support

---

## Future Improvements

- Node exporter dashboard
- Container metrics dashboard
- Loki logs dashboard
- SLO / SLI dashboard