# Deployment Guide

Production-oriented deployment workflow for the monitoring stack.

---

# Start Stack

```bash
docker compose -f docker/docker-compose.yml up -d
```

---

# Stop Stack

```bash
docker compose -f docker/docker-compose.yml down
```

---

# Verify Running Containers

```bash
docker ps
```

---

# Healthcheck

Run:

```bash
./scripts/healthcheck.sh
```

---

# Default Ports

| Service       | Port |
|----------------|------|
| Grafana        | 3000 |
| Prometheus     | 9090 |
| Loki           | 3100 |
| Alertmanager   | 9093 |

---

# Production Notes

- Change default Grafana credentials
- Configure persistent volumes
- Enable HTTPS behind reverse proxy
- Configure alert receivers
- Add backup workflows
- Monitor container health

---

# Recommended Reverse Proxy

- Nginx
- Traefik
- Apache

---

# Example Workflow

1. Start stack
2. Verify containers
3. Open Grafana dashboards
4. Configure alerts
5. Monitor infrastructure
6. Investigate incidents