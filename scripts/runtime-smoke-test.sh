#!/usr/bin/env bash
set -euo pipefail

COMPOSE_FILE="${COMPOSE_FILE:-docker/docker-compose.yml}"

cleanup() {
  docker compose -f "$COMPOSE_FILE" down -v --remove-orphans || true
}

trap cleanup EXIT

docker compose -f "$COMPOSE_FILE" up -d \
  prometheus \
  alertmanager \
  grafana \
  loki \
  tempo \
  otel-collector

check_url() {
  local name="$1"
  local url="$2"

  for _ in $(seq 1 30); do
    if docker run --rm \
      --network platform-monitoring \
      curlimages/curl:8.14.1 \
      --fail \
      --silent \
      --show-error \
      "$url" >/dev/null 2>&1; then
      echo "OK: $name"
      return 0
    fi

    sleep 2
  done

  echo "FAIL: $name"
  docker compose -f "$COMPOSE_FILE" ps
  docker compose -f "$COMPOSE_FILE" logs --tail=100
  return 1
}

check_url "Prometheus" "http://prometheus:9090/-/ready"
check_url "Alertmanager" "http://alertmanager:9093/-/ready"
check_url "Grafana" "http://grafana:3000/api/health"
check_url "Loki" "http://loki:3100/ready"
check_url "Tempo" "http://tempo:3200/ready"
check_url "OpenTelemetry Collector" "http://otel-collector:13133/"

echo "runtime smoke test passed"