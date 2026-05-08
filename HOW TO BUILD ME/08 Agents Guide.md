# 08 — Agents Guide

Agents are subagents Claude spawns for multi-step, autonomous tasks.

## Agent vs Command

| | Command (x- skill) | Agent |
|--|---|---|
| **Triggered by** | You typing `something` | A command that spawns it |
| **Scope** | Interactive, one task | Autonomous, multi-step |
| **Context** | Shares your conversation | Gets its own context window |
| **Use for** | Quick lookups, digests | Deep research, synthesis |

## Agent Definition Files

Stored in `8 [YOUR BRAIN]/Agents/`. These are spec files — they tell Claude exactly what the agent should do when spawned.

```
8 [YOUR BRAIN]/Agents/
├── _Index.md              ← all agents listed with triggers
├── Daily Digest Agent.md  ← triggered by alfred
├── Anomaly Agent.md       ← triggered by anomaly
└── Deep Dive Agent.md     ← triggered by deepdive
```

## Writing an Agent Definition

```markdown
# [Agent Name]
**Trigger:** `command`
**Output:** `path/to/output/YYYY-MM-DD.md`

## Steps
1. Read context file (About Me, project note, etc.)
2. Fetch live data (Gmail, Slack, Jira, Snowflake)
3. Synthesize findings
4. Write output to vault in specified format
5. Update related notes (People pages, project status)

## Output Format
\```markdown
---
type: [note type]
date: YYYY-MM-DD
---
# [Title]
[structured content]
\```
```

## The Three Core Agents

### Daily Digest Agent
- **What:** Runs every morning via `alfred`
- **Sources:** Gmail + Calendar + Slack + Jira + yesterday's daily note
- **Output:** `6 Reviews/Daily/YYYY-MM-DD.md` + `6 Reviews/Team/YYYY-MM-DD-jira.md`
- **Special:** VIP/Team messages surfaced first ⭐

### Anomaly Agent
- **What:** Logs and investigates data/system anomalies
- **Sources:** Snowflake, Jira, Slack, email
- **Output:** `7 Metrics & KPIs/Anomalies/YYYY-MM-DD-[topic].md`
- **Special:** Severity classification + next actions

### Deep Dive Agent
- **What:** Spawned on demand for in-depth analysis
- **Sources:** Project note + People + Wiki + Jira + Slack + Snowflake
- **Output:** Inline analysis with A/B/C recommendations
- **Special:** Reads full context before synthesizing

## Adding Your Own Agent

1. Create `8 [YOUR BRAIN]/Agents/[Name] Agent.md` with the spec
2. Create `.claude/commands/x-[trigger].md` that references it
3. Add to `8 [YOUR BRAIN]/Agents/_Index.md`
