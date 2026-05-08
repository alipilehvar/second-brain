# 02 — Prerequisites

## Required Tools

### 1. Obsidian
- Download: https://obsidian.md
- Free for personal use
- Recommended plugins (install via Settings → Community Plugins):
  - **Dataview** — query your vault like a database (powers Home.md dashboards)
  - **Templater** — advanced templates for People, Projects
  - **Calendar** — visual daily notes navigation
  - **Periodic Notes** — weekly/monthly note generation

### 2. Claude Code
- Install: `npm install -g @anthropic-ai/claude-code`
- Requires Anthropic account with Claude Code access
- Docs: https://docs.anthropic.com/claude-code

### 3. Python 3 (for Snowflake, optional)
- Required only if connecting to Snowflake
- Install connector: `pip3 install snowflake-connector-python`

---

## MCP Connections (via claude.ai)

These connect Claude to your live data sources. Set up at **claude.ai → Settings → Integrations**:

| Integration | What It Enables |
|-------------|----------------|
| Gmail | Read/write emails, create drafts |
| Google Calendar | Read events, check availability |
| Google Drive | Read/write docs, fetch file content |
| Slack | Read channels, DMs, mentions |
| Jira / Confluence (Atlassian) | Read sprint boards, search tickets |

All of these are available as first-party integrations on claude.ai — no API keys needed.

---

## Optional

| Tool | Purpose |
|------|---------|
| Granola (granola.ai) | AI meeting note-taker — syncs transcripts to vault |
| Snowflake | Data warehouse queries via Python connector |
| Looker | BI dashboards — no native MCP, query via Snowflake instead |

---

## What You Don't Need
- Any coding experience
- A server or database
- Any paid Obsidian plugins
- API keys for Gmail/Slack/Jira (handled by claude.ai MCPs)
