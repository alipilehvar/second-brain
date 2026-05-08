# 11 — Daily Workflow

## Morning (5 min)

```
alfred
```

This runs 12 steps automatically:
1. Reads your About file for context
2. Pulls Gmail last 24h — VIP/Team first ⭐
3. Reads today's calendar — flags back-to-backs
4. Scans Slack — mentions, DMs, key channels
5. Checks Jira sprint — your tickets + team progress
6. Reads Granola transcripts for today's meetings (from `Granola/Transcripts/`)
7. Carries forward unchecked items from yesterday's daily note
8. Gets 3-day weather for your location
9. Checks capacity — flags if 6+ meetings
10. Writes daily note → `6 Reviews/Daily/YYYY-MM-DD.md`
10b. Writes team Jira snapshot → `6 Reviews/Team/YYYY-MM-DD-thdl.md`
10c. Writes Granola daily recap → `Granola/YYYY-MM-DD.md`
11. Updates People pages for anyone interacted with
12. Ends with Leadership OS nudge (protect focus, say NO)

## End of Day (5 min)

```
closeday
```

One command, three phases:

**Phase 1 — Capture (5 questions asked all at once):**
- Top 3 wins today
- Anything unfinished?
- Ideas you had
- Anyone to follow up with?
- Anything front-of-mind for tomorrow?

Saves ideas to the right location, files follow-ups to People pages, appends a `## Day Close` section to today's note, pre-populates tomorrow's daily note so `alfred` has context before it runs.

**Phase 2 — Wikify all Raw/ (automatic, no prompting):**
- Scans `3 Reference/Raw/` for every file with `processed: false`
- Runs the full wikify flow on each: creates or updates the wiki page, appends only new insights, marks the raw file `processed: true`, logs to `Wiki/Log.md`
- Reports a batch summary at the end

**Phase 3 — Lint vault (automatic):**
- Checks orphaned wiki pages, missing cross-refs, contradictions, stale pages (60d+), unprocessed Raw files, Log.md completeness
- Auto-fixes what it can; flags the rest
- Ends with: "Lint clean" or "N issues — X fixed, Y need review"

> You close the day with a clean, up-to-date wiki every single night. No separate wikify or lint needed.

## During the Day

| Situation | Command |
|-----------|---------|
| New email needs triage | `email` |
| Slack piling up | `slack` |
| Sprint check | `jira` |
| Prep for a 1:1 | `1on1 [name]` |
| Someone asks you to take on work | `no [describe the ask]` |
| Drop a doc for later | `clip [Drive URL]` or `note [text]` |
| Need context on a project | `deepdive [project name]` |
| Data anomaly noticed | `anomaly [describe it]` |
| Quick status snapshot | `tldr` |
| Check all tool connections | `mcp` |

## Before a 1:1

```
1on1 [Person Name]
```

Shows: open action items (theirs + yours), recent interactions, Jira tickets, talking points, feedback to give.

## End of Week (Friday)

```
weekly
retro
wbr
```

- `weekly` — pulls all daily notes, team Jira, Slack → weekly summary
- `retro` — Leadership OS 4-layer self-score + NO tracker + one change
- `wbr` — Weekly Business Review → revenue, KPIs, wins, misses

## Monthly

```
mbr
```

Pulls all WBRs from the month, Snowflake data, project progress → Monthly Business Review.

## Quarterly

```
quarterly
```

OKR review, roadmap vs reality, team health, next quarter plan → QBR doc.

## Vault Maintenance

**Lint runs automatically every night inside `closeday`** — no manual run needed.

If you ever want an on-demand health check mid-day:
```
lint
```

## The Three Output Files Per Day

| File | Purpose | Command |
|------|---------|---------|
| `6 Reviews/Daily/YYYY-MM-DD.md` | Full daily digest — email, Slack, Jira, calendar, todos | `alfred` |
| `6 Reviews/Team/YYYY-MM-DD-thdl.md` | Team Jira snapshot — blockers, progress per person | `alfred` (step 10b) |
| `Granola/YYYY-MM-DD.md` | Meeting recap — TLDR + action items from all meetings | `granola` or `alfred` (step 10c) |

## After Any Structural Change

Whenever a new command, folder, or workflow is added:
1. Update `8 ALI'S BRAIN/Command Center.md`
2. Update `8 ALI'S BRAIN/Memory.md`
3. Update the relevant `HOW TO BUILD ME/` doc
4. Update `CLAUDE.md` if it's a new core rule
