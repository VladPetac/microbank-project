#!/bin/bash
# =========================================================================
# setup-project.sh - Sets up the MicroBank project directories and configs
# Usage: ./scripts/setup-project.sh [environment]
# Example: ./scripts/setup-project.sh dev
# =========================================================================

# Safety settings:
# -e = exit immediately if a command fails
# -u = treat unset variables as errors
# -o pipefail = if any command in a pipe fails, the whole pipe fails
set -euo pipefail

# --- Variables ---
PROJECT_NAME="MicroBank"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')          # Current date/time for logging
ENV_NAME="${1:-dev}"                            # First argument, default "dev" if not provided

# --- Functions ---

# Log function: prints timestamped messages
log() {
  echo "[$TIMESTAMP] [INFO] $1"
}

# Error function: prints errors and exits
error() {
  echo "[$TIMESTAMP] [ERROR] $1" >&2            # >&2 sends output to stderr (error stream)
  exit 1
}

# --- Main Script ---

log "Setting up $PROJECT_NAME for environment: $ENV_NAME"

# Validate environment name
case "$ENV_NAME" in
  dev|sit|uat|prod)
    log "Valid environment: $ENV_NAME"
    ;;
  *)
    error "Invalid environment: $ENV_NAME. Must be: dev, sit, uat, or prod"
    ;;
esac

# Create environment-specific directories
DIRS=("configs/$ENV_NAME" "logs/$ENV_NAME" "backups/$ENV_NAME")

for dir in "${DIRS[@]}"; do
  if [ -d "$dir" ]; then
    log "Directory already exists: $dir"
  else
    mkdir -p "$dir"
    log "Created directory: $dir"
  fi
done

# Create environment config file
CONFIG_FILE="configs/$ENV_NAME/environment.yaml"
if [ ! -f "$CONFIG_FILE" ]; then
  cat << EOF > "$CONFIG_FILE"
# MicroBank Configuration - $ENV_NAME environment
# Generated on: $TIMESTAMP

environment: $ENV_NAME
debug_mode: $([ "$ENV_NAME" = "dev" ] && echo "true" || echo "false")

database:
  host: postgres-$ENV_NAME
  port: 5432
  name: microbank_$ENV_NAME
EOF
  log "Created config file: $CONFIG_FILE"
else
  log "Config file already exists: $CONFIG_FILE"
fi

log "Setup complete for $ENV_NAME environment!"
