# Alert Routing Strategy

This document describes the Alertmanager routing strategy used in this monitoring stack.

---

## Routing Goals

- Prioritize critical incidents
- Reduce alert noise
- Group related alerts
- Separate urgent alerts from scheduled review alerts
- Provide a foundation for notification integrations

---

## Severity Levels

### Critical

Critical alerts represent urgent incidents that require fast attention.

Examples:

- TargetDown
- Multiple services unavailable
- Monitoring system failure

Routing:

- Receiver: critical-alerts
- Repeat Interval: 1 hour
- Group Wait: 10 seconds

---

### Warning

Warning alerts represent important but less urgent conditions.

Examples:

- High CPU usage
- High memory usage
- Container restart patterns

Routing:

- Receiver: warning-alerts
- Repeat Interval: 6 hours
- Group Wait: 1 minute

---

### Info

Informational alerts are low-priority signals.

Examples:

- Maintenance notifications
- Non-urgent operational events

Routing:

- Receiver: informational-alerts
- Repeat Interval: 12 hours
- Group Wait: 5 minutes

---

## Grouping Strategy

Alerts are grouped by:

- alertname
- severity
- job

This reduces duplicated notifications.

---

## Inhibition Strategy

Critical alerts suppress warning alerts with the same:

- alertname
- instance

This helps reduce alert noise during incidents.

---

## Production Integrations

Receivers can later be connected to:

- Slack
- Telegram
- Email
- PagerDuty
- Webhooks

This repository intentionally leaves receivers empty to remain environment-independent.