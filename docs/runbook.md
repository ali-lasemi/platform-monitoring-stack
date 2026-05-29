# Incident Runbook

Operational runbook for responding to common monitoring alerts.

---

# TargetDown

## Meaning

A monitored service or exporter is not reachable by Prometheus.

## First Checks

```bash
docker ps
docker logs <container-name>
docker compose -f docker/docker-compose.yml ps
```

## Common Causes

- Container stopped
- Wrong service port
- Network issue
- Invalid Prometheus target
- Service startup failure

## Recovery Actions

```bash
docker compose -f docker/docker-compose.yml restart <service-name>
```

If the service does not recover:

```bash
docker compose -f docker/docker-compose.yml logs <service-name>
```

---

# HighCPUUsage

## Meaning

CPU usage is above the defined threshold for a sustained period.

## First Checks

```bash
top
htop
docker stats
```

## Common Causes

- Traffic spike
- Infinite loop
- Resource-heavy background job
- Misconfigured container
- Insufficient server capacity

## Recovery Actions

- Identify the highest CPU process
- Restart unhealthy services
- Scale workload if possible
- Review recent deployments

---

# HighMemoryUsage

## Meaning

Memory usage is above the defined threshold for a sustained period.

## First Checks

```bash
free -h
docker stats
```

## Common Causes

- Memory leak
- Large cache usage
- Too many running containers
- Insufficient server memory

## Recovery Actions

- Restart leaking service
- Reduce workload
- Add memory limits
- Scale server capacity

---

# ContainerRestartingFrequently

## Meaning

A container appears to be restarting repeatedly.

## First Checks

```bash
docker ps
docker logs <container-name>
docker inspect <container-name>
```

## Common Causes

- Invalid environment variables
- Application crash
- Missing dependency
- Port conflict
- Failed healthcheck

## Recovery Actions

- Inspect logs
- Fix configuration
- Roll back recent changes
- Restart service after validation

---

# Escalation

Escalate when:

- Critical alerts last more than 15 minutes
- Multiple services fail together
- Data loss is suspected
- Manual recovery fails

---

# Post-Incident Review

After resolution, document:

- What happened
- Root cause
- Impact
- Recovery steps
- Prevention actions