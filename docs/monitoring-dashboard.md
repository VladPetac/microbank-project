# MicroBank Monitoring Dashboard

## Overview Panel
- Total requests per second (all services)
- Overall error rate (percentage)
- Active pod count vs desired

## Per-Service Panels
For each of: Account Service, Transaction Service, Nginx

| Metric | PromQL Query Concept | Alert Threshold |
|--------|---------------------|-----------------|
| Request rate | rate(http_requests_total[5m]) | N/A |
| Error rate | rate(http_requests_total{status=~"5.."}[5m]) / rate(http_requests_total[5m]) | > 5% for 5 min |
| Latency (p95) | histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m])) | > 2 seconds |
| Memory usage | container_memory_usage_bytes | > 80% of limit |
| CPU usage | rate(container_cpu_usage_seconds_total[5m]) | > 80% of limit |

## Database Panel
- Active connections
- Query latency
- Disk usage

## SLI/SLO Targets (Service Level Indicators / Objectives)
- **Availability SLO**: 99.9% uptime (max 43 min downtime/month)
- **Latency SLO**: 95% of requests complete within 500ms
- **Error Rate SLO**: Less than 0.1% of requests return 5xx errors
