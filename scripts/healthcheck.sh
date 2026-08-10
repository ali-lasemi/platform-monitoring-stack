#!/usr/bin/env bash
set -euo pipefail

check_http() {
  local name="$1"
  local url="$2"

  if ! curl --fail --silent --show-error "$url" >/dev/null; then
    echo "FAIL: $name health check failed: $url"
    exit 1
  fi

  echo "OK: $name"
}

check_http "Prometheus" "http://prometheus:9090/-/ready"
check_http "Alertmanager" "http://alertmanager:9093/-/ready"
check_http "Loki" "http://loki:3100/ready"
check_http "Grafana" "http://grafana:3000/api/health"

TARGETS_JSON="$(curl --fail --silent http://prometheus:9090/api/v1/targets)"

if echo "$TARGETS_JSON" | grep -q '"health":"down"'; then
  echo "FAIL: one or more Prometheus targets are down"
  exit 1
fi

echo "OK: Prometheus targets"