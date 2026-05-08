# 03 — Folder Structure

## The 8-Folder System

Numbers force correct sort order in Obsidian. Colors distinguish sections visually (see 12 Customize For You for CSS).

```
Your Vault/
│
├── CLAUDE.md                    ← AI operating manual (auto-loaded by Claude Code)
├── Home.md                      ← Your daily dashboard
│
├── 1 Projects/                  🔴 Active work with deadlines
│   ├── Priority/                   score 4-5: do now
│   ├── Important/                  score 2-3: do soon
│   └── Idea Dump/                  score 1: someday/maybe
│
├── 2 Areas/                     🔵 Ongoing responsibilities
│   ├── Role & Strategy/            your OKRs, roadmap, vision
│   ├── Team/                       direct reports, 1:1s, team roadmap
│   ├── Stakeholders/               relationship management strategy
│   └── Hiring/                     open roles, pipeline
│
├── 3 Reference/                 🟢 Knowledge base
│   ├── Raw/                        unprocessed drops (clips, imports)
│   │   └── Projects/               ad-hoc investigation folders
│   ├── Wiki/                       synthesized knowledge (cumulative)
│   └── Looker/                     BI dashboard links
│
├── 4 Archives/                  ⬜ Completed / inactive
│
├── 5 People/                    🟣 One page per contact
│   ├── VIP/                        key stakeholders (surface first)
│   └── Team/                       direct reports (surface second)
│
├── 6 Reviews/                   🟡 Time-based operational cadence
│   ├── Daily/                      daily digest (cumulative)
│   ├── Team/                       team Jira daily snapshot
│   └── Weekly/                     weekly retro + Leadership OS
│
├── 7 Metrics & KPIs/            🟠 Business performance
│   ├── WBR/                        Weekly Business Review
│   ├── MBR/                        Monthly Business Review
│   ├── QBR/                        Quarterly Business Review
│   ├── Anomalies/                  flagged data/system issues
│   └── Metric Definitions/         SSOT metric definitions
│
├── 8 [YOUR NAME]'S BRAIN/       🩵 System config (sorts last)
│   ├── About [You].md              YOUR profile (gitignored)
│   ├── Memory.md                   AI session learnings (gitignored)
│   ├── Schema.md                   frontmatter contracts
│   ├── Command Center.md           all commands reference
│   └── Agents/                     agent definitions
│       ├── Daily Digest Agent.md
│       ├── Anomaly Agent.md
│       └── Deep Dive Agent.md
│
├── HOW TO BUILD ME/             📖 This guide (shareable on GitHub)
│
├── .claude/
│   └── commands/                ← vault-specific x- skills
│
├── .gitignore                   ← exclude personal files
└── Granola/                     ← meeting transcripts (optional)
```

## Naming Convention

| Type | Pattern | Example |
|------|---------|---------|
| Daily | `YYYY-MM-DD.md` | `2026-05-06.md` |
| Weekly | `YYYY-WNN.md` | `2026-W19.md` |
| Quarterly | `YYYY-QN.md` | `2026-Q2.md` |
| Person | `First Last.md` | `Jane Smith.md` |
| Project | Title case | `Revenue Attribution Model.md` |
| Anomaly | `YYYY-MM-DD-topic.md` | `2026-05-06-segment-drop.md` |

## Why "8 [YOUR NAME]'S BRAIN" last?
The `8` prefix ensures it sorts after all PARA folders. Naming it `[YOUR NAME]'S BRAIN` makes it clear this is the system config — not content. It's your vault's control panel.
