#!/bin/bash
# =====================================================================
# health-check.sh - Checks if a service is healthy with retry logic
# Usage: ./scripts/health-check.sh <url> [max_entries] [wait_seconds]
# Example: ./scripts/health-check.sh http://localhost:8080/health 5 10
# =====================================================================

set -euo pipefail

# --- Arguments with defaults ---
URL="${1:?Usage: $0 <url> [max_entries] [wait_seconds]}"
MAX_RETRIES="${2:-5}"                    # Default: 5 retries
WAIT_SECONDS="${3:-10}"                  # Default: 10 seconds between retries
TIMEOUT=5                                # curl timeout in seconds

# --- Logging ---
log()     { echo "[$(date '+%H:%M:%S')] [INFO] $1"; }
warn()    { echo "[$(date '+%H:%M:%S')] [WARN] $1"; }
error()   { echo "[$(date '+%H:%M:%S')] [WARN] $1" >&2; }

# --- Main ---
log "Health check: $URL (max $MAX_RETRIES retries, ${WAIT_SECONDS}s between)"

attempt=0
while [ "$attempt" -lt "$MAX_RETRIES" ]; do
  attempt=$((attempt +1))
  log "Attempt $attempt of $MAX_RETRIES..."

  # Try to reach the URL
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --timeout "$TIMEOUT" "$URL" 2>/dev/null || echo "000")

  if [ "$HTTP_CODE" = "200" ]; then
    log "Service is healthy! (HTTP $HTTP_CODE)"
    exit 0
  else
    warn "Service not ready (HTTP $HTTP_CODE)"
    if [ "$attempt" -lt "$MAX_RETRIES" ]; then
      log "Waiting ${WAIT_SECONDS}s before next attempt..."
      sleep "$WAIT_SECONDS"
    fi
  fi
done

error "Service failed health check after $MAX_RETRIES attempts"
exit 1
