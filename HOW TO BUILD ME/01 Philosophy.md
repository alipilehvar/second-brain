# 01 — Philosophy: Why PARA + LLM Wiki

## The Problem This Solves

Modern knowledge workers drown in tools:
- Email (Gmail/Outlook) — action items buried in threads
- Slack — decisions lost in channels
- Jira — ticket context disconnected from strategy
- Notion/Confluence — docs that go stale
- Calendar — no link between meetings and outcomes
- Notes — siloed, never retrieved

**The result:** You spend mental energy remembering where things are instead of thinking about what matters.

---

## The PARA Framework (Tiago Forte)

Organize everything into exactly 4 categories:

| Category | Definition | Example |
|----------|-----------|---------|
| **Projects** | Has a goal + deadline | "Launch data pipeline v2 by June 1" |
| **Areas** | Ongoing responsibility, no end date | "Team management", "My role" |
| **Resources** | Reference by topic | "Snowflake architecture", "Brand guidelines" |
| **Archives** | Inactive items | Completed projects, old areas |

**Why it works:** Everything you ever need to file has exactly one right place. No duplicates. No "should this go in Projects or Areas?"

---

## The LLM Wiki Pattern (Andrej Karpathy)

Traditional wikis are written once and go stale. LLM Wiki pages are:

1. **Seeded from raw sources** — paste a doc, link a Drive file, drop a transcript
2. **Synthesized by AI** — Claude reads raw material and writes the wiki page
3. **Cumulative** — each new source *appends* to the existing page, never overwrites
4. **Queryable** — ask Claude "what did we decide about X?" and it searches the wiki

**The key insight:** You don't write the wiki. You feed it raw material and the LLM builds the knowledge graph for you.

---

## Why Claude Code + Obsidian

| Tool | Role |
|------|------|
| **Obsidian** | Local markdown vault — your files, your control, offline-first |
| **Claude Code** | AI that reads/writes your vault + connects to live data sources |
| **MCP servers** | Bridge between Claude and Gmail, Slack, Jira, Drive, Calendar |
| **CLAUDE.md** | Your vault's operating manual — tells Claude the rules |
| **`x-` skills** | Slash commands that trigger specific multi-step workflows |

**The philosophy:** Your vault is a database. Claude is the query engine. MCP servers are the data pipelines. CLAUDE.md is the schema.

---

## Design Principles

1. **Two readers** — every note is written for humans (you in Obsidian) and AI (Claude). Consistent frontmatter serves both.
2. **Cumulative not overwriting** — knowledge compounds. Never delete, only append and refine.
3. **Single source of truth** — one People page per person, one Project page per project. No duplicates.
4. **Separation of concerns** — personal config (About Me, Memory) is gitignored. Generic structure is shareable.
5. **Commands, not conversations** — `alfred` does 10 steps in one command. You shouldn't need to explain what you want every morning.

---

## Why This Is World-Class

This system fully implements Andrej Karpathy's LLM Wiki pattern — and extends it into a complete Work OS.

**Karpathy's insight:** An LLM should *build and maintain* a compounding knowledge graph, not just answer questions from raw documents. The wiki gets smarter every time you feed it a new source — because knowledge accumulates instead of being re-derived each time.

**What this system adds on top:**
- **Live data** — the wiki grows from real email, Slack, meetings, and Jira (not just static docs)
- **PARA structure** — everything has exactly one right place; no filing paralysis
- **People CRM** — every stakeholder interaction is remembered and surfaced in 1:1 prep
- **Operational cadence** — `alfred` forces the daily ritual that makes the system self-sustaining
- **Business metrics** — WBR/MBR/anomaly detection connected to Snowflake

The compound effect: after 6 months, asking any question about your domain pulls from a rich, interconnected knowledge graph built automatically from your daily work. New team members onboard from the wiki in days, not months.

> See `HOW TO BUILD ME/15 LLM Wiki - Comparison & What We Built.md` for the full technical comparison.
