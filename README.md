# Second Brain X — AI-Powered Work OS

> PARA + LLM Wiki + live MCP data. One command builds your entire second brain.  
> **Setup time: under 1 hour. Zero coding required.**

**Built by:** [Ali Pilehvar, Ph.D.](https://www.linkedin.com/in/alipilehvar/) · Director, Data Engineering & Analytics  
**Writes about AI & disruption:** [alipilevar.medium.com](https://alipilevar.medium.com/)

---

## What Is This?

This is a system that turns your Obsidian notes, emails, Slack messages, Jira tickets, calendar, and meeting transcripts into a **unified, AI-queryable second brain** — one that gets smarter every day you use it.

The idea comes from two sources:

**[Andrej Karpathy's LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)** — instead of asking an LLM to answer from raw documents (RAG), have it *build and maintain a wiki* from those documents. The wiki compounds. Every source you add makes every related page richer. Six months in, your domain knowledge is already in the wiki — not in your head.

**[Tiago Forte's PARA](https://fortelabs.com/blog/para/)** — all information lives in one of four buckets: **P**rojects, **A**reas, **R**eference, **A**rchive. Everything has one right place. No filing paralysis.

**Second Brain X adds what neither covers:** live MCP connections to your actual tools — Gmail, Slack, Jira, Calendar, Google Drive, Granola, Snowflake. Your second brain knows what's in your inbox *right now*, not just what you've written down.

> **"PARA gives it structure. LLM Wiki gives it memory. MCP gives it live data. Together: a second brain that actually works."**

---

## What You Get

Once set up, one command every morning:

```
alfred
```

Pulls everything — email, calendar, Slack, Jira, meeting transcripts — and writes a single structured daily note. Your day is organized before your first meeting.

Plus 24 more commands:

| Command | What It Does |
|---------|-------------|
| `1on1 [name]` | Pre-meeting brief — open items, last notes, recent Slack/email |
| `wikify [file]` | Turn any raw doc/link into a cumulative wiki page |
| `wbr` | Weekly Business Review from live data |
| `email` | Triage unread email — VIPs first |
| `slack` | Triage Slack DMs and @mentions |
| `jira` | Sprint board: your tickets + team progress + blockers |
| `anomaly [metric]` | Investigate a metric drop, classify P1/P2/P3 |
| `deepdive [topic]` | Multi-source research → A/B/C recommendation |
| `no [request]` | Help decline using Say No Playbook (scripts included) |
| `closeday` | EOD capture — ideas, follow-ups, tomorrow pre-loaded |
| `weekly` | Synthesize all daily notes into weekly review |
| `retro` | Leadership OS self-score + NOs said this week |
| `exec-brief [topic]` | 1-page executive brief: headline, 3 bullets, recommendation |
| `clip [URL]` | Save any Drive/web link to Raw (stays live) |
| `note [text]` | Quick capture to Raw |
| `status [project]` | One-paragraph project update for leadership |
| `person [name]` | Create or update a People page |
| `new [name] [1-5]` | Create a new project with priority score |
| `lint` | Vault health check — stale notes, broken links, contradictions |
| `archive [name]` | Move project to Archives with closure summary |
| `mbr` | Monthly Business Review |
| `quarterly` | QBR + OKR review |
| `tldr` | Summarize any doc in 5 bullets |
| `commands` | Print the full command reference |

---

## Full Setup Guide

Follow these steps in order. Takes about 45–60 minutes total.

---

### Step 1 — Install Obsidian (5 min)

Obsidian is the app you use to read and browse your vault. Your vault is just a folder of markdown files — Obsidian is the beautiful interface.

1. Download from **[obsidian.md](https://obsidian.md)** (free — Mac / Windows / Linux)
2. Install and open it
3. Click **"Open folder as vault"** → create a new empty folder (e.g. `~/Desktop/My Second Brain`)
4. Go to **Settings → Community Plugins → Turn on community plugins**
5. Click **Browse** and install these three:
   - **Dataview** — powers live dashboard queries
   - **Templater** — advanced templates
   - **Calendar** — visual date navigation
6. Leave Obsidian open — you'll come back to it after setup

---

### Step 2 — Install Claude Code (10 min)

Claude Code is the AI that reads and writes your vault. It runs in your terminal.

1. Install **Node.js** if you don't have it:
   - Mac: `brew install node` (or download from [nodejs.org](https://nodejs.org))
   - Windows: download installer from [nodejs.org](https://nodejs.org)

2. Install Claude Code:
   ```bash
   npm install -g @anthropic-ai/claude-code
   ```

3. Create an account at **[claude.ai](https://claude.ai)** (Pro plan recommended for heavy daily use)

4. Test it:
   ```bash
   cd ~/Desktop/My\ Second\ Brain
   claude
   ```
   It will open a browser window to authenticate — sign in with your claude.ai account.

---

### Step 3 — Install Granola (5 min)

Granola is an AI meeting note-taker that runs silently during calls. It feeds your daily digest with meeting transcripts and action items automatically.

1. Download from **[granola.so](https://granola.so)** (Mac; Windows coming soon)
2. Install and open it
3. **Important:** Go to **Preferences → Account → Add your work email** (not personal Gmail)
4. Grant microphone access when prompted
5. Granola auto-detects your Google Calendar meetings and starts recording when you join a call
6. After each meeting, transcripts appear in the app — Claude reads these during `alfred`

> ⚠️ **Connect your work email, not personal** — or meeting transcripts won't match your calendar.

---

### Step 4 — Connect Your Tools to Claude (10 min)

This is the most important step. MCP connections give Claude live access to your email, Slack, Jira, and calendar — no API keys, no code.

**Go to: [claude.ai](https://claude.ai) → Settings → Integrations**

Connect each one by clicking **Add** and signing in with your work account:

| Tool | How to Connect | What It Powers |
|------|---------------|----------------|
| **Gmail** | Click "Add Google" → sign in with work Gmail | `alfred`, `email` — reads threads, detects action items, drafts replies |
| **Google Calendar** | Same Google connection (auto-included) | `alfred`, `tomorrow` — reads events, flags back-to-backs |
| **Google Drive** | Same Google connection (auto-included) | `clip`, `wikify` — fetches live doc versions |
| **Slack** | Click "Add Slack" → sign in with your workspace | `alfred`, `slack` — reads DMs and @mentions |
| **Jira** | Click "Add Atlassian" → sign in | `alfred`, `jira`, `1on1` — reads sprint board and tickets |
| **Linear** | Click "Add Linear" → sign in | Same as Jira (use whichever your team uses) |
| **Granola** | Click "Add Granola" → sign in with work email | `alfred` — reads meeting transcripts |

> Each connection takes ~30 seconds (just OAuth). No API keys. No code. They persist across all sessions.

---

### Step 5 — Install the Setup Wizard (1 min)

This installs one command (`setup-brain`) into Claude Code globally — it's the wizard that builds your entire vault.

Open your terminal and run:

```bash
curl -fsSL https://raw.githubusercontent.com/alipilehvar/second-brain/main/install.sh | bash
```

You'll see:
```
✅ Plugin installed successfully!
```

---

### Step 6 — Build Your Second Brain (5–10 min)

Navigate to your empty vault folder and open Claude Code:

```bash
cd ~/Desktop/My\ Second\ Brain
claude
```

Then type:
```
setup-brain
```

Claude will ask you **10 questions** one at a time:

1. Your full name
2. Your job title / role
3. Your company
4. Your work email
5. Your city (for weather in your morning digest)
6. Your VIP stakeholders — the 2–3 people whose messages you always prioritize first (name + email)
7. Your direct reports / team (name + email, or NONE)
8. Your project management tool (Jira / Linear / Asana / None) — and board URL if Jira
9. Your main business or revenue target this year (or SKIP)
10. Optional: Snowflake account details for data warehouse queries

Answer each one, then Claude builds everything automatically — 30+ folders, 25 commands, people pages, wiki starter pages, agent specs, dashboard, CSS snippets, and a personalized `CLAUDE.md`. Takes about 5 minutes.

---

### Step 7 — Open in Obsidian and Activate Colors (2 min)

1. In Obsidian: **File → Open Vault → select your vault folder**
2. Go to **Settings → Appearance → CSS Snippets**
3. Toggle **folder-colors** ON → your folders get color-coded by type

You'll see something like this in your sidebar:
```
🔴 1 Projects
🔵 2 Areas
🟢 3 Reference
⬜ 4 Archives
🟣 5 People
🟡 6 Reviews
🟠 7 Metrics & KPIs
🩵 8 [YOUR NAME]'S BRAIN
```

---

### Step 8 — Run Your First alfred

Back in the Claude Code terminal:

```
alfred
```

Claude will:
1. Read your About file for context
2. Pull Gmail (last 24h) — your VIPs first
3. Read today's calendar — flag back-to-backs
4. Scan Slack — DMs and @mentions, VIPs first
5. Check your sprint board — your tickets + team progress
6. Read Granola transcripts — yesterday's meeting action items
7. Carry forward any unchecked items from yesterday
8. Fetch 3-day weather for your city
9. Write a structured daily note to `6 Reviews/Daily/YYYY-MM-DD.md`
10. Update any People pages touched by today's interactions
11. End with a Leadership OS coaching nudge

**That's it. Your day is organized.**

---

### Optional: Snowflake (for data teams)

If your team uses Snowflake, this powers `wbr`, `anomaly`, and `deepdive` with real data:

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

First connection opens a browser SSO window. Token is cached after that.

---

### Optional: Chrome Web Clipper

Clip any webpage directly into your Raw folder with one click.

1. Search **"Obsidian Web Clipper"** in the Chrome Web Store → Add to Chrome
2. Click the extension icon → Settings → set vault path and default folder: `3 Reference/Raw/`
3. On any page: click the icon → saved as markdown → run `wikify [filename]` to add it to your wiki

---

## Your Daily Workflow

```
Morning   (5 min): alfred
During day:        1on1 · email · slack · jira · clip · anomaly · no
End of day (5 min): closeday
Friday:            weekly → retro → wbr
Monthly:           mbr
Quarterly:         quarterly
Weekly:            lint
```

---

## What Gets Built

| What | Count |
|------|-------|
| Folders | 30+ |
| Commands (`.claude/commands/`) | 25 |
| Index files | 20+ |
| People pages | 1 per VIP + 1 per team member |
| Wiki starter pages | Leadership OS, Say No Playbook |
| Agent specs | Daily Digest, Anomaly, Deep Dive |
| Config files | `CLAUDE.md`, `.gitignore`, `folder-colors.css` |
| Dashboard | `Home.md` with live Dataview queries |

---

## The Compound Effect

```
Day 1:    wikify one doc → 1 wiki page
Week 1:   5 alfreds → carry-forward loop runs itself
Month 1:  4 WBRs → anomaly baseline forming
Month 3:  15+ wiki pages cross-referencing → knowledge graph
Month 6:  ask any domain question → answer already in the wiki
Year 1:   new team member → onboard from wiki → 2 weeks instead of 6 months
```

---

## Architecture

```
Raw Sources                    Vault (Obsidian)                 Output
───────────                    ────────────────                 ──────
Gmail           ──┐
Google Calendar ──┤            PARA Folders (1–4)
Slack           ──┤  MCPs  →  + LLM Wiki (3 Reference)  → Claude → Daily Digest
Jira / Linear   ──┤            + People CRM (5)                    Weekly Review
Google Drive    ──┤            + Reviews (6)                       Deep Dives
Granola         ──┤            + Metrics (7)                       Anomaly Alerts
Snowflake       ──┘            + Brain Config (8)                  Wiki Pages
                                       ↑
                               CLAUDE.md (auto-loaded every session)
```

---

## Deeper Reading

- [`HOW TO BUILD ME/17 HOW KNOW - GitHub Gist (Short).md`](HOW%20TO%20BUILD%20ME/17%20HOW%20KNOW%20-%20GitHub%20Gist%20(Short).md) — ~250 lines, shareable anywhere
- [`HOW TO BUILD ME/16 HOW KNOW - Professional Second Brain.md`](HOW%20TO%20BUILD%20ME/16%20HOW%20KNOW%20-%20Professional%20Second%20Brain.md) — full guide: architecture, design principles, daily cadence, compound effect
- [`CLAUDE.md.template`](CLAUDE.md.template) — full operating manual template (all 23 rules)
- [`HOW TO BUILD ME/05 MCP Connections.md`](HOW%20TO%20BUILD%20ME/05%20MCP%20Connections.md) — detailed MCP troubleshooting

---

## Credits

- LLM Wiki pattern by [Andrej Karpathy](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- PARA method by [Tiago Forte](https://fortelabs.com/blog/para/)
- Built with [Claude Code](https://claude.ai/code) by Anthropic
- [Obsidian](https://obsidian.md/) · [Granola](https://granola.so/)

---

*Built by [Ali Pilehvar](https://www.linkedin.com/in/alipilehvar/) · [Medium](https://alipilevar.medium.com/)*
