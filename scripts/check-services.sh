#!/bin/bash
# =============================================================================
# check-services.sh — Checks if MicroBank services are reachable
# This script simulates what you'd run after a deployment
# Usage: ./scripts/check-services.sh
# =============================================================================

set -euo pipefail

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Define services to check (name:port pairs)
# In real life, these would be actual service URLs
SERVICES=(
  "account-service:8080"
  "transaction-service:8081"
  "nginx:80"
  "postgres:5432"
)

PASSED=0
FAILED=0

echo "=================================="
echo " MicroBank Service Health Check"
echo " Time: $TIMESTAMP"
echo "=================================="
echo ""

for service_entry in "${SERVICES[@]}"; do
  # Split the entry by ':'
  SERVICE_NAME="${service_entry%%:*}"          # Everything before the ':'
  SERVICE_PORT="${service_entry##*:}"          # Everything after the ':'

  echo -n "Checking $SERVICE_NAME (port $SERVICE_PORT)... "

  # Simulate a health check (in real life, we'd use curl or nc)
  # For now, we just check if the port number is valid
  if [[ "$SERVICE_PORT" =~ ^[0-9]+$ ]] && [ "$SERVICE_PORT" -gt 0 ] && [ "$SERVICE_PORT" -lt 65536 ]; then
    echo "✅ CONFIGURED (port valid)"
    PASSED=$((PASSED +1))
  else
    echo "❌ INVALID PORT"
    FAILED=$((FAILED + 1))
  fi
done

echo ""
echo "==========================================="
echo " Results: $PASSED passed, $FAILED failed"
echo "==========================================="

# Exit with error code if any failed
if [ "$FAILED" -gt 0 ]; then
  exit 1
fi
