#!/usr/bin/env bash
set -euo pipefail

ARCHIVE="${1:-}"

if [[ -z "$ARCHIVE" ]]; then
  echo "usage: $0 <backup-archive.tar.gz>"
  exit 1
fi

if [[ ! -f "$ARCHIVE" ]]; then
  echo "backup archive not found: $ARCHIVE"
  exit 1
fi

RESTORE_DIR="$(mktemp -d)"
trap 'rm -rf "$RESTORE_DIR"' EXIT

tar -xzf "$ARCHIVE" -C "$RESTORE_DIR"

ROOT_DIR="$(find "$RESTORE_DIR" -mindepth 1 -maxdepth 1 -type d | head -n 1)"

required_paths=(
  "$ROOT_DIR/prometheus/prometheus.yml"
  "$ROOT_DIR/prometheus/rules/platform-alerts.yml"
  "$ROOT_DIR/alertmanager/alertmanager.yml"
  "$ROOT_DIR/grafana/provisioning/datasources/datasources.yml"
  "$ROOT_DIR/grafana/provisioning/dashboards/dashboards.yml"
  "$ROOT_DIR/loki/loki-config.yml"
  "$ROOT_DIR/alloy/config.alloy"
  "$ROOT_DIR/docker-compose.yml"
  "$ROOT_DIR/.env.example"
)

for path in "${required_paths[@]}"; do
  if [[ ! -s "$path" ]]; then
    echo "restore verification failed: missing or empty $path"
    exit 1
  fi
done

echo "restore verification passed"