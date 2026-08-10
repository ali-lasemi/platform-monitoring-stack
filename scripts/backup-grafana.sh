#!/usr/bin/env bash
set -euo pipefail

BACKUP_ROOT="${BACKUP_ROOT:-./backups}"
TIMESTAMP="$(date -u +%Y%m%dT%H%M%SZ)"
BACKUP_DIR="${BACKUP_ROOT}/${TIMESTAMP}"
ARCHIVE="${BACKUP_ROOT}/platform-monitoring-${TIMESTAMP}.tar.gz"

mkdir -p "$BACKUP_DIR"

cp -R examples/prometheus "$BACKUP_DIR/prometheus"
cp -R examples/alertmanager "$BACKUP_DIR/alertmanager"
cp -R examples/grafana "$BACKUP_DIR/grafana"
cp -R examples/loki "$BACKUP_DIR/loki"
cp -R examples/alloy "$BACKUP_DIR/alloy"
cp docker/docker-compose.yml "$BACKUP_DIR/docker-compose.yml"
cp .env.example "$BACKUP_DIR/.env.example"

tar -czf "$ARCHIVE" -C "$BACKUP_ROOT" "$TIMESTAMP"
tar -tzf "$ARCHIVE" >/dev/null

echo "$ARCHIVE"