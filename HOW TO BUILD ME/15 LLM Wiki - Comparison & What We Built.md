# 15 — LLM Wiki Pattern: What We Built vs. Karpathy's Original

> Reference: [Andrej Karpathy's LLM Wiki gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
>
> **Bottom line:** We implement the full Karpathy LLM Wiki pattern — and extend it with a live-data operational layer that Karpathy's original does not include. This is a new category: **Work OS + LLM Wiki**, not just a knowledge base.

---

## Karpathy's Original Pattern

Karpathy proposed treating an LLM as a **wiki maintainer** rather than a retrieval system. Instead of RAG (repeatedly querying raw documents), the LLM builds a persistent, interconnected markdown wiki that compounds over time.

### Three-Layer Architecture

```
Raw Sources  →  Wiki Layer  →  Schema Layer
(immutable)     (LLM-owned)    (CLAUDE.md)
```

### Three Core Operations

| Operation | What It Does |
|-----------|-------------|
| **Ingest** | Read raw source → extract knowledge → write/append wiki page → update cross-references → log it |
| **Query** | Answer questions from existing wiki → optionally file answers back as new pages |
| **Lint** | Health check: contradictions, orphaned pages, missing cross-refs, stale claims |

### Supporting Infrastructure
- `Index.md` — catalog of all wiki pages
- `Log.md` — append-only chronological record of all operations

---

## What This Vault Implements (Full Compliance)

| Karpathy Principle | This Vault |
|-------------------|------------|
| Raw Sources layer — immutable, LLM reads only | `3 Reference/Raw/` — drop zone, Claude never edits source files |
| Wiki layer — LLM-owned, cumulative markdown | `3 Reference/Wiki/` — `wikify` command, never overwrites |
| Schema layer — operating manual | `CLAUDE.md` + `8 [NAME]'S BRAIN/Schema.md` |
| Ingest operation | `wikify` command — reads raw, synthesizes, appends, logs |
| Query operation | Any Claude question → answer fileable via `note` + `wikify` |
| Lint operation | `lint` command — orphans, contradictions, missing cross-refs, stale pages |
| `Index.md` | `3 Reference/Wiki/_Index.md` — categorized catalog |
| `Log.md` | `3 Reference/Wiki/Log.md` — append-only, new entries at top |
| Cross-references | `related:` frontmatter on every wiki page |
| `## Changelog` per page | Every wiki page has cumulative changelog |

---

## Where We Go Further: The Extensions

This is where the system becomes a **Work OS**, not just a knowledge base.

### Extension 1 — Live Data MCP Layer

Karpathy's pattern ingests **static documents** (PDFs, articles, notes). This vault ingests **live data sources** in real time:

| Source | MCP Connection | What Gets Wikified |
|--------|---------------|-------------------|
| Gmail | Google Gmail MCP | Action items → daily note; decisions → wiki |
| Google Calendar | Google Calendar MCP | Meeting context → 1:1 prep, tomorrow planning |
| Slack | Slack MCP | Channel discussions → wiki, anomaly detection |
| Jira | Atlassian MCP | Sprint data → WBR, weekly review, team snapshot |
| Google Drive | Google Drive MCP | Live docs → wiki (always fetches latest version) |
| Granola | Granola MCP | Meeting transcripts → daily note, action items |
| Snowflake | Python connector | Business metrics → WBR, MBR, anomaly detection |

**Implication:** The wiki doesn't just accumulate static knowledge. It reflects the current state of the business, updated every morning via `alfred`.

### Extension 2 — PARA Organizational Layer

Karpathy's wiki is a flat knowledge graph. This vault adds **PARA** (Tiago Forte) as the organizational skeleton:

```
1 Projects/   — Active work with goals + deadlines (scored 1-5 by priority)
2 Areas/      — Ongoing responsibilities (role, team, stakeholders, hiring)
3 Reference/  — Raw (inbox) + Wiki (synthesized) — the LLM Wiki lives here
4 Archives/   — Completed work
```

**Implication:** The LLM Wiki isn't siloed — it's connected to active projects, people, and strategy. A wiki page about an ad stack architecture links to the project tracking the ROI redesign (#4 on the roadmap).

### Extension 3 — People CRM Layer

Every person you interact with gets a page in `5 People/`. It accumulates:
- Role, email, relationship context
- Every interaction (1:1 notes, decisions, commitments)
- Open action items
- Development notes (for direct reports)

`1on1 [name]` reads the People page + recent Slack/email → generates prep brief in seconds. This is relationship memory — Karpathy's pattern doesn't include it.

### Extension 4 — Operational Cadence Layer

A knowledge base you never check is useless. This vault forces a daily ritual:

```
alfred  →  12-step morning briefing (email + calendar + slack + jira + carry-overs)
tomorrow →  end-of-day planning (tomorrow's calendar + time-boxing + top 3)
weekly   →  weekly synthesis (all daily notes + sprint → wins/carry-overs/blockers)
retro    →  leadership self-score (Leadership OS 4 layers)
```

**Implication:** The vault is alive. It's checked every morning, updated every evening. The wiki compounds because new raw material flows in daily through `alfred`.

### Extension 5 — Metrics & Business Intelligence Layer

Karpathy's pattern is personal knowledge management. This vault adds a business performance layer:

```
7 Metrics & KPIs/
├── WBR/        Weekly Business Reviews (Snowflake data)
├── MBR/        Monthly Business Reviews
├── QBR/        Quarterly Business Reviews
└── Anomalies/  Flagged metric anomalies (P1/P2/P3)
```

`wbr` → queries Snowflake → synthesizes weekly metrics → saves to `WBR/YYYY-WNN.md`
`anomaly [metric drop]` → investigates, classifies severity, saves to `Anomalies/`

### Extension 6 — Leadership Coaching Layer

The vault coaches behavior, not just stores knowledge:
- `no` command — helps decline requests using Say No Playbook
- `retro` — weekly Leadership OS self-scoring (1-4 per layer)
- `alfred` — flags overloaded calendar (6+ meetings = intervention)
- `1on1` — prepares SBI feedback drafts for direct reports
- Every daily note closes with a Leadership OS nudge

---

## The Compound Effect

Here's what makes this system different from a folder of markdown files:

```
Day 1:   Drop a doc → wikify → 1 wiki page
Week 1:  5 days of alfred → 5 daily notes → carry-forward loop established
Month 1: 4 WBRs → pattern recognition → anomaly baseline forming
Month 3: 10+ wiki pages cross-referencing each other → knowledge graph
Month 6: Ask any question about your domain → answer is already in the wiki
Year 1:  New team member → onboard from wiki → 6-month ramp → 2-week ramp
```

The system pays back compoundingly. The first week is overhead. Month 6 is leverage.

---

## Comparison Table: Karpathy vs. This System

| Capability | Karpathy LLM Wiki | This System |
|-----------|-------------------|-------------|
| Raw → Wiki synthesis | ✅ | ✅ |
| Cumulative (never overwrite) | ✅ | ✅ |
| Cross-references | ✅ | ✅ |
| Index + Log | ✅ | ✅ |
| Lint (contradictions, orphans) | ✅ | ✅ |
| Live data sources (email, Slack, Jira) | ❌ | ✅ |
| PARA organizational structure | ❌ | ✅ |
| People CRM | ❌ | ✅ |
| Daily operational cadence | ❌ | ✅ |
| Business metrics layer (WBR/MBR) | ❌ | ✅ |
| Leadership coaching | ❌ | ✅ |
| Team management (1:1s, sprint) | ❌ | ✅ |
| 25+ domain-specific commands | ❌ | ✅ |
| Bootstrap prompt (anyone can replicate) | ❌ | ✅ |
| GitHub template (shareable) | ❌ | ✅ |

---

## How to Describe This System

> "It's Andrej Karpathy's LLM Wiki pattern — the idea that an AI should build and maintain a compounding knowledge graph rather than just answer questions — combined with Tiago Forte's PARA method for organizing everything into four clean buckets, and layered with live MCP connections to Gmail, Slack, Jira, Drive, and Snowflake. The result is a work OS that gets smarter every day: your wiki grows from real documents and real meetings, your daily briefing pulls from actual email and calendar, and every interaction with a stakeholder is remembered and surfaced when you need it."

Or shorter:

> "PARA gives it structure. LLM Wiki gives it memory. MCP gives it live data. Together: a second brain that works."

---

## Changelog
- 2026-05-06: Created — full comparison of this system vs Karpathy's LLM Wiki gist
