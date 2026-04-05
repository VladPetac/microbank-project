#!/bin/bash
# validate.sh - Run all checks locally before pushing

echo "Running ShellCheck..."
shellcheck scripts/*.sh

echo "Running yamllint..."
yamllint -d relaxed configs/
yamllint -d relaxed docker-compose.yml
yamllint -d relaxed .gitlab-ci.yml

echo "Validating Docker Compose..."
docker compose config > /dev/null

echo "All checks passed! Safe to push."
