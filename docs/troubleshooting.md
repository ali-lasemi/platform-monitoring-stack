# Troubleshooting

## GitHub Actions

List recent workflow runs:

gh run list --repo ali-lasemi/platform-monitoring-stack --limit 5

Inspect failed logs:

gh run view RUN_ID --repo ali-lasemi/platform-monitoring-stack --log-failed

## Prometheus

Check configuration, rule syntax, rule tests, file discovery paths, and PromQL expressions.

## Alertmanager

Validate alertmanager.yml with amtool and confirm Prometheus targets alertmanager:9093.

## Loki

Check the /ready endpoint, storage permissions, retention configuration, and compactor configuration.

## Alloy

Validate config.alloy and confirm Docker socket access.

## Grafana

Check /api/health and verify the prometheus, loki, and tempo datasource UIDs.

## Tempo

Check /ready and verify OTLP traffic reaches Tempo through the OpenTelemetry Collector.

## OpenTelemetry Collector

Validate otel-collector.yml and inspect collector logs for exporter or receiver failures.

## Backup and restore

Run scripts/backup-monitoring.sh.

Pass the generated archive to scripts/verify-restore.sh.

Restore verification must fail when required configuration artifacts are missing or empty.