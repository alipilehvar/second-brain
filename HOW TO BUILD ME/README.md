# Second Brain X — Build Your Own AI-Powered Work OS

> A PARA-based Obsidian vault + Claude Code system that turns your notes, emails, Slack, Jira, and calendar into a unified, AI-queryable second brain.

**Inspired by:** Tiago Forte's PARA method + Andrej Karpathy's LLM Wiki pattern
**Built with:** Obsidian + Claude Code + MCP servers
**Time to set up:** ~30 minutes

---

## What This System Does

| Layer | What It Is |
|-------|-----------|
| **Vault** | Obsidian markdown files organized by PARA |
| **Brain** | Claude Code reads/writes the vault via a custom CLAUDE.md |
| **Commands** | no prefixed slash commands for daily operations |
| **Agents** | Subagents for deep dives, anomalies, and synthesis |
| **Wiki** | Cumulative knowledge pages built from raw sources |
| **Connections** | Live MCP links to Gmail, Slack, Jira, Drive, Calendar |

---

## Files in This Folder

| File | What It Covers |
|------|---------------|
| [[00 Bootstrap Prompt]] | ⚡ **START HERE** — one prompt that builds everything automatically |
| [[01 Philosophy]] | Why PARA + LLM Wiki works |
| [[02 Prerequisites]] | Tools you need before starting |
| [[03 Folder Structure]] | The numbered 1-8 folder system explained |
| [[04 Schema Design]] | Frontmatter contracts for every note type |
| [[05 MCP Connections]] | Connecting Gmail, Slack, Jira, Drive, Calendar |
| [[06 CLAUDE.md Guide]] | How to write your vault operating manual |
| [[07 Commands Guide]] | Building your own `x-` skill commands |
| [[08 Agents Guide]] | Defining subagents (daily, anomaly, deepdive) |
| [[09 People System]] | Building a CRM inside your vault |
| [[10 Wiki System]] | Raw → Wiki synthesis flow |
| [[11 Daily Workflow]] | How to use this every morning |
| [[12 Customize For You]] | What to change to make it yours |
| [[13 GitHub Template]] | Publishing this as a reusable template |
| [[14 VS Code + Claude Code Workflow]] | Using VS Code + Claude Code CLI together; creating artifacts; replication guide |
| [[15 LLM Wiki - Comparison & What We Built]] | ⭐ Full comparison vs Karpathy's LLM Wiki gist — what this system implements + what it extends |
| [[16 HOW KNOW - Professional Second Brain]] | 🌐 **SHAREABLE GIST** — self-contained copy-paste guide, Karpathy-style. Share this with anyone. |
| [[17 HOW KNOW - GitHub Gist (Short)]] | ✂️ **SHORT VERSION** — GitHub-ready, ~250 lines. Copy-paste this into a Gist or README. |

---

## Quick Start (5 min — fully automated)

**Option A — One prompt, Claude builds everything:**
```
1. Create an empty folder on your computer
2. Open Claude Code in that folder: cd ~/Desktop/MyBrain && claude
3. Open HOW TO BUILD ME/00 Bootstrap Prompt.md
4. Copy the prompt block and paste it into Claude Code
5. Answer 10 questions — Claude builds the entire system
6. Open in Obsidian when done
```

**Option B — Manual build (full control):**
```
1. Install Obsidian + Claude Code
2. Clone this repo / copy folder structure
3. Connect MCP servers (see 05 MCP Connections)
4. Fill in your CLAUDE.md with your name, role, team
5. Run alfred on your first morning
```

---

## Architecture Overview

```
Raw Sources                  Vault (Obsidian)              Output
─────────────                ────────────────              ──────
Gmail          ──┐
Google Calendar──┤           PARA Folders                  Daily Digest
Slack          ──┤  MCPs →   + LLM Wiki        → Claude → Weekly Review
Jira           ──┤           + People CRM                  Deep Dives
Drive          ──┤           + Reviews                     Anomaly Alerts
Snowflake      ──┘           + Metrics                     Wiki Pages
```

---

## What Makes This World-Class

This system fully implements [Andrej Karpathy's LLM Wiki pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) — and extends it into a complete Work OS:

> **"PARA gives it structure. LLM Wiki gives it memory. MCP gives it live data. Together: a second brain that works."**

| Layer | Source | What It Adds |
|-------|--------|-------------|
| Organizational structure | Tiago Forte's PARA | Everything has one right place |
| Compounding knowledge | Karpathy's LLM Wiki | Wiki grows smarter with every ingest |
| Live data | MCP servers (Gmail/Slack/Jira/Drive) | Wiki reflects current reality, not just static docs |
| Operational cadence | `alfred` daily ritual | Forces the habit that makes the system self-sustaining |
| Business intelligence | Snowflake + WBR/MBR | Metrics layer connected to actual data warehouse |

→ Full comparison: `HOW TO BUILD ME/15 LLM Wiki - Comparison & What We Built.md`

---

## Credits
- PARA method by Tiago Forte (fortelabs.com)
- LLM Wiki pattern by Andrej Karpathy (gist.github.com/karpathy)
- Built with Claude Code by Anthropic
- Obsidian by Obsidian.md
