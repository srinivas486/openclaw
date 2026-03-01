# 🎬 Home Theater Optimization - Long-Term Memory

## Current Setup Overview
- **Primary Use**: Sim racing + immersive home theater.
- **Key Components**: High-end speakers (e.g., Sonos Arc, Yamaha YHT-3995), 4K/8K projector with OLED panel (Xiaomi Mi Home Projector).
- **Software**: Kodi + Plex for media streaming.

## Optimization Goals
| Category          | Current Status       | Target Improvement               |
|-------------------|----------------------|----------------------------------|
| Audio Latency     | ~15ms                | <10ms                            |
| Color Accuracy    | 98% (DCI-P3)         | 100% (P3 + BT.2020)              |
| Input Lag         | ~20ms                | <15ms                            |

## Key Configurations
- **Audio Profile**: Enable Dolby Vision/Atmos in Kodi/Plex; adjust speaker placement for surround sound calibration.
- **Video Profile**: Force 4K HDR with dynamic metadata (e.g., `HDR10+`); disable upscaling artifacts via GPU settings.

## Debugging & Troubleshooting
### Recent Issues:
**Error**: `TypeError: unsupported operand type(s) for +: 'NoneType' and 'int'` in age validation.
- **Root Cause**: Missing/invalid data fields (e.g., birth_year) causing `None` return during age calculation.
- **Fix**: Temporary workaround implemented:
  ```python
  def validate_age(data):
      birth_year = int(data.get("birth_year", 0)) if data.get("birth_year") else None
      return current_year - birth_year if birth_year else None
  ```

## February 21, 2026 Actions
- Updated workflows (`WORKFLOW_AUTO.md`, `memory/YYYY-MM-DD.md`) for debugging tasks.
- Planned test session to validate optimizations and debug integration issues.

## February 22, 2026 - Agent Team Setup
Configured 3-agent orchestration pipeline:

**Team structure:**
- Main (me) — orchestrator + Vasu's only point of contact
- Planner (`agent:planner:main`) — project planning, Epics/Stories/Tasks breakdown
- Developer (`agent:developer:main`) — code implementation only

**Rules I must follow:**
- Route all project/dev requests to planner via sessions_send
- Present planner's breakdown to Vasu for approval BEFORE anything goes to developer
- Only send approval to planner after Vasu explicitly approves
- For status requests, ask planner and summarise back to Vasu
- Never send tasks to developer directly — always via planner
- Planner and developer have heartbeats disabled — they only act when invoked
- Orchestration workflow documented in `WORKFLOW_AUTO.md`

## February 23, 2026 — Planner Owns Research (Workflow Update)

Vasu confirmed: Option B — Planner owns all pre-task research.

**My rule (Main agent):** Pass raw requests to Planner with minimal pre-processing. Do NOT fetch URLs, inspect repos, or do research myself before routing. Planner handles all of that.

**Planner's expanded role:** Research (web_fetch, curl, read files, inspect repos) → decompose → present plan to Main → wait for approval → dispatch to Developer.

## February 23, 2026 — PR-First Workflow Enforced

Standing rule added to Developer and Planner agents:

- Developer **must always create a feature branch** (`feature/<project>/<slug>`) from latest main
- Developer **must always open a GitHub PR** — never push directly to main
- PR must include: summary, files changed, acceptance criteria status, testing steps
- Planner **must include branch name + PR reminder** in every TASK ASSIGNMENT
- Planner **must verify PR URL is in TASK COMPLETE** before reporting done to main
- Vasu reviews and merges all PRs — agents never merge their own work
- Commit format: Conventional Commits (`feat/fix/refactor/chore`)

---

## February 24, 2026 — Closed Tasks

- **Agent comms flow HTML** (`agent-comms-flow.html`) — Vasu closed this task, no longer needed. Do not resurface.

---

## February 24, 2026 — Git Hygiene Incident (Lesson Learned)

**What happened:** Developer workspace (`/root/.openclaw/workspace-developer`) is the same directory as the project repo. In commit `c8b6e4b`, the developer used an unguarded `git add` and committed agent system files (`AGENTS.md`, `SOUL.md`, `USER.md`, `TOOLS.md`, `IDENTITY.md`, `HEARTBEAT.md`, `flow.html`, `.openclaw/`) to the **public** GitHub repo. `USER.md` contained Vasu's personal info.

**Fix applied:** Cleanup PR #2 merged, `.gitignore` added to repo. History rewrite not requested by Vasu.

**Rules added to Developer + Planner AGENTS.md:**
- Developer must verify/create `.gitignore` before first `git add` in any repo
- Developer must never use `git add .` or `git add -A` — always add files explicitly
- Developer must run `git status` + `git diff --cached` before every commit
- Planner must include a git hygiene reminder block in every TASK ASSIGNMENT that involves git

---
## February 25, 2026 — BizResearcher Agent Created

New agent `bizresearcher` created and live. Researches companies for Skillfield sales intelligence.
- Workspace: `/root/.openclaw/workspace-bizresearcher`
- Produces `{slug}-research.html` reports
- **When research is complete: Main must send the PDF as an attachment to Vasu via WhatsApp**
  - BizResearcher saves both `.html` and `.pdf` to `/root/.openclaw/workspace/`
  - Use `message` tool with `filePath` pointing to the PDF (WhatsApp blocks .html files)
  - wkhtmltopdf is installed for HTML→PDF conversion
  - Skillfield brand colors: `#cd248b` (pink), `#348ec6` (blue), `#b152c7` (purple) on `#0d0d0d` dark bg

## February 25, 2026 — Projects Tracked

Active projects:
- `audyssey-rew-tuner` — merged, done
- `skillfield-landing` — live on GitHub Pages, done
- `agent-infra` — ongoing quality/standards upgrades

[End of durable memory entry. Append new content here if needed.]