#!/bin/bash
# ================================================================
# start-work.sh - Start a new work session on MicroBanck project
# Usage: ./scripts/start-work.sh
# ================================================================

set -euo pipefail

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

log() {
  echo "[$TIMESTAMP] [INFO] $1"
}

error() {
  echo "[$TIMESTAMP] [ERROR] $1" >&2
  exit 1
}

log "Starting MicroBank work session..."

# Switch to main and pull latest from both remotes (GitHub and GitLab)
log "Switching to main branch..."
git checkout main

log "Fetching and pruning from GitHub..."
git fetch github --prune

log "Fetching and pruning from GitLab..."
git fetch gitlab --prune

log "Pulling latest main from GitHub..."
git pull github main

# Show current branch state
log "Current branches:"
git branch -a

# Ask for new branch name
echo ""
echo "Enter the name for your new branch (e.g. feature/JIRA-1234-add-login):"
read -r BRANCH_NAME

# Validate branch name is not empty
if [ -z "$BRANCH_NAME" ]; then
  error "Branch name cannot be empty."
fi

# Create and switch to new branch
git checkout -b "$BRANCH_NAME"

log "Work session started on branch: $BRANCH_NAME"
log "Good luck!"
