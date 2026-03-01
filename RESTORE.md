# OpenClaw Backup Restore Instructions

## Files Included

### Workspace Configuration
- **Main workspace**: AGENTS.md, BOOTSTRAP.md, HEARTBEAT.md, IDENTITY.md, MEMORY.md, SOUL.md, TOOLS.md, USER.md, WORKFLOW_AUTO.md
- **Developer workspace**: AGENTS.md, HEARTBEAT.md, IDENTITY.md, SOUL.md, TOOLS.md, USER.md
- **Planner workspace**: AGENTS.md, HEARTBEAT.md, IDENTITY.md, MEMORY.md, SOUL.md, TOOLS.md, USER.md
- **BizResearcher workspace**: AGENTS.md, HEARTBEAT.md, IDENTITY.md, MEMORY.md, SOUL.md, TOOLS.md, USER.md

### Configuration
- **config/package.json**: NPM dependencies (non-sensitive)

### Not Backed Up (Contains Sensitive Data)
The following files contain credentials/tokens and are NOT included in backup:
- `openclaw.json` - Main config with API keys and tokens
- `exec-approvals.json` - Execution approval tokens
- `*.db`, `*.sqlite` - Runtime databases

### Automation
- **backup.sh**: Daily backup script (runs at 22:00 UTC)

---

## Restore Steps

### 1. Clone the Backup Repo
```bash
git clone https://github.com/srinivas486/openclaw.git
cd openclaw
```

### 2. Restore Main Workspace
Copy files to `/root/.openclaw/workspace/`:
```bash
cp workspace/*.md /root/.openclaw/workspace/
```

### 3. Restore Sub-Agent Workspaces
```bash
cp workspace-developer/*.md /root/.openclaw/workspace-developer/
cp workspace-planner/*.md /root/.openclaw/workspace-planner/
cp workspace-bizresearcher/*.md /root/.openclaw/workspace-bizresearcher/
```

### 4. Restore Config Files
```bash
# Restore package.json (NPM dependencies)
cp config/package.json /root/.openclaw/
```

### 5. Reinstall Dependencies (if needed)
```bash
cd /root/.openclaw
npm install
```

### 6. Recreate Cron Jobs
The backup includes the backup script but not cron job definitions. To recreate:
```bash
# The cron job runs daily at 22:00 UTC to sync config changes
# Recreate using OpenClaw's cron tool if needed
```

### 7. Verify
- Restart OpenClaw gateway: `openclaw gateway restart`
- Verify all agents load correctly
- Check agent status: `openclaw status`

---

## Important Notes

1. **Credentials not backed up**: API keys, tokens, and passwords are intentionally excluded. You'll need to re-enter these after a restore.

2. **Runtime data not backed up**: SQLite databases, logs, and runtime state are not included.

3. **Cron jobs not backed up**: The backup script is included but cron job definitions must be manually recreated.

4. **After restore**: Review all configuration files for any environment-specific settings that may need updating.

---

## Backup Schedule
- Daily at 22:00 UTC (≈9am Melbourne AEDT)
- Script location: `/root/.openclaw/backup-openclaw/backup.sh`

---

For questions or issues, check the GitHub repo: https://github.com/srinivas486/openclaw
