# HOW KNOW — Professional Second Brain

*PARA + LLM Wiki + Live MCP data. A work OS that gets smarter every day you use it.*

**Author:** Ali Pilehvar
**Contact:** [LinkedIn](https://www.linkedin.com/in/alipilehvar/) · [Medium](https://alipilevar.medium.com/)

> Paste the bootstrap prompt at the bottom into Claude Code, answer 10 questions, done. Under 1 hour. Zero coding.

---

## The Idea

[Andrej Karpathy's LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f): instead of asking an LLM to answer from raw documents (RAG), have it *build and maintain a wiki* from those documents. The wiki compounds. Every source you add makes every related page richer. Ask a question once, file the answer back. Six months in, your domain knowledge is already in the wiki.

[Tiago Forte's PARA](https://fortelabs.com/blog/para/): all information lives in one of four buckets — **P**rojects (active work), **A**reas (ongoing responsibilities), **R**eference (knowledge), **A**rchive (done). Everything has one right place. No filing paralysis.

**HOW KNOW adds what neither covers:** live MCP connections to your actual tools — Gmail, Slack, Jira, Calendar, Google Drive, your data warehouse. Your second brain knows what's in your inbox right now, not just what you've written down.

> **PARA gives it structure. LLM Wiki gives it memory. MCP gives it live data. Together: a second brain that works.**

---

## Architecture

```
Raw Sources          LLM Wiki Layer         PARA Structure
────────────         ──────────────         ──────────────
Gmail          ─┐
Google Calendar─┤   Synthesized wiki        1 Projects
Slack          ─┤   pages — cumulative,     2 Areas
Jira / Linear  ─┤   never overwritten   ←→  3 Reference / Raw / Wiki
Google Drive   ─┤                           4 Archives
Granola        ─┤   People CRM              5 People (VIP + Team)
Snowflake      ─┘   (every contact)         6 Reviews (daily/weekly)
                                            7 Metrics / KPIs
       ↑                                    8 [YOUR BRAIN]
  Claude Code ← CLAUDE.md (operating manual, auto-loaded)
```

---

## Folder Structure

```
My Second Brain/
├── CLAUDE.md                     ← operating manual (auto-loaded every session)
├── Home.md                       ← Dataview dashboard
├── 1 Projects/          🔴       ← active work with deadlines
│   ├── Priority/                    score 4-5
│   ├── Important/                   score 2-3
│   └── Idea Dump/                   score 1
├── 2 Areas/             🔵       ← ongoing responsibilities
├── 3 Reference/         🟢       ← knowledge base
│   ├── Raw/                         unprocessed drops
│   └── Wiki/                        LLM-built pages (+ Log.md)
├── 4 Archives/          ⬜
├── 5 People/            🟣       ← one page per contact
│   ├── VIP/                         surface first ⭐ in every digest
│   └── Team/                        surface second ⭐
├── 6 Reviews/           🟡       ← cadence
│   ├── Daily/
│   ├── Team/
│   └── Weekly/
├── 7 Metrics & KPIs/    🟠       ← WBR / MBR / QBR / Anomalies
├── 8 [YOUR NAME]'S BRAIN/ 🩵    ← system config (gitignored personal files)
├── Granola/                      ← raw transcripts (never modify)
└── .claude/commands/             ← 25+ named commands
```

---

## Setup — 6 Steps

### 1. Install Obsidian
Download at [obsidian.md](https://obsidian.md) → open your vault folder → Settings → Community Plugins → install **Dataview**, **Templater**, **Calendar**

### 2. Install Claude Code
```bash
brew install node        # or nodejs.org
npm install -g @anthropic-ai/claude-code
cd ~/Desktop/My\ Second\ Brain && claude
```

### 3. Connect MCP Integrations
**claude.ai → Settings → Integrations** — OAuth only, no API keys:

| Integration | Powers |
|-------------|--------|
| Gmail | Email triage, draft replies, action item detection |
| Google Calendar | Meeting prep, capacity alerts |
| Google Drive | Fetch live docs into wiki (always latest version) |
| Slack | DM/mention triage, channel reading, thread summaries |
| Jira / Linear | Sprint board, ticket status, blocker detection |
| Granola | Meeting transcripts → daily action items |

### 4. Install Granola (meeting notes)
[granola.ai](https://granola.ai) → install → connect your **work** email → grant mic access → auto-detects calendar meetings

### 5. Install Obsidian Web Clipper (Chrome)
Chrome Web Store → "Obsidian Web Clipper" → set default folder: `3 Reference/Raw/`
Template:
```
---
title: "{{title}}"
source: "{{url}}"
created: {{date}}
processed: false
---
{{content}}
```
Click the icon on any webpage → runs `wikify [filename]` in Claude Code → becomes a wiki page.

### 6. Optional: Snowflake
```bash
pip3 install snowflake-connector-python
```
Powers `wbr`, `anomaly`, `deepdive` — all query Snowflake directly. First connection = browser SSO; token cached after.

---

## CLAUDE.md Template

```markdown
# [Your Name] Vault — Claude Operating Manual

Work second brain for [Full Name], [Role] at [Company].
First read: `8 [NAME]'S BRAIN/About [You].md`

## Structure
| Folder | Purpose |
|--------|---------|
| 3 Reference/Raw/ | Unprocessed drops |
| 3 Reference/Wiki/ | Synthesized knowledge — cumulative, never overwritten |
| 5 People/VIP/ | [VIP names] — surface FIRST ⭐ |
| 5 People/Team/ | [Team names] — surface SECOND ⭐ |

## Core Rules
1. Read About [You].md before acting — every session
2. Daily notes are cumulative — carry forward unchecked items only
3. People pages = single source of truth — update after every interaction
4. VIP list: [Name] ([email]) — surface FIRST ⭐
5. Raw → Wiki only on request via `wikify` — wiki pages accumulate, never overwrite
6. Jira board: [URL]
```

---

## Key Operations

| Command | What It Does |
|---------|-------------|
| `alfred` | Morning briefing: Gmail + Calendar + Slack + Jira + Granola + carry-forwards → one daily note |
| `wikify [file]` | Synthesize raw file → wiki page (cumulative — appends, never overwrites) |
| `closeday` | EOD capture (5 questions) → auto-wikifies all unprocessed Raw/ → lints vault |
| `lint` | Vault health check: orphans, contradictions, stale pages |
| `1on1 [name]` | Pre-meeting brief: open items, last notes, recent Slack/email |
| `email` | Triage unread email — VIPs first |
| `slack` | Triage DMs and @mentions — VIPs first |
| `jira` | Sprint board: tickets + team progress + blockers |
| `wbr` | Weekly Business Review — Snowflake → synthesize → save |
| `anomaly [metric]` | Investigate metric drop, classify P1/P2/P3, save investigation |
| `deepdive [topic]` | Multi-source research → A/B/C recommendations |
| `weekly` | Synthesize daily notes → weekly review |
| `retro` | Leadership OS self-score + NOs said + one change for next week |
| `no [request]` | Help decline using Say No Playbook |
| `exec-brief [topic]` | 1-page executive brief: headline, 3 bullets, recommendation |
| `clip [URL]` | Save Drive/web link to Raw/ (stays live, fetches latest on wikify) |
| `note [text]` | Quick capture → Raw/ |
| `new [name] [1-5]` | Create project with priority score |
| `archive [name]` | Move project to Archives/ with closure summary |
| `person [name]` | Create or update People page |
| `graph` | Interactive relationship graph: influence scores, personality, watch-outs — opens in browser |
| `status [project]` | One-paragraph update ready to share with leadership |
| `mbr` | Monthly Business Review |
| `quarterly` | QBR + OKR review |
| `tldr` | 10-line vault snapshot |
| `commands` | Print full command reference |

---

## Daily Workflow

```
Morning (5 min):    alfred
During the day:     1on1 · email · slack · jira · clip · note · anomaly
End of day (5 min): closeday  ← wikifies all Raw/ + lints vault automatically
Friday:             weekly → retro → wbr
On-demand only:     lint  (runs nightly in closeday — manual only if needed mid-day)
```

---

## The Compound Effect

```
Day 1:    wikify one doc → 1 wiki page
Week 1:   5 alfreds → carry-forward loop runs itself
Month 1:  4 WBRs → anomaly baseline forming
Month 3:  15+ wiki pages cross-referencing → knowledge graph
Month 6:  ask any domain question → answer is already in the wiki
Year 1:   new team member → onboard from wiki → 2 weeks instead of 6 months
```

---

## Bootstrap Prompt — Paste Into Claude Code

```
Build me an AI-powered second brain using the HOW KNOW pattern (PARA + LLM Wiki + MCP).

Before you build anything, ask me these questions one at a time:
1. Full name?
2. Job title / role?
3. Company name?
4. Work email?
5. City? (for weather in daily digest)
6. VIP stakeholders — name + email, comma-separated (surface first in every digest)
7. Direct reports / team — name + email, comma-separated (or NONE)
8. Project management tool: Jira / Linear / Asana / None — if Jira, board URL?
9. Main business metric / revenue target this year? (or SKIP)
10. Publish to GitHub when done? yes / no — if yes, repo name?

Once you have all answers, build the complete vault:
- Full PARA folder structure (1 Projects → 4 Archives + 5 People + 6 Reviews + 7 Metrics + 8 BRAIN)
- CLAUDE.md (personalized with name, role, VIPs, team, Jira board)
- About [Name].md (private profile, gitignored)
- Schema.md with frontmatter contracts for every file type
- Command Center.md with all 25+ commands
- Home.md with Dataview dashboard
- _Index.md in every folder
- People pages for each VIP and direct report
- Agent specs: Daily Digest, Anomaly, Deep Dive
- Wiki starter pages: Leadership OS, Say No Playbook
- All 25+ commands in .claude/commands/: alfred, wikify, lint, closeday, 1on1, anomaly,
  archive, clip, commands, deepdive, email, exec-brief, jira, mbr, new, no, note, person,
  quarterly, retro, slack, status, tldr, wbr, weekly
- .gitignore (exclude all personal files — About, Memory, People/VIP, People/Team, Reviews, Metrics, Projects, Areas, Archives, Raw, Granola)
- CSS snippet for folder colors → .obsidian/snippets/folder-colors.css

Print a build report: folders created, files created, commands installed, personalized with, what still needs manual setup.
Then give me the 3 next steps to get the first alfred running.
```

---

## After the Build — 3 Steps to First alfred

1. **Connect integrations** — claude.ai → Settings → Integrations → add Gmail, Calendar, Drive, Slack, Jira/Linear, Granola (5 min, OAuth only)
2. **Open in Obsidian** — File → Open Vault → select folder → install Dataview + Templater + Calendar → enable folder-colors CSS snippet
3. **Run alfred** — in Claude Code terminal: type `alfred` → daily note populates with your calendar, email, Slack, Jira — all in one place

---

*Inspired by: Andrej Karpathy's [LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) · Tiago Forte's [PARA Method](https://fortelabs.com/blog/para/) · Anthropic's [Model Context Protocol](https://modelcontextprotocol.io)*
