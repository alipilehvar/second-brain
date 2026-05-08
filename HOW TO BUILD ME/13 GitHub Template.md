# 13 — Publishing as a GitHub Template

## What to Include in the Repo

```
second-brain-x/
├── README.md                        ← HOW TO BUILD ME/README.md (adapted)
├── CLAUDE.md                        ← generic template (no personal info)
├── Home.md                          ← generic template
├── 1 Projects/_Index.md
├── 2 Areas/_Index.md
├── 2 Areas/Role & Strategy/_Index.md
├── 2 Areas/Team/_Index.md
├── 2 Areas/Stakeholders/_Index.md
├── 2 Areas/Hiring/_Index.md
├── 3 Reference/Raw/_Index.md
├── 3 Reference/Raw/Projects/_Index.md
├── 3 Reference/Wiki/_Index.md
├── 3 Reference/Wiki/Leadership OS.md
├── 3 Reference/Wiki/Say No Playbook.md
├── 3 Reference/Looker/_Index.md
├── 4 Archives/_Index.md
├── 5 People/_Index.md
├── 5 People/_Template.md
├── 6 Reviews/Daily/_Index.md
├── 6 Reviews/Team/_Index.md
├── 6 Reviews/Weekly/_Index.md
├── 7 Metrics & KPIs/_Index.md
├── 7 Metrics & KPIs/WBR/_Index.md
├── 7 Metrics & KPIs/MBR/_Index.md
├── 7 Metrics & KPIs/QBR/_Index.md
├── 7 Metrics & KPIs/Anomalies/_Index.md
├── 7 Metrics & KPIs/Metric Definitions/_Index.md
├── 8 [YOUR BRAIN]/Schema.md         ← generic (no personal info)
├── 8 [YOUR BRAIN]/Command Center.md
├── 8 [YOUR BRAIN]/Agents/_Index.md
├── 8 [YOUR BRAIN]/Agents/Daily Digest Agent.md
├── 8 [YOUR BRAIN]/Agents/Anomaly Agent.md
├── 8 [YOUR BRAIN]/Agents/Deep Dive Agent.md
├── .claude/commands/                ← all x- skill files
├── .obsidian/snippets/folder-colors.css
├── HOW TO BUILD ME/                 ← this entire folder
├── .gitignore
└── docs/                            ← screenshots for GitHub page
    ├── home-screenshot.png
    ├── daily-digest-screenshot.png
    └── wiki-screenshot.png
```

## What to EXCLUDE (.gitignore)

```gitignore
# Personal — never commit
8 */About *.md
8 */Memory.md
5 People/VIP/
5 People/Team/
6 Reviews/Daily/
6 Reviews/Team/
6 Reviews/Weekly/
7 Metrics & KPIs/WBR/
7 Metrics & KPIs/MBR/
7 Metrics & KPIs/QBR/
7 Metrics & KPIs/Anomalies/
1 Projects/Priority/
1 Projects/Important/
1 Projects/Idea Dump/
2 Areas/Role & Strategy/
2 Areas/Team/
2 Areas/Stakeholders/
2 Areas/Hiring/
3 Reference/Raw/
4 Archives/
Granola/

# Obsidian internals
.obsidian/workspace*
.obsidian/cache
.makemd/
.space/
.DS_Store
```

## GitHub Page Structure

Suggested sections for the GitHub README:

```markdown
# Second Brain X — AI-Powered Work OS

[1-line pitch]
[screenshot of Home.md]

## What It Does
[3-bullet value prop]

## Quick Start
[5 steps]

## Architecture
[diagram]

## Full Documentation
[link to HOW TO BUILD ME/README.md]

## Philosophy
[PARA + LLM Wiki in 2 paragraphs]

## Credits
[Tiago Forte, Andrej Karpathy, Anthropic]
```

## Making It a GitHub Template

1. Create repo: `github.com/[you]/second-brain-x`
2. Settings → check **"Template repository"**
3. Users can then click **"Use this template"** to clone with their own name

## Obsidian Plugin Possibility

This system could be packaged as an Obsidian plugin that:
1. Creates the folder structure automatically
2. Installs all `x-` skills
3. Prompts for name, role, team, VIPs
4. Generates personalized CLAUDE.md + About Me
5. Guides through MCP connection setup

Plugin entry point: `main.ts` using Obsidian Plugin API
Distribution: Obsidian Community Plugins marketplace
