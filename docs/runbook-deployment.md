# MicroBank Deployment Runbook

## Purpose
Step-by-step guide for deploying MicroBank to any environment.

## Pre-Deployment Checklist
- [ ] Change Request approved (CR-XXXX)
- [ ] All pipeline stages passed (green pipeline)
- [ ] Docker images promoted to target environment tag
- [ ] Database migrations reviewed (if any)
- [ ] Rollback plan documented
- [ ] Stakeholders notified of deployment window

## Deployment Steps

### 1. Verify Image Availability
docker pull registry.example.com/microbank/account-service
docker pull registry.example.com/microbank/transaction-service
docker pull registry.example.com/microbank/nginx

### 2. Database Backup (if production)
pg_dump -U microbank_user microbank > backup_$(date +%Y%M%d_%H%M%S).sql

### 3. Deploy
./scripts/deploy-local.sh up

### 4. Post-Deployment Verification
./scripts/health-check.sh http://localhost:80/health 5 10
./scripts/health-check.sh http://localhost:8080/actuator/health 5 10

### 5. Monitor (30 minutes)
- Check Grafana dashboard (when available)
- Watch application logs: `docker compose logs -f`
- Verify no error spikes

## Rollback Procedure
If deployment fails:
1. Stop current deployment: `docker compose down`
2. Restore previous image tags
3. Redeploy: `docker compose up -d`
4. Verify health
5. Notify stakeholders

## Post-Deployment
- [ ] Update deployment log
- [ ] Close Change Request
- [ ] Notify stakeholders of completion
