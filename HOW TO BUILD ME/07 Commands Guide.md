# 07 — Commands (x- Skills) Guide

Skills are markdown files in `.claude/commands/` that define what happens when you type a command.

## File Location

```
Your Vault/
└── .claude/
    └── commands/
        ├── alfred.md      ← /alfred triggers this
        ├── email.md       ← /email triggers this
        └── ...
```

**Global skills** (available everywhere, not just in vault):
`~/.claude/commands/snowflake.md` → `/snowflake`

**Vault skills** (only when working in vault directory):
`vault/.claude/commands/alfred.md` → `/alfred`

## How to Write a Skill

A skill file is just instructions to Claude. Plain English works fine.

### Minimal skill:
```markdown
Show today's emails needing a response.

Steps:
1. Search Gmail for last 24h with newer_than:1d
2. Filter to actionable threads (exclude automated notifications)
3. Show: from, subject, what they need, urgency (NOW/SOON/FYI)
```

### Full skill with format:
```markdown
Run the weekly business review.

Steps:
1. Read `8 [YOUR BRAIN]/About [You].md` for targets
2. Pull this week's daily notes from `6 Reviews/Daily/`
3. Pull Jira sprint summary
4. Identify: wins, misses, blockers
5. Save to `7 Metrics & KPIs/WBR/YYYY-WNN.md`

Output format:
\```markdown
# WBR — [Week]
## Wins
## Misses
## Blockers
## Next Week
\```
```

## Naming Convention

Commands have no prefix — just type the name:
- `alfred` — daily briefing
- `email` — email triage
- `jira` — sprint status
- `1on1 [name]` — 1:1 prep

The no prefix namespaces vault commands away from global Claude commands (`/help`, `/clear`, etc.)

## Complete Command List (Starter Set)

| Command | File | What It Does |
|---------|------|-------------|
| `alfred` | alfred.md | Full daily briefing (morning) |
| `granola` | granola.md | Granola meeting recap — TLDR + action items (end of day) |
| `closeday` | closeday.md | End-of-day capture (5 questions → auto-wikify all Raw/ → lint vault) |
| `tldr` | tldr.md | 10-line snapshot |
| `tomorrow` | tomorrow.md | Plan tomorrow |
| `email` | email.md | Email triage |
| `slack` | slack.md | Slack digest |
| `jira` | jira.md | Sprint status |
| `mcp` | mcp.md | Check all MCP tool connections |
| `1on1 [name]` | 1on1.md | 1:1 prep |
| `person [name]` | person.md | Show/create person page |
| `weekly` | weekly.md | Weekly review |
| `retro` | retro.md | Self-reflection |
| `wbr` | wbr.md | Weekly Business Review |
| `mbr` | mbr.md | Monthly Business Review |
| `quarterly` | quarterly.md | QBR |
| `anomaly [topic]` | anomaly.md | Log anomaly |
| `new "[name]" [1-5]` | new.md | Create project |
| `archive "[name]"` | archive.md | Archive project |
| `deepdive [name]` | deepdive.md | Deep-dive agent |
| `clip [link]` | clip.md | Add Drive link to Raw |
| `wikify [file]` | wikify.md | Raw → Wiki |
| `note [text]` | note.md | Quick capture |
| `no [context]` | no.md | Help say NO |
| `brand` | brand.md | Brand guidelines check |
| `lint` | lint.md | Vault health check |
| `status` | status.md | Quick counts |
| `commands` | commands.md | Show all commands |
