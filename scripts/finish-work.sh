#!/bin/bash
# ================================================================
# finish-work.sh - Commit, push and wrap up current work session
# Usage: ./scripts/finish-work.sh
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

# Get current branch name
CURRENT_BRANCH=$(git branch --show-current)

# Make sure we're not on main
if [ "$CURRENT_BRANCH" = "main" ]; then
  error "You are on main branch. Never commit directly to main!"
fi

log "Wrapping up work session on branch: $CURRENT_BRANCH"

# Show what's changed
echo ""
log "Current changes:"
git status

# Ask for confirmation to proceed
echo ""
echo "Do you want to stage all changes? (yes/no):"
read -r CONFIRM_ADD

if [ "$CONFIRM_ADD" != "yes" ]; then
  error "Aborted. Stage your files manually and re-run."
fi

git add .

# Ask for commit message
echo ""
echo "Enter your commit message (e.g. JIRA-1234: Add login endpoint):"
read -r COMMIT_MESSAGE

if [ -z "$COMMIT_MESSAGE" ]; then
  error "Commit message cannot be empty."
fi

git commit -m "$COMMIT_MESSAGE"

# Push to both remotes
log "Pushing to GitHub..."
git push github "$CURRENT_BRANCH"

log "Pushing to GitLab..."
git push gitlab "$CURRENT_BRANCH"

# Print PR/MR reminder
echo ""
echo "============================================================================================================================================================================================="
echo " NEXT STEPS - Open a Pull/Merge Request"
echo "============================================================================================================================================================================================="
echo ""
echo " GitHub PR:"
echo " https://github.com/VladPetac/microbank-project/compare/$CURRENT_BRANCH"
echo ""
echo " GitLab MR:"
echo " https://gitlab.com/VladPetac/microbank-project/-/merge_requests/new?merge_request[source_branch]=$CURRENT_BRANCH"
echo ""
echo "============================================================================================================================================================================================="

log "Work session complete. Branch '$CURRENT_BRANCH' pushed to both remotes."
log "Remember to open your PR/MR before signing off!"
