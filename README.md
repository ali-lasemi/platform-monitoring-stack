# Platform Monitoring Stack

Production-oriented observability platform built with Prometheus, Grafana, Loki, Alertmanager, Grafana Alloy, Tempo, OpenTelemetry, Node Exporter, and cAdvisor.

This repository demonstrates a practical Platform Engineering observability stack covering metrics, logs, traces, alerting, SLOs, infrastructure monitoring, automated validation, runtime verification, and security scanning.

---

## Architecture

    Applications
        |
       OTLP
        |
        v
    OpenTelemetry Collector
        |
        v
      Tempo

    Node Exporter ----+
                      |
    cAdvisor ---------+--> Prometheus ----> Alertmanager
                      |        |
    Remote Nodes -----+        |
                      |        |
    Kubernetes -------+        |
                               v
                            Grafana
                           /       \
                        Loki       Tempo
                         ^
                         |
                    Grafana Alloy
                         ^
                         |
                  Container Logs

Grafana provides the primary operational interface across metrics, logs, and traces.

---

## Core Components

### Prometheus

- Metrics collection and scraping
- Infrastructure monitoring
- Multi-node file-based discovery
- Kubernetes monitoring examples
- Alert rule evaluation
- SLI/SLO recording rules
- Error-budget burn-rate monitoring
- Alertmanager integration

### Grafana

- Automated datasource provisioning
- Automated dashboard provisioning
- Prometheus integration
- Loki integration
- Tempo integration
- Trace correlation
- Operational dashboards

### Loki

- Centralized log aggregation
- Persistent storage
- TSDB indexing
- Retention management
- Compaction
- Grafana integration

### Grafana Alloy

- Docker workload discovery
- Container log collection
- Log processing
- Log forwarding to Loki

### Alertmanager

- Prometheus alert integration
- Severity-based routing
- Alert grouping
- Operational notification handling

### Grafana Tempo

- Distributed trace storage
- OTLP trace ingestion
- Service graph generation
- Span metrics generation
- Grafana integration

### OpenTelemetry Collector

- OTLP gRPC and HTTP receivers
- Resource enrichment
- Batch processing
- Trace forwarding to Tempo

### Node Exporter

Host-level infrastructure metrics.

### cAdvisor

Container-level resource and performance metrics.

---

## Observability Capabilities

### Metrics

Prometheus collects metrics from local exporters, remote infrastructure targets, and Kubernetes environments.

### Logs

Grafana Alloy discovers Docker workloads, collects container logs, and forwards them to Loki.

### Traces

Applications send OTLP traces through the OpenTelemetry Collector to Grafana Tempo.

### Alerting

Production-oriented Prometheus alerts cover infrastructure, monitoring services, Kubernetes workloads, capacity conditions, and reliability objectives.

Alert behavior is validated using promtool unit tests.

---

## SLI and SLO Monitoring

The platform includes:

- Availability SLIs
- 99.9% availability SLO
- Error-budget calculations
- Fast burn alerts
- Slow burn alerts
- Multi-window burn-rate monitoring
- promtool rule tests

---

## Multi-Node Monitoring

Prometheus file-based service discovery supports external Node Exporter and cAdvisor targets.

Target metadata supports:

- Node
- Environment
- Role

This allows the monitoring platform to expand beyond the local Docker Compose environment.

---

## Kubernetes Monitoring

Kubernetes monitoring capabilities include:

- Node discovery
- Pod discovery
- Endpoint discovery
- kube-state-metrics
- Node readiness alerts
- Pod readiness alerts
- Deployment replica alerts
- PersistentVolumeClaim alerts

Kubernetes alert rules are validated and unit tested in CI.

---

## Grafana Provisioning

Grafana configuration is provisioned automatically.

Provisioned datasources include:

- Prometheus
- Loki
- Tempo

Dashboard provisioning is managed through repository configuration to keep the environment reproducible.

---

## Automated Validation

GitHub Actions validates:

- Docker Compose configuration
- Prometheus configuration
- Prometheus alert rules
- Prometheus alert unit tests
- SLO recording and alert rules
- SLO rule tests
- Kubernetes alert rules
- Kubernetes alert tests
- Loki configuration
- Grafana Alloy configuration
- Tempo configuration
- OpenTelemetry Collector configuration
- Alertmanager configuration
- Shell script linting
- Backup and restore verification
- Runtime smoke testing

---

## Security Validation

A dedicated security workflow provides:

- YAML validation
- Grafana dashboard JSON validation
- Trivy filesystem scanning
- HIGH and CRITICAL vulnerability detection

Security validation runs automatically through GitHub Actions.

---

## Runtime Smoke Testing

CI starts the core observability services and validates runtime readiness.

Runtime checks cover:

- Prometheus
- Alertmanager
- Grafana
- Loki
- Tempo

This detects runtime failures that static configuration validation alone cannot identify.

---

## Health Validation

Run:

    ./scripts/healthcheck.sh

Health validation checks monitoring service readiness and Prometheus target health.

---

## Backup and Restore

Create a monitoring configuration backup:

    ./scripts/backup-monitoring.sh

Verify a backup archive:

    ./scripts/verify-restore.sh <backup-archive.tar.gz>

Restore verification checks that required monitoring configuration artifacts exist and are non-empty.

Backup and restore behavior is also validated automatically in CI.

---

## Deployment

Copy the environment template:

    cp .env.example .env

Configure the required environment values and start the platform:

    docker compose --env-file .env -f docker/docker-compose.yml up -d

The deployment uses version-pinned monitoring components and persistent storage.

Internal observability services communicate through the monitoring Docker network.

Grafana acts as the primary host-facing operational interface.

---

## Repository Structure

    .github/workflows/       CI and security workflows
    docker/                  Docker Compose deployment
    docs/                    Architecture and operational documentation
    examples/
      alertmanager/          Alertmanager configuration
      alloy/                 Grafana Alloy configuration
      grafana/               Dashboards and provisioning
      kubernetes/            Kubernetes monitoring examples
      loki/                  Loki configuration
      otel/                  OpenTelemetry Collector configuration
      prometheus/            Prometheus configuration, targets, rules and tests
      tempo/                 Grafana Tempo configuration
    scripts/                 Health, backup, restore and runtime validation

---

## Production Engineering Features

- Version-pinned monitoring components
- Persistent monitoring storage
- Internal network isolation
- Environment-based credentials
- Automated Grafana provisioning
- Centralized metrics
- Centralized logging
- Distributed tracing
- Production alert rules
- Alert rule unit testing
- SLI/SLO monitoring
- Error-budget burn alerts
- Multi-node monitoring
- Kubernetes observability
- Runtime smoke testing
- Monitoring health validation
- Backup verification
- Restore verification
- Security scanning
- Automated CI validation

---

## CI Workflows

### Monitoring Validation

Validates configuration, alert rules, tests, operational scripts, backup behavior, and runtime service health.

### Security Validation

Validates repository configuration and performs automated vulnerability scanning.

Both workflows protect changes to the monitoring platform from configuration and operational regressions.

---

## Documentation

Operational documentation is maintained under the docs directory.

Key documentation includes:

- Architecture
- Deployment Guide
- Alert Rules
- Grafana Dashboards
- Incident Runbook
- Troubleshooting

---

## Engineering Principles

- Observability should be reproducible.
- Alerts should be actionable and tested.
- Monitoring configuration should be validated automatically.
- Metrics, logs, and traces should operate as one observability system.
- Reliability objectives should be measurable.
- Monitoring should scale beyond a single host.
- Backup without restore verification is incomplete.
- Runtime validation should complement static validation.
- Security validation belongs in the delivery pipeline.

---

## Technology Stack

Prometheus | Grafana | Loki | Grafana Alloy | Alertmanager | Grafana Tempo | OpenTelemetry | Node Exporter | cAdvisor | Docker Compose | Kubernetes | GitHub Actions | Trivy

---

## License

MIT License