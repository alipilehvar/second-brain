# 06 — CLAUDE.md Guide

`CLAUDE.md` is your vault's operating manual. Claude Code reads it automatically at the start of every session from your working directory.

## Two CLAUDE.md Files

| File | Purpose |
|------|---------|
| `CLAUDE.md` (root) | Short summary — loaded first by Claude Code |
| `8 [YOUR BRAIN]/CLAUDE.md` | Removed — root file is sufficient |

## What to Put in CLAUDE.md

### 1. Who you are + what this vault is
```markdown
# [Your Name] Vault — Claude Operating Manual
Work second brain for [Your Name], [Your Role] at [Company].
First read: `8 [YOUR BRAIN]/About [You].md`
```

### 2. Folder structure map
Tell Claude exactly what each folder is for. One line per folder.

### 3. Core behavioral rules
These are the most important — they shape every interaction:
```markdown
## Core Rules
1. Read About [You].md before acting — every session
2. Daily notes are cumulative — carry forward unchecked, never repeat resolved
3. People pages = single source of truth — update after every interaction
4. VIP list: [Name] + [Name] — always surface their messages first ⭐
5. Raw → Wiki only on request — wiki pages accumulate, never overwrite
6. All commands use x- prefix
7. [Your coaching note — e.g. "Coach [name] to delegate more"]
```

### 4. Key project/data references
```markdown
## Key References
- Jira board: [URL]
- Revenue target: $X → $Y
- Snowflake account: [ID]
```

## Tips

- **Keep it under 50 lines** — Claude reads this every session. Dense = slow.
- **Rules over descriptions** — "Do X" beats "X is used for Y"
- **Name your VIPs explicitly** — don't make Claude infer priority
- **Reference the About file** — don't put personal details in CLAUDE.md (it's shareable)
