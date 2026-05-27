#!/usr/bin/env bash
set -Eeuo pipefail

SERVICES=(
  "http://127.0.0.1:9090/-/healthy"
  "http://127.0.0.1:3000/api/health"
  "http://127.0.0.1:3100/ready"
  "http://127.0.0.1:9093/-/healthy"
)

for url in "${SERVICES[@]}"; do
  echo "Checking: $url"

  status_code="$(curl -sS -o /dev/null -w "%{http_code}" "$url")"

  if [[ "$status_code" != "200" ]]; then
    echo "Healthcheck failed for $url"
    exit 1
  fi

  echo "Healthy: $url"
done

echo "All monitoring services are healthy."