---
color: "linear-gradient(90deg, #f11e1e 0%, #ffffff 100%)"
---
# HOW KNOW — Professional Second Brain

*A pattern for building a living, AI-maintained work OS for knowledge workers and leaders*

**Author:** Ali Pilehvar
**Contact:** [LinkedIn](https://www.linkedin.com/in/alipilehvar/) · [Medium](https://alipilevar.medium.com/)

> **Setup time: under 1 hour.** Paste the bootstrap prompt at the bottom into Claude Code, answer 10 questions, and your full second brain is built automatically.

---

> **This is not just PARA.** Tiago Forte's PARA gives you organizational structure. Andrej Karpathy's LLM Wiki gives you compounding knowledge from any document source — including the web. HOW KNOW layers both together and adds what neither covers: live MCP connections to your actual work tools (email, Slack, Jira, calendar, data warehouse), a People CRM that accumulates every relationship interaction, an operational cadence that runs itself every morning, and a business metrics layer connected directly to your data. The result is a second brain that reflects the current state of your work — not just a well-organized folder of notes.

---

This is an idea file. It is designed to be copy-pasted to your own LLM agent (Claude Code, Cursor, or any agent with file-system access). Its goal is to communicate the high-level pattern so your agent can build the specifics in collaboration with you.

---

## The Problem

Modern knowledge workers drown in fragmented tools:
- **Email** — action items buried in threads
- **Slack** — decisions lost in channels after a week
- **Jira / Linear** — ticket context disconnected from strategy
- **Notion / Confluence** — docs written once, go stale immediately
- **Calendar** — no link between meetings and outcomes
- **Notes** — siloed, never retrieved when you need them

The result: you spend mental energy remembering *where things are* instead of thinking about what matters. Nothing compounds. Every question gets re-derived from scratch.

---

## The Core Idea

The pattern comes from two places.

**Andrej Karpathy's LLM Wiki** — instead of asking an LLM to retrieve and answer from raw documents (RAG), you have it *build and maintain a wiki* from those documents. The wiki is a persistent, compounding artifact. Ask a question once, file the answer back. Add a new document, integrate it across every related page. The knowledge base gets richer with every source you add — because knowledge accumulates instead of being re-derived each time.

**Tiago Forte's PARA method** — all knowledge either supports an active **P**roject, sustains an **A**rea of responsibility, lives in **R**eference, or belongs in **A**rchive. That four-bucket discipline forces every piece of information to earn its place. No duplicates. No filing paralysis.

This pattern combines both — and adds a third layer that neither covers: **live data**. Your second brain shouldn't just know things you've written down. It should know what's in your email right now, what's on your calendar tomorrow, what your team's sprint board looks like, what revenue looked like last week. That requires connecting the brain to live systems — email, calendar, Slack, Jira, your data warehouse — via MCP (Model Context Protocol) servers.

The result: a **work OS**. A second brain that maintains itself, surfaces the right context before every meeting, carries action items forward automatically, and gets smarter every day you use it.

---

## Why It Works

The tedious part of maintaining a knowledge base isn't the reading or the thinking. It's the bookkeeping: updating cross-references, surfacing old decisions when they become relevant again, noting when new data contradicts old claims, keeping summaries current across dozens of files. Humans abandon wikis because the maintenance burden grows faster than the value. LLMs don't get bored, don't forget to update a cross-reference, and can touch 15 files in one pass. The wiki stays maintained because the cost of maintenance is near zero.

The daily briefing solves a different problem. Most people start their day scattered — emails in one place, calendar in another, Slack in a third, Jira in a fourth. `alfred` pulls all of it together, prioritizes it (your VIPs and direct reports always first), and writes a single daily note telling you exactly what needs to happen. One file. The day is organized.

The people system solves relationship memory. Every person you interact with has a page. Every commitment, every 1:1 note, every piece of context about what they care about and how they work — accumulated over time. Before any important conversation, run a prep brief and walk in knowing everything.

---

## Architecture

Four layers:

```
Raw Sources   →   Wiki Layer          →   PARA Structure
(your inbox)      (LLM-built graph)       (org skeleton)
                                           ↕
                  Schema (CLAUDE.md)  ←→  About Me (private)
                                           ↕
                  Live MCP Layer      —   email · calendar · Slack · Jira · data
```

**Raw Sources** — your drop zone. Documents, web clips, Drive links, meeting transcripts, screenshots. Immutable — the LLM reads from them but never modifies them. This is your inbox.

**Wiki** — the LLM-built knowledge graph. Synthesized pages on every domain topic: your company's architecture, your org's KPIs, your product's funnel, your industry's landscape. The LLM owns this layer entirely — it creates pages, updates them when new sources arrive, maintains cross-references, flags contradictions. You read it; the LLM writes it. Every page accumulates in a `## Changelog` — never overwritten.

**PARA Structure** — the organizational skeleton. Projects (active work with deadlines), Areas (ongoing responsibilities), Reference (Raw + Wiki), Archives (completed work), plus People (relationship CRM) and Reviews (daily, weekly, monthly cadence). Everything has one right place.

**Schema** — the operating manual. A `CLAUDE.md` file at the vault root tells the LLM how the system works, what the conventions are, who your VIPs are, and what to prioritize. This makes the LLM a disciplined operating partner rather than a generic assistant. You and the LLM evolve it over time.

---

## Design Principles

1. **Two readers** — every note is written for humans (you in Obsidian) and AI (Claude Code). Consistent frontmatter serves both.
2. **Cumulative, not overwriting** — knowledge compounds. Never delete, only append and refine.
3. **Single source of truth** — one People page per person, one Project page per project. No duplicates.
4. **Separation of concerns** — personal config (About Me, Memory) is gitignored. Generic structure is shareable.
5. **Commands, not conversations** — `alfred` runs 12 steps in one command. You shouldn't need to explain what you want every morning.
6. **VIP-first always** — your boss and key stakeholders surface first in every digest, every triage, every briefing. Wired into CLAUDE.md.

---

## What You Need — Full Setup Guide

Everything below is free or included with existing work tools. No servers. No API keys. No coding required beyond a one-line install.

---

### Step 1 — Install Obsidian

**Obsidian** is the app you use to read and browse your vault. Your vault is just a folder of markdown files on your computer — Obsidian is the interface.

1. Download from **obsidian.md** (free, Mac / Windows / Linux)
2. Install and open it
3. Click **"Open folder as vault"** → select your vault folder (or create an empty one)
4. Go to **Settings → Community Plugins → Turn on community plugins**
5. Click **Browse** and install:
   - **Dataview** — powers dashboard queries in Home.md
   - **Templater** — advanced templates for People and Project notes
   - **Calendar** — visual navigation for daily notes
6. Go to **Settings → Appearance → CSS Snippets** → toggle on `folder-colors` after the vault is built

Obsidian stays open as you work — it's your reading interface. Claude Code does all the writing.

---

### Step 2 — Install Claude Code

**Claude Code** is the AI agent that reads and writes your vault. It runs in your terminal alongside Obsidian.

1. Install **Node.js** first (Mac: `brew install node` · or nodejs.org)
2. Install Claude Code:
   ```bash
   npm install -g @anthropic-ai/claude-code
   ```
3. Create an account at **claude.ai** (Pro recommended for heavy use)
4. Open Claude Code inside your vault folder:
   ```bash
   cd ~/Desktop/My\ Second\ Brain
   claude
   ```
5. On first run it opens a browser to authenticate — follow the prompt

> **Tip:** Keep Obsidian open on one side of your screen and the Claude Code terminal on the other. Claude writes; you read in real time.

---

### Step 3 — Connect MCP Integrations

MCP (Model Context Protocol) connections give Claude Code live access to your work data. Set them up once; they persist forever.

**Go to: claude.ai → Settings → Integrations**

Click **Add** next to each and follow the OAuth flow — sign in with your work account. No API keys needed.

| Integration | What to click | What it powers |
|-------------|--------------|----------------|
| **Gmail** | Add Google → sign in with work account | Email triage, draft replies, action item detection |
| **Google Calendar** | Same Google connection | Meeting prep, capacity alerts, tomorrow planning |
| **Google Drive** | Same Google connection | Fetch live docs into wiki (always latest version) |
| **Slack** | Add Slack → sign in with your workspace | DM/mention triage, channel reading, thread summaries |
| **Jira** (Atlassian) | Add Atlassian → sign in | Sprint board, ticket status, blocker detection |
| **Linear** (if you use it) | Add Linear → sign in | Same as Jira |
| **Granola** | Add Granola → sign in with work email | Meeting transcripts → daily action items |

> **Slack:** The Slack MCP reads your DMs and @mentions — it does NOT send messages without your approval.
> **Jira:** Have your board URL ready: `https://yourcompany.atlassian.net/jira/software/projects/TEAM/boards`

After connecting, Claude Code has access immediately — no restart needed. Each MCP enables specific capabilities:

**Gmail capabilities:** read threads, search by sender/date/keyword, create drafts, label threads
**Google Drive capabilities:** read any doc/sheet/slide you have access to, fetch latest version of a linked file — `clip [Drive URL]` uses this; no download needed
**Slack capabilities:** read channels and DMs, search across workspace, send messages/drafts, look up user profiles
**Jira capabilities:** read sprint boards, search by JQL, read Confluence pages, add comments

---

### Step 4 — Install Granola (Meeting Notes)

**Granola** is an AI meeting note-taker that runs silently during calls and produces structured transcripts. These feed your daily digest automatically.

1. Download from **granola.ai** (Mac; Windows coming soon)
2. Install and open it
3. **Preferences → Account → Add work email** — use your company email, not personal Gmail
4. Grant microphone access when prompted
5. Granola auto-detects meetings from your Google Calendar and starts recording when you join calls
6. After each meeting, transcripts appear in the app — Claude Code reads these via the MCP connection from Step 3

> **Important:** Connect Granola to your **work** email, not personal — or meeting transcripts won't match your calendar.

---

### Step 5 — Install Chrome Web Clipper (for Raw/)

The **Obsidian Web Clipper** lets you clip any webpage — article, LinkedIn post, doc, competitor page — directly into `3 Reference/Raw/` with one click. This is how web content becomes raw material for your wiki.

1. Open **Chrome** (or Arc, Brave, Edge — any Chromium browser)
2. Search **"Obsidian Web Clipper"** in the Chrome Web Store (by Obsidian) → **Add to Chrome**
3. Click the extension icon → **Settings** → set your vault path
4. Set default save folder: `3 Reference/Raw/`
5. Set the template:
   ```
   ---
   title: "{{title}}"
   source: "{{url}}"
   created: {{date}}
   processed: false
   ---
   {{content}}
   ```

**How to use:** On any webpage, click the Obsidian clip icon → converts page to clean markdown → saves to `Raw/`. Then run `wikify [filename]` in Claude Code to integrate it into your wiki.

> **Image tip:** In Obsidian Settings → Files and Links → set attachment folder to `3 Reference/Raw/assets/` → bind "Download attachments" to Ctrl+Shift+D. Clip an article, hit the shortcut, all images save locally.

---

### Step 6 — Optional: Snowflake

Skip if your team doesn't use Snowflake. If you do:

```bash
pip3 install snowflake-connector-python
```

Create `~/.snowflake/connections.toml`:
```toml
[default]
account = "YOUR-ACCOUNT-ID"
user = "YOUR.EMAIL@COMPANY.COM"
authenticator = "externalbrowser"
role = "YOUR_ROLE"
warehouse = "YOUR_WAREHOUSE"
```

This powers `wbr`, `anomaly`, and `deepdive` — all of which query Snowflake directly. First connection opens a browser SSO window; token is cached after that.

---

## The Folder Structure

```
My Second Brain/
│
├── CLAUDE.md                     ← AI operating manual (auto-loaded every session)
├── Home.md                       ← Dashboard (Dataview queries)
│
├── 1 Projects/          🔴       ← Active work with deadlines
│   ├── Priority/                    score 4-5: do now
│   ├── Important/                   score 2-3: do soon
│   └── Idea Dump/                   score 1: someday/maybe
│
├── 2 Areas/             🔵       ← Ongoing responsibilities
│   ├── Role & Strategy/             your OKRs, roadmap, vision
│   ├── Team/                        direct reports, team roadmap
│   ├── Stakeholders/                relationship management
│   └── Hiring/                      open roles, pipeline
│
├── 3 Reference/         🟢       ← Knowledge base
│   ├── Raw/                         unprocessed drops (clips, imports)
│   │   └── Projects/                ad-hoc investigation folders
│   └── Wiki/                        LLM-built knowledge graph
│       ├── _Index.md                catalog of all wiki pages
│       └── Log.md                   append-only operation log
│
├── 4 Archives/          ⬜       ← Completed / inactive
│
├── 5 People/            🟣       ← One page per contact
│   ├── VIP/                         key stakeholders (surface FIRST ⭐)
│   └── Team/                        direct reports (surface SECOND ⭐)
│
├── 6 Reviews/           🟡       ← Time-based operational cadence
│   ├── Daily/                       daily digest (cumulative carry-forwards)
│   ├── Team/                        team sprint daily snapshot
│   └── Weekly/                      weekly retro + Leadership OS
│
├── 7 Metrics & KPIs/    🟠       ← Business performance
│   ├── WBR/                         Weekly Business Review
│   ├── MBR/                         Monthly Business Review
│   ├── QBR/                         Quarterly Business Review
│   ├── Anomalies/                   flagged data/system issues
│   └── Metric Definitions/          SSOT for every KPI
│
├── 8 [YOUR NAME]'S BRAIN/ 🩵    ← System config (sorts last)
│   ├── About [You].md               YOUR private profile (gitignored)
│   ├── Memory.md                    AI session learnings (gitignored)
│   ├── Schema.md                    frontmatter contracts
│   ├── Command Center.md            all commands reference
│   └── Agents/
│       ├── Daily Digest Agent.md
│       ├── Anomaly Agent.md
│       └── Deep Dive Agent.md
│
├── Granola/                      ← raw meeting transcripts (never modify)
├── HOW TO BUILD ME/              ← this documentation (shareable on GitHub)
│
└── .claude/commands/             ← all named commands (25+)
    ├── alfred.md
    ├── wikify.md
    ├── lint.md
    ├── closeday.md
    └── ...
```

### Naming Conventions

| Type | Pattern | Example |
|------|---------|---------|
| Daily | `YYYY-MM-DD.md` | `2026-05-06.md` |
| Weekly | `YYYY-WNN.md` | `2026-W19.md` |
| Quarterly | `YYYY-QN.md` | `2026-Q2.md` |
| Person | `First Last.md` | `Jane Smith.md` |
| Project | Title case | `Revenue Attribution Model.md` |
| Anomaly | `YYYY-MM-DD-topic.md` | `2026-05-06-segment-drop.md` |

### Folder Color Reference

| Folder | Color | Hex |
|--------|-------|-----|
| 1 Projects | Red — action/urgency | `#ff6b6b` |
| 2 Areas | Blue — responsibility | `#4dabf7` |
| 3 Reference | Green — knowledge | `#69db7c` |
| 4 Archives | Gray — inactive | `#868e96` |
| 5 People | Purple — relationships | `#cc5de8` |
| 6 Reviews | Yellow — time/cadence | `#ffd43b` |
| 7 Metrics | Orange — data/performance | `#ff922b` |
| 8 Brain | Teal — system/intelligence | `#20c997` |

---

## Schema — Frontmatter Contracts

Every note has YAML frontmatter. This lets Claude query your vault like a database and lets Dataview render live dashboards.

```yaml
# Project
type: project · title · priority (1-5) · energy (high/low) · status (active/paused/done) · due · area · tags

# Person
type: person · name · role · org · team (vip/team/peer) · stakeholder · stakeholder_priority (1-5) · last_contact · tags

# Wiki page
type: wiki · title · topic · related (array of [[links]]) · last_updated · sources (array) · tags

# Raw (inbox)
type: raw · source (url) · drive_link · fetched · processed (false→true after wikify)

# Daily review
type: daily · date · sources (array) · open_items · new_items

# Weekly review
type: weekly · week · dates · no_count (NOs said) · leadership_score (/20)

# Anomaly
type: anomaly · date · source · severity (low/medium/high) · status (open/investigating/resolved)
```

**Dataview query examples** (paste these in any .md file in Obsidian):

```dataview
# Active projects sorted by priority
table priority as "Score", due as "Due"
from "1 Projects"
where type = "project" and status = "active"
sort priority desc
```

```dataview
# People not contacted in 14+ days
table role as "Role", last_contact as "Last Contact"
from "5 People"
where type = "person" and last_contact < date(today) - dur(14 days)
sort last_contact asc
```

---

## CLAUDE.md — The Operating Manual

`CLAUDE.md` lives at the vault root. Claude Code reads it automatically at the start of every session. Keep it under 50 lines — dense is slow.

```markdown
# [Your Name] Vault — Claude Operating Manual

Work second brain for [Full Name], [Role] at [Company].
First read: `8 [NAME]'S BRAIN/About [You].md`

## Structure
| Folder | Purpose |
|--------|---------|
| 1 Projects/ | Active work, scored 1-5 |
| 2 Areas/ | Ongoing responsibilities |
| 3 Reference/Raw/ | Unprocessed drops |
| 3 Reference/Wiki/ | Synthesized knowledge (cumulative) |
| 5 People/VIP/ | [VIP names] — surface FIRST ⭐ |
| 5 People/Team/ | [Team names] — surface SECOND ⭐ |
| 6 Reviews/Daily/ | Cumulative daily digest |
| 7 Metrics & KPIs/ | WBR, MBR, QBR, Anomalies |

## Core Rules
1. Read About [You].md before acting — every session
2. Daily notes are cumulative — carry forward unchecked items only
3. People pages = single source of truth — update after every interaction
4. VIP list: [Name] ([email]), [Name] ([email]) — surface FIRST ⭐
5. Raw → Wiki only on request via wikify — wiki pages accumulate, never overwrite
6. [Optional: add personal coaching notes — e.g. "Coach [Name] to delegate more", "Flag over-commitment"]
7. [Optional: add communication preferences — e.g. "Flag hedging language in leadership drafts"]
8. Jira board: [URL]
```

---

## Operations

### `alfred` — Morning Briefing

Run every morning. All 6 sources checked every run, no exceptions:

1. Read About file for context
2. Pull Gmail last 24h — VIP/Team first ⭐
3. Read today's calendar — flag back-to-backs and 6+ meeting days
4. Scan Slack — DMs, @mentions, key channels. VIP/Team first
5. Check Confluence — pages created/updated last 24h, flag anything needing action
6. Check Google Drive — files shared or modified by teammates last 24h
7. Check Jira/Linear sprint — your tickets + team progress per person + new stakeholder requests
8. Read Granola transcripts — yesterday's meeting action items
9. Carry forward unchecked items from yesterday's daily note
10. Fetch 3-day weather for your city
11. Capacity alert if 6+ meetings
12. Write daily note → `6 Reviews/Daily/YYYY-MM-DD.md`
12b. Write team sprint snapshot → `6 Reviews/Team/YYYY-MM-DD.md`
13. Update People pages for anyone you interacted with
14. End with a Leadership OS coaching nudge

Output: one structured daily note with Top 3, VIP table, full to-do, calendar with prep notes, email triage, Slack highlights, Confluence updates, Drive updates, sprint snapshot, weather, and coaching nudge.

---

### `wikify` — Ingest Raw Material

Drop a file into `3 Reference/Raw/` and run `wikify [filename]`.

```
You drop:              Claude creates:              Result:
─────────────          ───────────────              ───────
Drive link   ─clip→   Raw note (linked)  ─wikify→  Wiki page
Web clip     ─drop→   Raw file           ─wikify→  (cumulative)
Meeting note ─drop→   Raw folder         ─wikify→
PDF / DOCX   ─drop→   Raw folder         ─wikify→
```

**The cumulative rule:** when you run `wikify` on a topic that already has a wiki page:
1. Claude reads the existing page fully
2. Identifies what's NEW in the source material
3. **Appends** only new insights — never overwrites existing knowledge
4. Logs the addition in `## Changelog` at the bottom

This is what makes the wiki compound. Six months of ingests are all visible in one place.

**Drive links stay live:** when you use `clip [Drive URL]`, Claude saves the link — not the content. Each time you wikify that note, Claude fetches the **latest version** from Drive. Your wiki page always reflects the current state of the source doc.

**HTML support:** Confluence exports, web clips, Looker reports — Claude reads HTML, extracts meaningful content, strips navigation noise, preserves formatted tables. Obsidian renders inline HTML natively.

---

### `lint` — Vault Health Check

Run weekly. Checks:
- Orphaned wiki pages (no inbound links and not referenced by any related: field)
- Missing cross-references between pages covering overlapping topics
- Contradictions (revenue figures, team assignments, North Star metrics, email addresses)
- Wiki pages with time-sensitive data not updated in 60+ days
- Raw files sitting unprocessed for 7+ days
- `Log.md` completeness — every wikify operation should have an entry

Lint reports all issues and fixes what it can automatically. Issues requiring human judgment are flagged clearly.

---

### `closeday` — End of Day Capture

Run before you close your computer. Asks five questions all at once:

1. Top 3 things you got done today (wins to carry forward)
2. Anything still on your mind / unfinished?
3. Ideas you had — product, team, process, anything
4. Anyone you need to follow up with?
5. Anything you want front-of-mind tomorrow?

Then: saves ideas to the right location, files follow-ups to People pages, appends a Day Close section to today's note, pre-populates tomorrow's daily note so `alfred` has context before it runs.

---

### Other Key Commands

| Command | What It Does |
|---------|-------------|
| `1on1 [name]` | Pre-meeting brief: open action items, last 1:1 notes, recent Slack/email, feedback to give |
| `email` | Triage unread email — VIPs first, draft responses, flag hedging language |
| `slack` | Triage Slack DMs and @mentions — VIPs first |
| `jira` | Sprint board: your tickets + team progress + blockers |
| `wbr` | Weekly Business Review — Snowflake metrics → synthesize → save to WBR/ |
| `mbr` | Monthly Business Review — pull all WBRs + Snowflake → MBR/ |
| `quarterly` | QBR — OKR review, roadmap vs reality, team health, next quarter plan |
| `anomaly [metric]` | Investigate a metric drop, classify P1/P2/P3, save investigation file |
| `deepdive [topic]` | Multi-source research → A/B/C recommendation with confidence level |
| `weekly` | Synthesize all daily notes into weekly review → `6 Reviews/Weekly/` |
| `retro` | Leadership OS 4-layer self-score + NO count + one specific change for next week |
| `no [request]` | Help decline using Say No Playbook — classify, suggest script, draft the message |
| `status [project]` | One-paragraph project update, ready to share with leadership |
| `exec-brief [topic]` | 1-page executive brief: headline, 3 bullets, so-what, recommendation |
| `clip [URL]` | Save a Drive/web link to Raw/ (link stays live, fetches latest on wikify) |
| `note [text]` | Quick capture → Raw/ with processed: false |
| `new [name] [1-5]` | Create a new project with priority score |
| `archive [name]` | Move project to Archives/ with closure summary |
| `person [name]` | Create or update a People page |
| `graph` | Regenerate `5 People/Relationship Graph.html` — interactive vis.js network. Node size = their impact on you, indigo arrows = your influence on them, slate arrows = their influence on you, gold dashed = org hierarchy. Hover for personality + watch-out. Opens in browser automatically. |
| `tldr` | 10-line snapshot of current vault state |
| `lint` | Full vault health check |
| `commands` | Print the full command reference |

---

## Agents

Commands handle quick, interactive tasks. Agents are for multi-step, autonomous work.

| | Command | Agent |
|--|---------|-------|
| **Triggered by** | You typing a name | A command that spawns it |
| **Scope** | Interactive, one task | Autonomous, multi-step |
| **Use for** | Digests, lookups | Deep research, synthesis |

Agent specs live in `8 [YOUR BRAIN]/Agents/`:

**Daily Digest Agent** — triggered by `alfred`. Sources: Gmail + Calendar + Slack + Jira + Granola + yesterday's note. Output: `6 Reviews/Daily/YYYY-MM-DD.md` + team snapshot. Special: VIP/Team surfaced first ⭐.

**Anomaly Agent** — triggered by `anomaly`. Sources: Snowflake, Jira, Slack, email. Output: `7 Metrics & KPIs/Anomalies/YYYY-MM-DD-[topic].md`. Includes severity (P1/P2/P3) + next actions.

**Deep Dive Agent** — triggered by `deepdive`. Sources: project note + People + Wiki + Jira + Slack + Snowflake. Output: A/B/C recommendations with confidence levels and supporting data.

---

## The People System

Every person you interact with gets a page in `5 People/`. VIPs surface first in every digest; direct reports surface second. Each page accumulates:

```markdown
---
type: person
name: [Full Name]
role: [Job Title]
org: [company]
team: vip          # vip | team | peer
stakeholder_priority: 5
last_contact: YYYY-MM-DD
---
# [Full Name]

**Email:** · **Slack:** @handle

## About
[1-2 lines: what they own, working style]

## 1:1 Notes
### YYYY-MM-DD
- Topics:
- Action items (theirs): [ ]
- Action items (mine): [ ]
- Feedback given:

## Open Action Items
- [ ] YYYY-MM-DD: [what]

## Interactions
- YYYY-MM-DD — [what happened, source: email/slack/meeting]

## Development (direct reports only)
- Strengths: · Growth areas: · Career trajectory:
```

Before any important conversation: `1on1 [Full Name]` — Claude reads their page, checks recent Slack/email between you, looks up their Jira tickets, generates a prep brief in 30 seconds.

---

## Daily Workflow

### Morning (5 min)
```
alfred
```
One command. All sources. One structured note. Day organized.

### During the Day

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

### End of Day (3 min)
```
closeday
```
Five questions → ideas saved, follow-ups filed, tomorrow pre-loaded.

### End of Week (Friday)
```
weekly   → synthesize all daily notes
retro    → Leadership OS self-score + NOs said
wbr      → weekly metrics from Snowflake
```

### Monthly / Quarterly
```
mbr      → Monthly Business Review
quarterly → QBR + OKR review
```

### Weekly Maintenance
```
lint     → vault health check
```

---

## The Wiki Log

`3 Reference/Wiki/Log.md` is append-only. Every wikify, query filing, and lint pass is recorded:

```markdown
| Date | Operation | Source → Output | Notes |
|------|-----------|-----------------|-------|
| 2026-05-06 | CREATE | ad-stack.docx → Wiki/Ad Stack.md | Full pipeline documented |
| 2026-05-06 | INGEST | Granola/2026-05-06.md → Daily note | 5 meetings, 12 action items |
| 2026-05-06 | LINT | Full vault health check | 10 issues found, all resolved |
```

The log gives you a timeline of how the brain evolved — and lets Claude pick up exactly where it left off across sessions without re-deriving what's already been done.

---

## Customize for Your Context

After running the bootstrap prompt, change exactly these things:

1. **Rename brain folder:** `mv "8 [OLD NAME]'S BRAIN" "8 [YOUR NAME]'S BRAIN"` → find/replace all references in all .md files
2. **Fill in About [You].md** — your name, team, revenue targets, tech stack, coaching notes (honest ones)
3. **Update CLAUDE.md** — your VIP list, team list, Jira board URL, revenue target
4. **Create People pages** for each VIP and direct report: `person [Full Name]`
5. **Drop your first docs** into Raw/ and wikify them: brand guidelines, metric definitions, architecture docs
6. **Activate folder colors:** Obsidian Settings → Appearance → CSS Snippets → toggle `folder-colors`

**What NOT to change:**
- The YAML frontmatter field names (Dataview queries depend on them)
- The folder numbering 1-8 (sort order depends on it)
- The `.gitignore` pattern (keeps personal files off GitHub)

---

## The Compound Effect

```
Day 1:    Drop a doc → wikify → 1 wiki page. Small overhead, no payoff yet.
Week 1:   5 alfreds → 5 daily notes → carry-forward loop runs itself.
Month 1:  4 WBRs → pattern recognition → anomaly baseline forming.
Month 3:  15+ wiki pages cross-referencing each other → knowledge graph.
Month 6:  Ask any question about your domain → the answer is already in the wiki.
Year 1:   New team member → onboard from wiki → 6-month ramp → 2 weeks.
```

The first week is overhead. Month 6 is leverage. Year 1 is institutional memory that survives turnover.

---

## What's in the GitHub Template

When you publish this system to GitHub, only the structure and HOW TO BUILD ME ship — all personal data stays gitignored:

**What's included (shareable):**
- Full PARA folder structure with `_Index.md` files
- Generic `CLAUDE.md` template
- All 25+ command files in `.claude/commands/`
- Wiki starter pages: Leadership OS, Say No Playbook
- Agent spec files: Daily Digest, Anomaly, Deep Dive
- CSS snippet for folder colors
- Schema.md, Command Center.md
- HOW TO BUILD ME documentation (this guide)

**What's gitignored (personal, never committed):**
- `8 */About *.md` and `8 */Memory.md`
- `5 People/VIP/` and `5 People/Team/`
- `6 Reviews/Daily/`, `Team/`, `Weekly/`
- `7 Metrics & KPIs/WBR/`, `MBR/`, `QBR/`, `Anomalies/`
- `1 Projects/Priority/`, `Important/`, `Idea Dump/`
- `2 Areas/Role & Strategy/`, `Team/`, `Stakeholders/`, `Hiring/`
- `3 Reference/Raw/` and `4 Archives/` and `Granola/`

**To make it a GitHub Template Repository:** Settings → check "Template repository" → anyone can click "Use this template" to start their own copy.

---

## How to Describe This

> "It's Karpathy's LLM Wiki pattern — an AI that builds and maintains a compounding knowledge graph rather than just answering questions from raw documents — combined with PARA for organizational structure, plus live MCP connections to email, Slack, Jira, and your data warehouse. The result is a work OS that gets smarter every day: your wiki grows from real documents and real meetings, your daily briefing pulls from actual email and calendar, and every interaction with a stakeholder is remembered and surfaced when you need it."

Or shorter:

> "PARA gives it structure. LLM Wiki gives it memory. MCP gives it live data. Together: a second brain that works."

---

## Quick Start — Under 1 Hour, Zero Coding

Anyone can set this up from scratch by following the steps above and running the prompt below. Total time: under 1 hour. No coding knowledge required — just a computer, an Anthropic account, and your work email.

1. Create an empty folder: `mkdir ~/Desktop/My\ Second\ Brain`
2. Open Claude Code inside it: `cd ~/Desktop/My\ Second\ Brain && claude`
3. Paste this prompt:

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
9. Main business / revenue target this year? (or SKIP)
10. Publish to GitHub when done? yes / no — if yes, repo name?

Once you have all answers, build the complete vault:
- Full PARA folder structure (1 Projects through 4 Archives + 5 People + 6 Reviews + 7 Metrics + 8 BRAIN)
- CLAUDE.md operating manual (personalized with my name, role, VIPs, team)
- About [Name].md (private profile, gitignored)
- Schema.md with frontmatter contracts for every file type
- Command Center.md with all 25+ commands
- Home.md with Dataview dashboard
- _Index.md in every folder
- People pages for each VIP and direct report
- Agent specs: Daily Digest, Anomaly, Deep Dive
- Wiki starter pages: Leadership OS, Say No Playbook
- All 25+ commands in .claude/commands/: alfred, wikify, lint, closeday, 1on1, anomaly,
  archive, brand, clip, commands, deepdive, email, exec-brief, jira (or linear/asana),
  mbr, new, no, note, person, quarterly, retro, slack, status, tldr, tomorrow, wbr, weekly
- .gitignore (exclude all personal files)
- CSS snippet for folder colors in .obsidian/snippets/

After building, print a build report: folders created, files created, commands installed,
personalized with, what still needs manual setup.

Then tell me the 3 next steps to get the first alfred running.
```

Claude builds everything in ~5 minutes. Then open the folder in Obsidian.

---

## After the Build — First alfred in 3 Steps

**1. Connect your integrations** (claude.ai → Settings → Integrations):
Gmail · Google Calendar · Google Drive · Slack · Jira/Linear · Granola — takes ~5 minutes, no API keys

**2. Open in Obsidian:**
File → Open Vault → select your folder → install Dataview, Templater, Calendar → enable folder-colors CSS snippet

**3. Run your first alfred:**
In Claude Code terminal: type `alfred` → watch the daily note populate with your calendar, email, Slack, and Jira — all in one place

---

## Note

This document is intentionally comprehensive but not prescriptive. The exact folder names, command behavior, schema fields, MCP choices — all of that depends on your role, company, tools, and workflow. Everything above is modular: use what fits, skip what doesn't.

The right way to use this: share it with your LLM agent, answer the setup questions, and let it build. Then evolve it. The schema gets better as you find gaps. Commands sharpen as you learn what you actually reach for. The wiki gets richer as you add sources. That's the point — a system that improves the more you use it.

---

*Inspired by: Andrej Karpathy's [LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) · Tiago Forte's PARA Method · Anthropic's Model Context Protocol (MCP)*
