# Second Brain X

**An AI-powered work OS for leaders and knowledge workers.**  
One command. Every morning. Everything organized.

[![Install](https://img.shields.io/badge/Install-Claude%20Code%20Plugin-6C63FF?style=for-the-badge)](https://github.com/alipilehvar/second-brain#install)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Built with Claude](https://img.shields.io/badge/Built%20with-Claude%20Code-orange?style=for-the-badge)](https://claude.ai/code)

---

## The Problem

You start every day scattered across five tools — email, Slack, calendar, Jira, notes — spending the first hour just figuring out what matters. Decisions get re-derived from scratch. Meeting context lives only in your head. Documents sit unread in Drive. Your team's knowledge resets every time someone leaves.

**Second Brain X fixes this.**

---

## What It Does

Type `alfred` every morning. In 30 seconds:

```
📧  Email      →  VIPs surfaced first. Actions flagged. Drafts ready.
📅  Calendar   →  Today's meetings prepped. Back-to-backs flagged.
💬  Slack      →  DMs and @mentions triaged. Responses drafted.
🎫  Jira       →  Sprint status. Team blockers. What's due.
🎙️  Meetings   →  Last night's transcripts → action items extracted.
📝  Output     →  One clean daily note. Day organized.
```

Beyond the morning briefing, the system has four superpowers:

---

## The Four Superpowers

### 1. 1:1 Intelligence — Every Relationship, Always Current

Every person you work with has a living page in your vault. Before any meeting, type:

```
1on1 Sarah
```

In 30 seconds, Claude reads Sarah's page, pulls your last meeting notes, extracts her open action items, checks recent Slack and email between you, and generates a prep brief. You walk in knowing everything.

After the meeting, Granola captures the transcript. Claude reads it and:
- Adds notes to Sarah's page automatically
- Extracts action items (yours and hers)
- Adds the meeting to your daily digest
- Flags anything that needs follow-up

**Every 1:1 makes the relationship page smarter. Six months in, you have perfect institutional memory on every person you lead.**

---

### 2. Raw → Wiki — Any Document Becomes Permanent Knowledge

Drop anything into `3 Reference/Raw/`:
- A PDF someone sent
- A Confluence or Notion link
- A web article
- A Drive doc
- A meeting transcript
- A competitor analysis
- Your own rough notes

Then run:

```
wikify [filename]
```

Claude reads it, extracts what matters, and either creates a new wiki page in `3 Reference/Wiki/` or **appends new insights to an existing one** — it never overwrites. Every source you add makes every related page richer.

```
Month 1:  Drop 5 strategy docs → wikify → 5 wiki pages
Month 3:  Drop 10 more → each one updates and enriches existing pages
Month 6:  Ask Claude anything about your domain → answer already in the wiki
Year 1:   New team member reads your wiki → onboards in days, not months
```

**Your wiki compounds. Re-deriving the same knowledge from scratch becomes a thing of the past.**

---

### 3. Projects × Wiki — Context Flows Where Work Happens

Every project in `1 Projects/` can draw from your wiki automatically. When you run `deepdive [project name]`, Claude:

- Reads the project file
- Pulls all relevant wiki pages
- Checks related Jira tickets and Slack threads
- Queries connected data sources
- Returns A/B/C options with supporting context and a confidence level

Your wiki isn't just a reference — it's the context layer that makes every project decision sharper. The more you wikify, the better your project intelligence gets.

---

### 4. Team Meetings → Everywhere They Need to Go

When Granola captures a team meeting, Claude routes the content to every place it belongs:

```
Team standup transcript
    ├── → Daily digest (your morning note)
    ├── → Team standup log (running record)
    ├── → Relevant People pages (action items per person)
    └── → Project files (decisions and context)

1:1 transcript
    ├── → Daily digest
    ├── → Person's wiki page (notes + action items)
    └── → Tomorrow's prep (if follow-up needed)
```

Nothing falls through the cracks. No manual filing. The transcript lands once; Claude routes it everywhere.

---

## How It Works

Built on two proven patterns — extended with live data:

> **[PARA](https://fortelabs.com/blog/para/)** (Tiago Forte) — every piece of information has exactly one home: Projects, Areas, Reference, or Archive.

> **[LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)** (Andrej Karpathy) — instead of answering from raw documents, the AI *builds and maintains a wiki* from them. Knowledge compounds.

**Second Brain X adds live MCP connections** to Gmail, Slack, Jira, Calendar, Drive, and Granola — so your brain reflects what's happening *right now*.

```
Gmail · Slack · Calendar · Jira · Drive · Granola
              ↓  (MCP — no API keys)
     PARA Vault (local Obsidian markdown files)
     ┌─────────────────────────────────────┐
     │  3 Reference/Raw/   ← drop zone    │
     │         ↓  wikify                  │
     │  3 Reference/Wiki/  ← brain        │
     │         ↑                          │
     │  1 Projects/  ← draws from wiki   │
     │  5 People/    ← 1:1 intelligence  │
     └─────────────────────────────────────┘
              ↓  (Claude Code reads/writes)
   alfred · 1on1 · wikify · deepdive · ...
              ↓
  One daily note. Growing knowledge base.
```

---

## Install

### One line

```bash
curl -fsSL https://raw.githubusercontent.com/alipilehvar/second-brain/main/install.sh | bash
```

Open Claude Code in an empty folder and type:

```
setup-brain
```

A wizard asks 10 questions and builds your entire workspace in ~5 minutes.

### Claude Code Marketplace *(coming soon)*

```bash
claude plugin install second-brain
```

---

## Setup: 8 Steps

| Step | What to Do | Time |
|------|-----------|------|
| 1 | Download [Obsidian](https://obsidian.md) | 2 min |
| 2 | Download [Claude Code](https://claude.ai/code) | 5 min |
| 3 | Download [Granola](https://granola.so) → add your **work** email | 3 min |
| 4 | [claude.ai](https://claude.ai) → Settings → Integrations → connect Gmail, Slack, Jira, Granola | 10 min |
| 5 | In Claude Code, type `/mcp` to confirm tools are green | 1 min |
| 6 | Run install line above → type `setup-brain` → answer 10 questions | 10 min |
| 7 | Open folder in Obsidian → Settings → CSS Snippets → enable `folder-colors` | 2 min |
| 8 | Type `alfred` | 30 sec |

**Total: ~35 minutes. No coding required.**

> Not technical? See the [plain-English guide →](START-HERE-NON-TECHNICAL.md)

---

## Vault Structure

```
My Second Brain/
├── 1 Projects/        🔴  Active work — scored by priority (1–5)
│                          Each project can draw context from your Wiki
├── 2 Areas/           🔵  Ongoing responsibilities
│   ├── Role & Strategy/
│   ├── Team/
│   ├── Stakeholders/
│   └── Hiring/
├── 3 Reference/       🟢  All knowledge
│   ├── Raw/               Drop zone — any doc, link, note, transcript
│   └── Wiki/              AI-maintained knowledge graph
│                          Cumulative — appends, never overwrites
├── 4 Archives/        ⬜  Completed work — out of sight, fully searchable
├── 5 People/          🟣  One page per contact — your built-in CRM
│   ├── VIP/               Key stakeholders — surface first ⭐
│   └── Team/              Direct reports — surface second ⭐
├── 6 Reviews/         🟡  Daily notes · Weekly retros
├── 7 Reports/         🟠  Reports, data, periodic reviews (optional)
└── 8 [YOUR BRAIN]/    🩵  CLAUDE.md · Schema · Agents · Command Center
```

**The two most important folders:**

`Raw/` is your **inbox**. Anything lands here — docs, links, notes, meeting transcripts. Unprocessed.

`Wiki/` is your **brain**. Claude synthesizes Raw material into cumulative pages here. Every wikify operation appends new knowledge. Nothing is ever lost or overwritten.

---

## Commands

| Command | What It Does |
|---------|-------------|
| `alfred` | Morning briefing — email, calendar, Slack, Jira, meetings → one daily note |
| `1on1 [name]` | Pre-meeting brief: open items, last notes, recent comms — 30 seconds |
| `wikify [file]` | Synthesize any doc/link into your knowledge base (cumulative) |
| `deepdive [topic]` | Multi-source research using wiki + projects + live data → A/B/C recommendation |
| `email` | Triage inbox — VIPs first, drafts ready |
| `slack` | Triage DMs and @mentions — VIPs first |
| `jira` | Sprint board — team progress, blockers, what's due |
| `no [request]` | Help decline gracefully — classify, script, draft |
| `closeday` | EOD capture — ideas, follow-ups, tomorrow preloaded |
| `weekly` | Synthesize the week into one summary |
| `retro` | Leadership self-score + what to change next week |
| `clip [url]` | Save any link to Raw (fetches latest version on wikify) |
| `note [text]` | Quick capture → Raw |
| `person [name]` | Create or update a People page |
| `new [name] [1–5]` | Create a project with priority score |
| `status [project]` | One-paragraph update ready to share |
| `exec-brief [topic]` | 1-page brief: headline, 3 bullets, recommendation |
| `archive [name]` | Move to Archives with closure summary |
| `lint` | Vault health check — stale notes, broken links, unprocessed Raw |
| `tldr` | Summarize any doc in 5 bullets |

---

## The Compound Effect

```
Day 1   →  wikify one doc → 1 wiki page
Week 1  →  5 alfreds → carry-forward loop runs itself
            1on1 notes start building relationship history
Month 1 →  Wiki grows — every new source enriches existing pages
            Projects start drawing on wiki context automatically
Month 3 →  15+ wiki pages cross-referencing → knowledge graph
            1:1 prep takes 30 seconds instead of 10 minutes
Month 6 →  Ask any question about your domain → answer in your wiki
            Every meeting transcript routes itself to the right place
Year 1  →  New teammate reads your wiki → onboards in days, not months
            Your institutional knowledge survives turnover
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
| [Bootstrap Prompt](docs/bootstrap-prompt.md) | Paste directly into Claude Code — no plugin needed |
| [CLAUDE.md Template](CLAUDE.md.template) | Full operating manual with all rules |
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

*Built by [Ali Pilehvar](https://www.linkedin.com/in/alipilehvar/) · [Medium: AI & disruption](https://alipilevar.medium.com/)*
