#!/bin/bash
# ==========================================================================
# deploy-local.sh - Builds and deploys MicroBank locally via Docker Compose
# Usage: ./scripts/deploy-local.sh [up|down|restart|status|logs]
# ==========================================================================

set -euo pipefail

COMPOSE_FILE="docker-compose.yml"
PROJECT_DIR="$(cd "$(dirname "$0")/.." & pwd)"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

log () { echo "[$TIMESTAMP] $1"; }
error() { echo "[$TIMESTAMP] ERROR: $1" >&2; exit 1; }

cd "$PROJECT_DIR"

case "${1:-status}" in
  up)
    log "Starting MicroBank stack..."
    docker compose -f "$COMPOSE_FILE" up -d --build
    log "Waiting for services to be healthy..."
    sleep 10
    docker compose ps
    log "MicroBank is running!"
    ;;
  down)
    log "Stopping MicroBank stack..."
    docker compose -f "$COMPOSE_FILE" down
    log "MicroBank stopped."
    ;;
  restart)
    log "Restarting MicroBank stack..."
    docker compose -f "$COMPOSE_FILE" down
    docker compose -f "$COMPOSE_FILE" up -d --build
    log "MicroBank restarted."
    ;;
  status)
    docker compose -f "$COMPOSE_FILE" ps
    ;;
  logs)
    docker compose -f "$COMPOSE_FILE" logs -f --tail=50
    ;;
  *)
    echo "Usage: $0 {up|down|restart|status|logs}"
    exit 1
    ;;
esac
