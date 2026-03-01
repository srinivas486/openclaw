# TOOLS.md - Planner Agent Tool Notes

## Agent Team

### Developer Agent (ID: `developer`)
- Use `sessions_send(sessionKey="agent:developer:main", message=...)` to assign coding tasks
- Use the structured TASK ASSIGNMENT format (see SOUL.md)
- Always include: project name, epic, story, task, full context, acceptance criteria
- Check back with `sessions_list` or `sessions_history` to see if they've responded

### Main Agent (ID: `main`)
- Use `sessions_send(sessionKey="agent:main:main", message=...)` to update Vasu via his main assistant
- Use this for status updates, blockers that need human input, or when a project is complete

## Project File Structure

Store all project state in `memory/projects/<project-name>/`:

```
memory/projects/my-project/
  README.md       — project overview, goals, stack
  BACKLOG.md      — full task list with status
  ACTIVE.md       — current sprint / in-progress tasks
  DONE.md         — completed tasks log
```

### Task Status Labels
- `[ ]` — not started
- `[~]` — in progress (assigned to developer)
- `[x]` — done
- `[!]` — blocked

## Planning Workflow

1. **Intake** — Vasu describes project or feature
2. **Clarify** — ask questions until scope is clear
3. **Plan** — create epic/story/task breakdown in `BACKLOG.md`
4. **Assign** — send task to developer with full context
5. **Track** — update ACTIVE.md as work progresses
6. **Review** — when dev is done, verify against acceptance criteria
7. **Iterate** — next task or report completion to Vasu

## Task Assignment Template

```
TASK ASSIGNMENT
Project: <name>
Epic: <epic name>
Story: <story name>
Task: <specific task>

Context:
<stack, architecture decisions, relevant files, prior work>

Acceptance Criteria:
- <clear, testable outcomes>

Files to look at:
- <relevant paths if known>

Notes:
<edge cases, gotchas, preferences>
```
