# Second Brain X — AI-Powered Work OS

> PARA + LLM Wiki + live MCP data. One command builds your entire second brain.  
> **Setup time: under 1 hour. Zero coding required.**

---

## What Is This?

A system that connects your notes, email, Slack, calendar, and project tickets into a single AI-queryable workspace — one that gets smarter the more you use it.

The idea comes from two sources:

**[Andrej Karpathy's LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)** — instead of asking an LLM to answer questions from raw documents (RAG), have it *build and maintain a wiki* from those documents. The wiki compounds. Every source you add makes every related page richer. Six months in, your domain knowledge is already in the wiki — not scattered across docs and your head.

**[Tiago Forte's PARA](https://fortelabs.com/blog/para/)** — all information lives in one of four buckets: **P**rojects (active work), **A**reas (ongoing responsibilities), **R**eference (knowledge), **A**rchive (completed). Everything has one right place. No filing paralysis.

**Second Brain X adds what neither covers:** live MCP connections to your actual tools — Gmail, Slack, Jira, Calendar, Google Drive, Granola. Your brain knows what's in your inbox right now, not just what you've written down.

> **"PARA gives it structure. LLM Wiki gives it memory. MCP gives it live data. Together: a second brain that actually works."**

---

## How It Works — The Key Concepts

### Raw vs. Wiki

The most important distinction in the system:

**`3 Reference/Raw/`** — your **inbox for knowledge**. Drop anything here: web clips, Drive links, meeting notes, PDFs, articles. Nothing is processed or summarized yet. This is where things *land*.

**`3 Reference/Wiki/`** — your **living knowledge base**. This is where things *live*. Each page is built and maintained by Claude from your Raw material. Run `wikify [filename]` and Claude reads the raw file, extracts what's useful, and either creates a new wiki page or *appends* to an existing one — it never overwrites. Come back six months later and every source you've added on a topic is synthesized into one place.

```
You drop a doc into Raw/         →  wikify  →  Wiki page created (or updated)
You clip a web article            →  wikify  →  New insights appended to existing page
You paste meeting notes           →  wikify  →  Wiki gets smarter
```

The wiki is the engine. It gets more useful every day you feed it.

### CLAUDE.md — The Operating Manual

A file called `CLAUDE.md` lives at your vault root. Claude Code reads it automatically at the start of every session. It tells Claude who you are, who your VIPs are, what your priorities are, and how the system works. You evolve it over time. This is what makes Claude a disciplined work partner instead of a generic assistant.

### Commands

25 named commands live in `.claude/commands/`. You just type the name — no prefix. Each command is a markdown file with full instructions for what Claude should do. They work anywhere inside your vault.

---

## Folder Structure

```
My Second Brain/
│
├── CLAUDE.md                     ← AI operating manual (auto-loaded every session)
├── Home.md                       ← Dashboard with live Dataview queries
│
├── 1 Projects/          🔴       ← Active work with deadlines
│   ├── Priority/                    score 4-5: do now
│   ├── Important/                   score 2-3: do soon
│   └── Idea Dump/                   score 1: someday/maybe
│
├── 2 Areas/             🔵       ← Ongoing responsibilities
│   ├── Role & Strategy/
│   ├── Team/
│   ├── Stakeholders/
│   └── Hiring/
│
├── 3 Reference/         🟢       ← All knowledge
│   ├── Raw/                         ← INBOX: unprocessed drops (clips, imports, notes)
│   └── Wiki/                        ← BRAIN: LLM-built pages, cumulative, never overwritten
│
├── 4 Archives/          ⬜       ← Completed / inactive projects
│
├── 5 People/            🟣       ← One page per contact (your CRM)
│   ├── VIP/                         key stakeholders — surface FIRST in every digest ⭐
│   └── Team/                        direct reports — surface SECOND ⭐
│
├── 6 Reviews/           🟡       ← Time-based cadence
│   ├── Daily/                       daily digest (cumulative — carry-forwards only)
│   └── Weekly/                      weekly retro
│
├── 7 Metrics & KPIs/    🟠       ← Data, reports, KPIs (optional — skip if not applicable)
│
├── 8 [YOUR NAME]'S BRAIN/ 🩵    ← System config (loads last, sorts last)
│   ├── About [You].md               your private profile (gitignored)
│   ├── Schema.md                    frontmatter contracts for every file type
│   ├── Command Center.md            all commands reference
│   └── Agents/                      agent spec files
│
├── Granola/                      ← Raw meeting transcripts (never modify)
└── .claude/commands/             ← All 25 named commands
```

---

## Commands

| Command | What It Does |
|---------|-------------|
| `alfred` | Morning briefing — email, calendar, Slack, Jira, meeting transcripts, carry-forwards → one daily note |
| `wikify [file]` | Synthesize raw file into a cumulative wiki page (appends, never overwrites) |
| `1on1 [name]` | Pre-meeting brief — open action items, last notes, recent Slack/email |
| `email` | Triage unread email — VIPs first, draft responses |
| `slack` | Triage Slack DMs and @mentions — VIPs first |
| `jira` | Sprint board — your tickets + team progress + blockers |
| `deepdive [topic]` | Multi-source research → A/B/C recommendation with confidence level |
| `no [request]` | Help decline a request — classify type, suggest script, draft the message |
| `closeday` | EOD capture — ideas, follow-ups, tomorrow pre-loaded |
| `weekly` | Synthesize all daily notes into weekly review |
| `retro` | Leadership self-score + NOs said this week + one change for next week |
| `clip [URL]` | Save any Drive/web link to Raw/ (stays live — fetches latest on wikify) |
| `note [text]` | Quick capture → Raw/ |
| `person [name]` | Create or update a People page |
| `new [name] [1-5]` | Create a new project with priority score |
| `status [project]` | One-paragraph project update ready to share |
| `exec-brief [topic]` | 1-page brief: headline, 3 bullets, recommendation |
| `tldr` | Summarize any doc in 5 bullets |
| `archive [name]` | Move project to Archives/ with closure summary |
| `lint` | Vault health check — stale notes, broken links, unprocessed Raw files |
| `commands` | Print the full command reference |

---

## Install the Plugin

### Option A — One line in your terminal (works today)

```bash
curl -fsSL https://raw.githubusercontent.com/alipilehvar/second-brain/main/install.sh | bash
```

Then open Claude Code in any empty folder and type:

```
setup-brain
```

That's it. The wizard runs, asks you 10 questions, and builds everything.

### Option B — Claude Code Marketplace (coming soon)

Once listed in the marketplace, anyone at your company can install it with:

```bash
claude plugin install second-brain
```

Or from the Claude Code UI: **Settings → Plugins → Browse → search "second-brain" → Install**

Then type `setup-brain` to run the wizard.

---

## Full Setup Guide

Follow these steps in order. Takes about 45–60 minutes total.

---

### Step 1 — Install Obsidian (5 min)

Obsidian is the app you use to read and browse your vault. Your vault is just a folder of markdown files — Obsidian is the interface.

1. Download from **[obsidian.md](https://obsidian.md)** (free — Mac / Windows / Linux)
2. Install and open it
3. Click **"Open folder as vault"** → create a new empty folder (e.g. `~/Desktop/My Second Brain`)
4. Go to **Settings → Community Plugins → Turn on community plugins**
5. Click **Browse** and install:
   - **Dataview** — powers live dashboard queries in Home.md
   - **Templater** — advanced templates
   - **Calendar** — visual date navigation

---

### Step 2 — Install Claude Code (10 min)

Claude Code is the AI that reads and writes your vault. It runs in your terminal alongside Obsidian.

1. Install **Node.js** if you don't have it:
   - Mac: `brew install node` or download from [nodejs.org](https://nodejs.org)
   - Windows: download installer from [nodejs.org](https://nodejs.org)

2. Install Claude Code:
   ```bash
   npm install -g @anthropic-ai/claude-code
   ```

3. Create an account at **[claude.ai](https://claude.ai)** (Pro plan recommended for heavy daily use)

4. Open Claude Code inside your vault folder:
   ```bash
   cd ~/Desktop/My\ Second\ Brain
   claude
   ```
   It will open a browser window to authenticate — sign in with your claude.ai account.

> **Tip:** Keep Obsidian open on one side of your screen and the Claude Code terminal on the other. Claude writes; you read in real time.

---

### Step 3 — Install Granola (5 min)

Granola runs silently during meetings and produces structured transcripts. These feed `alfred` automatically — no manual note-taking.

1. Download from **[granola.so](https://granola.so)** (Mac; Windows coming soon)
2. Install and open it
3. Go to **Preferences → Account → Add your work email** (not personal Gmail)
4. Grant microphone access when prompted
5. Granola auto-detects your Google Calendar meetings and starts capturing when you join calls

> ⚠️ **Connect your work email** — or transcripts won't match your calendar.

---

### Step 4 — Connect Your Tools to Claude (10 min)

MCP connections give Claude live access to your tools. Set up once — they persist forever.

**Go to: [claude.ai](https://claude.ai) → Settings → Integrations**

Click **Add** next to each and sign in with your work account:

| Tool | What to Click | What It Powers |
|------|--------------|----------------|
| **Gmail** | Add Google → sign in with work email | `alfred`, `email` — reads threads, drafts replies |
| **Google Calendar** | Included with Google | `alfred` — reads events, flags back-to-backs |
| **Google Drive** | Included with Google | `clip`, `wikify` — fetches live doc versions |
| **Slack** | Add Slack → sign in with your workspace | `alfred`, `slack` — reads DMs and @mentions |
| **Jira** | Add Atlassian → sign in | `alfred`, `jira`, `1on1` — sprint board and tickets |
| **Linear** | Add Linear → sign in | Same as Jira (use whichever your team uses) |
| **Granola** | Add Granola → sign in with work email | `alfred` — meeting transcripts → action items |

> No API keys. No code. Just OAuth. Each takes ~30 seconds. They reconnect automatically each session.

---

### Step 5 — Install the Setup Wizard (1 min)

Run this in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/alipilehvar/second-brain/main/install.sh | bash
```

This installs the `setup-brain` command globally in Claude Code. You'll see:
```
✅ Plugin installed successfully!
```

---

### Step 6 — Build Your Second Brain (5–10 min)

Open Claude Code in your vault folder:

```bash
cd ~/Desktop/My\ Second\ Brain
claude
```

Then type:
```
setup-brain
```

Claude asks you **10 questions** one at a time — name, role, company, team, VIP stakeholders, project management tool. Answer them, then Claude builds everything automatically:

- 30+ folders with the PARA structure
- 25 commands in `.claude/commands/`
- A personalized `CLAUDE.md` operating manual
- People pages for each VIP and team member
- Wiki starter pages (Leadership OS, Say No Playbook)
- Home.md dashboard with Dataview queries
- `.gitignore` so your personal files never get committed

Takes about 5 minutes.

---

### Step 7 — Open in Obsidian and Activate Folder Colors (2 min)

1. In Obsidian: **File → Open Vault → select your vault folder**
2. **Settings → Appearance → CSS Snippets → toggle `folder-colors` ON**

Your folders become color-coded — red for active work, green for knowledge, purple for people, etc.

---

### Step 8 — Run Your First alfred

In the Claude Code terminal:

```
alfred
```

Claude will pull everything — email, calendar, Slack, Jira, Granola transcripts — and write a single structured daily note. Your day is organized.

---

## Your Daily Workflow

```
Morning   (5 min): alfred
During day:        1on1 · email · slack · jira · clip · deepdive · no
End of day (5 min): closeday
Friday:            weekly → retro
Weekly:            lint
```

---

## The Compound Effect

```
Day 1:    wikify one doc → 1 wiki page
Week 1:   5 alfreds → carry-forward loop runs itself
Month 1:  wiki grows — every new source enriches existing pages
Month 3:  15+ pages cross-referencing each other → knowledge graph
Month 6:  ask any question about your domain → answer already in the wiki
Year 1:   new teammate → onboard from wiki → 2 weeks instead of 6 months
```

---

## The .gitignore

Personal files are protected automatically — they will never be committed:

```
5 People/VIP/       ← your stakeholder notes
5 People/Team/      ← your team notes
6 Reviews/          ← daily and weekly reviews
1 Projects/         ← your active work
2 Areas/            ← your responsibilities
3 Reference/Raw/    ← your unprocessed inbox
8 */About *.md      ← your private profile
8 */Memory.md       ← AI session memory
Granola/            ← meeting transcripts
```

Only the structure, commands, wiki pages, and HOW TO BUILD ME docs get committed — nothing personal.

---

## Deeper Reading

| Doc | What It Covers |
|-----|---------------|
| [`HOW TO BUILD ME/17 HOW KNOW - GitHub Gist (Short).md`](HOW%20TO%20BUILD%20ME/17%20HOW%20KNOW%20-%20GitHub%20Gist%20(Short).md) | Short overview (~250 lines) — shareable with anyone |
| [`HOW TO BUILD ME/16 HOW KNOW - Professional Second Brain.md`](HOW%20TO%20BUILD%20ME/16%20HOW%20KNOW%20-%20Professional%20Second%20Brain.md) | Full guide — architecture, design principles, daily cadence, compound effect |
| [`CLAUDE.md.template`](CLAUDE.md.template) | Full CLAUDE.md template with all rules and personalization guide |
| [`HOW TO BUILD ME/05 MCP Connections.md`](HOW%20TO%20BUILD%20ME/05%20MCP%20Connections.md) | MCP troubleshooting and advanced setup |
| [`HOW TO BUILD ME/00 Bootstrap Prompt.md`](HOW%20TO%20BUILD%20ME/00%20Bootstrap%20Prompt.md) | The full bootstrap prompt you can paste directly into Claude Code |

---

## Credits

- LLM Wiki pattern by [Andrej Karpathy](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- PARA method by [Tiago Forte](https://fortelabs.com/blog/para/)
- Built with [Claude Code](https://claude.ai/code) by Anthropic
- [Obsidian](https://obsidian.md/) · [Granola](https://granola.so/)

---

*Built by [Ali Pilehvar](https://www.linkedin.com/in/alipilehvar/) · [Medium: AI & disruption](https://alipilevar.medium.com/)*
