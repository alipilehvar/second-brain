# Second Brain X

**An AI-powered work OS for knowledge workers and leaders.**  
One command. Every morning. Everything organized.

[![Install](https://img.shields.io/badge/Install-Claude%20Code%20Plugin-6C63FF?style=for-the-badge)](https://github.com/alipilehvar/second-brain#install)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Built with Claude](https://img.shields.io/badge/Built%20with-Claude%20Code-orange?style=for-the-badge)](https://claude.ai/code)

---

## The Problem

You start every day scattered across five tools — email, Slack, calendar, Jira, and notes — spending the first hour just figuring out what matters. Nothing connects. Decisions get re-derived from scratch. Meeting context lives only in your head.

**Second Brain X fixes this.**

---

## What It Does

Type `alfred` every morning. In 30 seconds:

```
📧  Email     →  VIPs surfaced first. Actions flagged. Drafts ready.
📅  Calendar  →  Today's meetings prepped. Back-to-backs flagged.
💬  Slack     →  DMs and @mentions triaged. Responses drafted.
🎫  Jira      →  Sprint status. Team blockers. What's due.
🎙️  Meetings  →  Yesterday's transcripts → action items extracted.
📝  Output    →  One clean daily note. Day organized.
```

Beyond the morning briefing, 24 additional commands handle everything from 1:1 prep to knowledge synthesis — all from a single terminal window.

---

## How It Works

Built on two proven patterns:

> **[PARA](https://fortelabs.com/blog/para/)** (Tiago Forte) — every piece of information has exactly one home: Projects, Areas, Reference, or Archive. No filing paralysis.

> **[LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)** (Andrej Karpathy) — instead of answering from raw documents, the AI *builds and maintains a wiki* from them. Knowledge compounds. Every source you add makes every related page richer.

**Second Brain X adds what neither covers:** live MCP connections to Gmail, Slack, Jira, Calendar, Drive, and Granola — so your brain reflects what's happening *right now*, not just what you've written down.

```
Gmail · Calendar · Slack · Jira · Drive · Granola
              ↓  (MCP — no API keys)
     PARA Vault (Obsidian markdown files)
              ↓  (Claude Code reads/writes)
    alfred · wikify · 1on1 · deepdive · ...
              ↓
     One daily note. Growing knowledge base.
```

---

## Install

### One line

```bash
curl -fsSL https://raw.githubusercontent.com/alipilehvar/second-brain/main/install.sh | bash
```

Then open Claude Code in an empty folder and type:

```
setup-brain
```

An interactive wizard asks you 10 questions — name, role, team, tools — and builds your entire workspace in ~5 minutes.

### Via Claude Code Marketplace *(coming soon)*

```bash
claude plugin install second-brain
```

---

## Setup: 8 Steps

| Step | What to Do | Time |
|------|-----------|------|
| 1 | Download [Obsidian](https://obsidian.md) | 2 min |
| 2 | Download [Claude Code](https://claude.ai/code) | 5 min |
| 3 | Download [Granola](https://granola.so) → add your work email | 3 min |
| 4 | [claude.ai](https://claude.ai) → Settings → Integrations → connect Gmail, Slack, Jira, Granola | 10 min |
| 5 | In Claude Code, type `/mcp` to confirm tools are connected | 1 min |
| 6 | Run the install line above → type `setup-brain` → answer 10 questions | 10 min |
| 7 | Open folder in Obsidian → Settings → CSS Snippets → enable `folder-colors` | 2 min |
| 8 | Type `alfred` | 30 sec |

**Total: ~35 minutes. No coding required.**

> Not technical? See the [plain-English guide →](START-HERE-NON-TECHNICAL.md)

---

## Vault Structure

```
My Second Brain/
├── 1 Projects/        🔴  Active work — scored by priority (1–5)
├── 2 Areas/           🔵  Ongoing responsibilities
├── 3 Reference/       🟢  Knowledge base
│   ├── Raw/               Drop zone — unprocessed clips, links, notes
│   └── Wiki/              AI-maintained knowledge graph (cumulative, never overwritten)
├── 4 Archives/        ⬜  Completed work
├── 5 People/          🟣  One page per contact — your built-in CRM
│   ├── VIP/               Key stakeholders — surface first in every digest ⭐
│   └── Team/              Direct reports — surface second ⭐
├── 6 Reviews/         🟡  Daily notes · Weekly retros
├── 7 Metrics & KPIs/  🟠  Reports, KPIs, data (optional)
└── 8 [YOUR BRAIN]/    🩵  CLAUDE.md · Schema · Agents · Command Center
```

**Raw vs. Wiki — the key idea:**  
`Raw/` is your inbox. `Wiki/` is your brain. Drop anything into Raw, run `wikify`, and Claude synthesizes it into a cumulative wiki page — appending new insights, never overwriting old ones. Six months in, everything you've learned about any topic is in one place.

---

## Commands

| Command | What It Does |
|---------|-------------|
| `alfred` | Morning briefing — email, calendar, Slack, Jira, meetings → one daily note |
| `1on1 [name]` | Pre-meeting brief in 30 seconds |
| `wikify [file]` | Synthesize any doc/link into your knowledge base |
| `deepdive [topic]` | Multi-source research → A/B/C recommendation |
| `email` | Triage inbox — VIPs first |
| `slack` | Triage DMs and @mentions — VIPs first |
| `jira` | Sprint board — team progress, blockers, what's due |
| `no [request]` | Help decline gracefully — classify, script, draft |
| `closeday` | EOD capture — ideas, follow-ups, tomorrow preloaded |
| `weekly` | Synthesize the week |
| `retro` | Leadership self-score + NOs said |
| `clip [url]` | Save any link to Raw (stays live — fetches latest on wikify) |
| `note [text]` | Quick capture |
| `person [name]` | Create or update a People page |
| `new [name] [1–5]` | Create a project with priority score |
| `status [project]` | One-paragraph update ready to share |
| `exec-brief [topic]` | 1-page brief: headline, 3 bullets, recommendation |
| `archive [name]` | Move to Archives with closure summary |
| `lint` | Vault health check — stale notes, broken links |
| `tldr` | Summarize any doc in 5 bullets |

---

## What Gets Built

When `setup-brain` completes:

| What | Count |
|------|-------|
| Folders | 30+ |
| Commands | 25 |
| People pages | 1 per VIP + 1 per team member |
| Wiki starter pages | Leadership OS · Say No Playbook |
| Agent specs | Daily Digest · Anomaly · Deep Dive |
| Config files | `CLAUDE.md` · `.gitignore` · `folder-colors.css` |
| Dashboard | `Home.md` with live Dataview queries |

All personalized to your name, role, team, and tools.

---

## The Compound Effect

```
Day 1   →  wikify one doc → 1 wiki page
Week 1  →  5 alfreds → carry-forward loop runs itself
Month 1 →  wiki grows — every source enriches existing pages
Month 3 →  15+ pages cross-referencing → knowledge graph
Month 6 →  ask any question → answer already in your wiki
Year 1  →  new teammate onboards from your wiki in days, not months
```

---

## Privacy & Security

- Everything lives **on your computer** — your vault is a local folder of markdown files
- MCP connections use **OAuth only** — no passwords stored, no API keys
- `.gitignore` protects all personal content — people pages, daily notes, projects, raw notes, meeting transcripts **never get committed**
- Only vault structure, commands, and wiki pages are version-controlled

---

## Documentation

| Doc | Description |
|-----|-------------|
| [Quick Start](docs/quick-start.md) | 250-line overview — shareable with anyone |
| [Full Guide](docs/full-guide.md) | Complete architecture, design principles, daily workflow |
| [MCP Connections](docs/mcp-connections.md) | Tool setup and troubleshooting |
| [Bootstrap Prompt](docs/bootstrap-prompt.md) | Paste directly into Claude Code to build without the plugin |
| [CLAUDE.md Template](CLAUDE.md.template) | Full operating manual template with all rules |
| [Non-Technical Guide](START-HERE-NON-TECHNICAL.md) | Plain-English setup for non-developers |

---

## Credits

Inspired by:
- [LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) by Andrej Karpathy
- [PARA Method](https://fortelabs.com/blog/para/) by Tiago Forte
- [Claude Code](https://claude.ai/code) by Anthropic
- [Obsidian](https://obsidian.md) · [Granola](https://granola.so)

---

## License

MIT — free to use, fork, and build on. See [LICENSE](LICENSE).

---

*Built by [Ali Pilehvar](https://www.linkedin.com/in/alipilehvar/) · [Medium](https://alipilevar.medium.com/)*
