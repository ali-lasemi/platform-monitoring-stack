# Platform Monitoring Stack

Production-oriented monitoring and observability stack using Prometheus, Grafana, Loki and Alertmanager.

---

# Overview

This repository contains a production-focused observability and monitoring stack designed for modern infrastructure and platform environments.

The goal is to provide practical monitoring workflows focused on:

- Reliability
- Visibility
- Alerting
- Operational awareness
- Production troubleshooting
- Incident response

---

# Stack Components

## Prometheus
Metrics collection, scraping and alert rule evaluation.

## Grafana
Visualization dashboards and operational insights.

## Loki
Centralized log aggregation.

## Alertmanager
Alert routing and notification management.

## Node Exporter
Host-level metrics collection.

## cAdvisor
Container-level metrics collection.

---

# Features

- Infrastructure monitoring
- Container monitoring
- Service health visibility
- Centralized logging
- Dashboard examples
- Alert rules
- Alert routing strategy
- Incident runbook
- Docker-based deployment
- Operational troubleshooting guides

---

# Repository Structure

```txt
docs/                  Documentation and operational guides
examples/              Example configs, rules and dashboards
docker/                Docker Compose deployment
scripts/               Operational helper scripts
.github/workflows/     CI validation workflows
```

---

# Architecture

```txt
                 ┌─────────────────┐
                 │   Applications  │
                 └────────┬────────┘
                          │
          ┌───────────────┼────────────────┐
          ▼               ▼                ▼
 ┌────────────────┐ ┌──────────────┐ ┌──────────────┐
 │   Prometheus   │ │ Node Exporter│ │   cAdvisor   │
 │ Metrics System │ │ Host Metrics │ │Container Mtrs│
 └────────┬───────┘ └──────┬───────┘ └──────┬───────┘
          │                │                │
          └────────────────┼────────────────┘
                           ▼
                    ┌─────────────┐
                    │   Grafana   │
                    │ Dashboards  │
                    └─────────────┘

                 ┌─────────────────┐
                 │      Loki       │
                 │ Log Aggregation │
                 └─────────────────┘

                 ┌─────────────────┐
                 │  Alertmanager   │
                 │ Alert Routing   │
                 └─────────────────┘
```

---

# Deployment

The monitoring stack is designed to run using Docker Compose.

```bash
docker compose -f docker/docker-compose.yml up -d
```

---

# Healthcheck

```bash
./scripts/healthcheck.sh
```

---

# Documentation

- [Deployment Guide](docs/deployment.md)
- [Alert Rules](docs/alerts.md)
- [Grafana Dashboards](docs/dashboards.md)
- [Incident Runbook](docs/runbook.md)
- [Troubleshooting](docs/troubleshooting.md)

---

# Monitoring Goals

- Infrastructure visibility
- Service uptime monitoring
- Centralized operational logs
- Incident awareness
- Faster troubleshooting
- Production insights

---

# Roadmap

- Advanced Grafana dashboards
- Log retention strategies
- Backup automation
- Reverse proxy integration
- Kubernetes monitoring
- Distributed tracing integration
- SLO / SLI examples

---

# Philosophy

```txt
Good systems are observable.
Reliable systems are monitored.
Operational visibility matters.
Alerts should be actionable.
```

---

# License

MIT License