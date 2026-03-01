# HEARTBEAT.md

## Periodic Checks

### openclaw-board DB polling
- Query: `SELECT "taskNumber", title, status, priority FROM "Task" WHERE archived = false ORDER BY "createdAt" DESC;`
- Action: If new TODO tasks appear, route to Planner
- Frequency: Every ~30 min
