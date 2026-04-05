#!/bin/bash
# =============================================================================
# promote-image.sh - Promotes a Docker image from one environment to the next
# Usage: ./scripts/promote-image.sh <image_name> <source_env> <target_env>
# Example: ./scripts/promote-image.sh microbank/nginx dev sit
# =============================================================================

set -euo pipefail

# --- Arguments ---
IMAGE_NAME="${1:?Usage: $0 <image_name> <source_env> <target_env>}"
SOURCE_ENV="${2:?Specify source environment (dev/sit/uat)}"
TARGET_ENV="${3:?Specify target environment (sit/uat/prod)}"

# --- Validation ---
VALID_ENVS=("dev" "sit" "uat" "prod")
PROMOTION_ORDER=("dev" "sit" "uat" "prod")

log()   { echo "[$(date '+%H:%M:%S')] [INFO]  $1"; }
error() { echo "[$(date '+%H:%M:%S')] [ERROR] $1" >&2; exit 1; }

# Check valid environments
validate_env() {
  local env="$1"
  for valid in "${VALID_ENVS[@]}"; do
    if [ "$env" = "$valid" ]; then return 0; fi
  done
  error "Invalid environment: $env. Valid: ${VALID_ENVS[*]}"
}

validate_env "$SOURCE_ENV"
validate_env "$TARGET_ENV"

# Check promotion order (can't skip environments or go backward)
get_index() {
  local target="$1"
  for i in "${!PROMOTION_ORDER[@]}"; do
    if [ "${PROMOTION_ORDER[$i]}" = "$target" ]; then echo "$i"; return; fi
  done
}

SRC_IDX=$(get_index "$SOURCE_ENV")
TGT_IDX=$(get_index "$TARGET_ENV")

if [ "$TGT_IDX" -le "$SRC_IDX" ]; then
  error "Cannot promote backward: $SOURCE_ENV -> $TARGET_ENV"
fi

if [ $((TGT_IDX - SRC_IDX)) -gt 1 ]; then
  error "Cannot skip environments: $SOURCE_ENV -> $TARGET_ENV. Must promote to ${PROMOTION_ORDER[$((SRC_IDX+1))]} first."
fi

# --- Promotion ---
log "Promoting $IMAGE_NAME: $SOURCE_ENV -> $TARGET_ENV"

SOURCE_TAG="${IMAGE_NAME}:${SOURCE_ENV}"
TARGET_TAG="${IMAGE_NAME}:${TARGET_ENV}"

log "Retagging $SOURCE_TAG -> $TARGET_TAG"
docker tag "$SOURCE_TAG" "$TARGET_TAG" 2>/dev/null || error "Source image not found: $SOURCE_TAG"

log "Promotion complete: $TARGET_TAG"
log "Next step: verify in $TARGET_ENV environment, then approve for next promotion"

# In a real pipeline, this would push to a registry:
# docker push "$TARGET_TAG"
