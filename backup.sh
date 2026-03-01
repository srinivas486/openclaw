#!/bin/bash
# OpenClaw Daily Backup Script
# Pulls latest, syncs config files, commits and pushes if changes exist

set -e

REPO_DIR="/root/.openclaw/backup-openclaw"
SRC_DIR="/root/.openclaw"

cd "$REPO_DIR"

# Pull latest from origin
git fetch origin main
git pull origin main || true

# Sync workspace files
cp -n "$SRC_DIR"/workspace/AGENTS.md "$SRC_DIR"/workspace/BOOTSTRAP.md "$SRC_DIR"/workspace/HEARTBEAT.md "$SRC_DIR"/workspace/IDENTITY.md "$SRC_DIR"/workspace/MEMORY.md "$SRC_DIR"/workspace/SOUL.md "$SRC_DIR"/workspace/TOOLS.md "$SRC_DIR"/workspace/USER.md "$SRC_DIR"/workspace/WORKFLOW_AUTO.md workspace/ 2>/dev/null || true

cp -n "$SRC_DIR"/workspace-developer/AGENTS.md "$SRC_DIR"/workspace-developer/HEARTBEAT.md "$SRC_DIR"/workspace-developer/IDENTITY.md "$SRC_DIR"/workspace-developer/SOUL.md "$SRC_DIR"/workspace-developer/TOOLS.md "$SRC_DIR"/workspace-developer/USER.md workspace-developer/ 2>/dev/null || true

cp -n "$SRC_DIR"/workspace-planner/AGENTS.md "$SRC_DIR"/workspace-planner/HEARTBEAT.md "$SRC_DIR"/workspace-planner/IDENTITY.md "$SRC_DIR"/workspace-planner/MEMORY.md "$SRC_DIR"/workspace-planner/SOUL.md "$SRC_DIR"/workspace-planner/TOOLS.md "$SRC_DIR"/workspace-planner/USER.md workspace-planner/ 2>/dev/null || true

cp -n "$SRC_DIR"/workspace-bizresearcher/AGENTS.md "$SRC_DIR"/workspace-bizresearcher/HEARTBEAT.md "$SRC_DIR"/workspace-bizresearcher/IDENTITY.md "$SRC_DIR"/workspace-bizresearcher/MEMORY.md "$SRC_DIR"/workspace-bizresearcher/SOUL.md "$SRC_DIR"/workspace-bizresearcher/TOOLS.md "$SRC_DIR"/workspace-bizresearcher/USER.md workspace-bizresearcher/ 2>/dev/null || true

# Check for changes
if git diff --quiet --ignore-untracked . && ! git diff --cached --quiet; then
    echo "No changes to commit."
    exit 0
fi

# Add all tracked files
git add -A

# Commit with timestamp
DATE=$(date '+%Y-%m-%d %H:%M:%S %Z')
git commit -m "Daily backup - $DATE

Co-authored-by: Openclaw <openclaw@srinivas486.ddns.net>" || true

# Push to origin
git push origin main

echo "Backup complete at $DATE"
