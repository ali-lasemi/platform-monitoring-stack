# Architecture

platform-monitoring-stack is a production-oriented observability reference platform.

## Metrics

Prometheus collects metrics from local exporters, remote nodes through file-based discovery, and Kubernetes targets.

Node Exporter provides host metrics and cAdvisor provides container metrics.

## Alerting

Prometheus evaluates infrastructure, Kubernetes, and SLO alert rules.

Alerts are forwarded to Alertmanager.

Prometheus rules are validated and unit tested with promtool.

## Logs

Grafana Alloy discovers Docker workloads and forwards container logs to Loki.

Loki uses persistent storage, TSDB indexing, retention, and compaction.

## Traces

Applications send OTLP traces to the OpenTelemetry Collector.

The collector forwards traces to Grafana Tempo.

Tempo provides distributed trace storage and metrics generation.

## Visualization

Grafana provisions Prometheus, Loki, and Tempo datasources automatically.

Dashboards are loaded through version-controlled provisioning.

## Deployment

Docker Compose provides the reference deployment.

Internal services communicate through the platform-monitoring Docker network.

Grafana is the primary host-facing service.

## Validation

GitHub Actions validates configuration, alert rules, SLO rules, Kubernetes alerts, backup and restore behavior, shell scripts, and runtime service readiness.