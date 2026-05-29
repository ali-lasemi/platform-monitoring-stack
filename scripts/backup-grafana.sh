#!/usr/bin/env bash
set -Eeuo pipefail

BACKUP_DIR="${BACKUP_DIR:-./backups}"
TIMESTAMP="$(date +%Y%m%d%H%M%S)"
BACKUP_FILE="$BACKUP_DIR/grafana-backup-$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

echo "Creating Grafana backup..."

docker run --rm \
  -v platform-monitoring-stack_grafana_data:/grafana-data:ro \
  -v "$(pwd)/$BACKUP_DIR:/backup" \
  alpine \
  tar -czf "/backup/grafana-backup-$TIMESTAMP.tar.gz" -C /grafana-data .

echo "Backup created: $BACKUP_FILE"