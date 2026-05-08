# Second Brain X — AI-Powered Work OS

> A PARA-based Obsidian vault + Claude Code system that turns your notes, emails, Slack, Jira, and calendar into a unified, AI-queryable second brain.

**Built by:** [Ali Pilehvar](https://www.linkedin.com/in/alipilehvar/) · [Medium](https://alipilevar.medium.com/) — writes about AI & disruption  
**Inspired by:** Tiago Forte's PARA method + Andrej Karpathy's LLM Wiki pattern  
**Built with:** Obsidian + Claude Code + MCP servers  
**Time to set up:** ~5 minutes (fully automated)

---

## Start Here — The Concept

Before installing, read one of these to understand what you're building:

| Doc | Format | Best for |
|-----|--------|---------|
| [`HOW TO BUILD ME/16 HOW KNOW - Professional Second Brain.md`](HOW%20TO%20BUILD%20ME/16%20HOW%20KNOW%20-%20Professional%20Second%20Brain.md) | Full guide (~780 lines) | Deep understanding — architecture, design principles, full workflow, daily cadence, compound effect |
| [`HOW TO BUILD ME/17 HOW KNOW - GitHub Gist (Short).md`](HOW%20TO%20BUILD%20ME/17%20HOW%20KNOW%20-%20GitHub%20Gist%20(Short).md) | Short version (~250 lines) | Quick overview — shareable with anyone, paste-into-Claude ready |

> Both include the bootstrap prompt at the bottom — paste it into Claude Code to build everything automatically.

---

## What This Does

| Layer | What It Is |
|-------|-----------|
| **Vault** | Obsidian markdown files organized by PARA (Projects / Areas / Reference / Archives) |
| **Brain** | Claude Code reads/writes the vault via a custom `CLAUDE.md` operating manual |
| **Commands** | 25 no-prefix slash commands for daily operations (`alfred`, `1on1`, `wbr`, `wikify`...) |
| **Agents** | Subagents for deep dives, anomalies, and synthesis |
| **Wiki** | Cumulative knowledge pages built from raw sources — never overwritten |
| **Connections** | Live MCP links to Gmail, Slack, Jira, Drive, Calendar, Granola, Snowflake |

---

## Install in 3 Steps

### Step 1 — Install Prerequisites

| Tool | Download | Purpose |
|------|----------|---------|
| **Obsidian** | [obsidian.md](https://obsidian.md) | Your vault viewer + editor |
| **Claude Code** | [claude.ai/code](https://claude.ai/code) | The AI engine |
| **Granola** | [granola.so](https://granola.so) | Meeting transcript capture |

### Step 2 — Install the Plugin (one command)

Open your terminal and run:

```bash
curl -fsSL https://raw.githubusercontent.com/alipilehvar/second-brain/main/install.sh | bash
```

This installs the `setup-brain` command globally in Claude Code.

### Step 3 — Run the Setup Wizard

Open Claude Code in any empty folder where you want your vault to live:

```bash
mkdir ~/Desktop/MyBrain && cd ~/Desktop/MyBrain && claude
```

Then type:
```
setup-brain
```

Claude will ask you 10 questions (name, role, company, team, stakeholders, tools) and build your entire second brain in ~5 minutes. No technical knowledge required.

---

## What Gets Built Automatically

| What | Count |
|------|-------|
| Folders | 30+ |
| Skill commands | 25 |
| Index files | 20+ |
| People pages (VIP + Team) | 1 per person |
| Wiki starter pages | Leadership OS, Say No Playbook |
| Agent specs | Daily Digest, Anomaly, Deep Dive |
| Config files | CLAUDE.md, .gitignore, folder-colors.css |
| Dashboard | Home.md with live Dataview queries |

---

## Architecture

```
Raw Sources                  Vault (Obsidian)              Output
─────────────                ────────────────              ──────
Gmail          ──┐
Google Calendar──┤           PARA Folders                  Daily Digest
Slack          ──┤  MCPs →   + LLM Wiki        → Claude → Weekly Review
Jira/Linear    ──┤           + People CRM                  Deep Dives
Google Drive   ──┤           + Reviews                     Anomaly Alerts
Granola        ──┤           + Metrics                     Wiki Pages
Snowflake      ──┘
```

---

## Connect Your Tools (after setup)

Go to **claude.ai → Settings → Integrations** and connect:

| Integration | Enables |
|-------------|---------|
| Gmail | `alfred`, `email` |
| Google Calendar | `alfred`, `tomorrow` |
| Google Drive | `clip`, `wikify` |
| Slack | `alfred`, `slack`, `1on1` |
| Jira / Linear / Asana | `alfred`, `jira`, `1on1` |
| Granola | `alfred` (meeting action items) |
| Snowflake (optional) | `wbr`, `mbr`, `anomaly`, `deepdive` |

Full instructions: [`HOW TO BUILD ME/05 MCP Connections.md`](HOW%20TO%20BUILD%20ME/05%20MCP%20Connections.md)

---

## CLAUDE.md — The Operating Manual

The `CLAUDE.md` file is what makes Claude a disciplined work partner instead of a generic assistant. It lives at the vault root and is auto-loaded every session.

A full template with all rules is included: [`CLAUDE.md.template`](CLAUDE.md.template)

Key sections:
- **Core Rules** — cumulative notes, people-page discipline, VIP priority
- **Granola Rules** — how meeting transcripts get indexed into people pages and daily notes
- **People & 1:1 Prep System** — per-person WIKI + prep doc conventions
- **Jira / Linear Rules** — sprint update format and index ordering
- **Automation Hook** — SessionStart hook that flags unindexed Granola transcripts

The setup wizard (`setup-brain`) generates a personalized version automatically from your answers.

---

## The 25 Commands

Once your brain is built, these commands work in any Claude Code session inside your vault:

| Command | What it does |
|---------|-------------|
| `alfred` | Morning digest — email, calendar, Slack, Jira, Granola, carry-overs |
| `1on1` | Pre-meeting brief for any person |
| `wbr` | Weekly Business Review from live data |
| `wikify` | Turn raw notes/links into a cumulative Wiki page |
| `anomaly` | Investigate a metric spike or drop |
| `deepdive` | Multi-source research → A/B/C recommendation |
| `email` | Triage unread email, VIP-first |
| `slack` | Triage Slack mentions and DMs |
| `jira` | Sprint status by person |
| `clip` | Save a Drive/web link to Raw |
| `person` | Create or update a person page |
| `new` | Create a new project |
| `no` | Help decline a request (scripts included) |
| `status` | One-paragraph update on any project |
| `weekly` | End-of-week synthesis |
| `retro` | Leadership OS self-score |
| `tomorrow` | End-of-day prep |
| `exec-brief` | 1-page executive brief on any topic |
| `tldr` | Summarize any doc in 5 bullets |
| `note` | Quick capture to Raw |
| `archive` | Move a project to Archives |
| `mbr` | Monthly Business Review |
| `quarterly` | Quarterly Business Review |
| `brand` | Answer brand/design questions from your wiki |
| `lint` | Vault health check — broken links, stale notes |

---

## What Makes This Different

This system implements [Andrej Karpathy's LLM Wiki pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) and extends it into a complete Work OS:

> **"PARA gives it structure. LLM Wiki gives it memory. MCP gives it live data. Together: a second brain that actually works."**

| Layer | Source | What It Adds |
|-------|--------|-------------|
| Organizational structure | Tiago Forte's PARA | Everything has one right place |
| Compounding knowledge | Karpathy's LLM Wiki | Wiki grows smarter with every ingest |
| Live data | MCP servers | Wiki reflects current reality, not static docs |
| Operational cadence | `alfred` daily ritual | Forces the habit that makes the system self-sustaining |
| Business intelligence | Snowflake + WBR/MBR | Metrics layer connected to your actual data warehouse |

---

## Credits

- PARA method by [Tiago Forte](https://fortelabs.com/)
- LLM Wiki pattern by [Andrej Karpathy](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- Built with [Claude Code](https://claude.ai/code) by Anthropic
- [Obsidian](https://obsidian.md/) by Obsidian.md
- [Granola](https://granola.so/) for meeting transcripts

---

*Built by Ali Pilehvar — [LinkedIn](https://www.linkedin.com/in/alipilehvar/) · [Medium](https://alipilevar.medium.com/)*
