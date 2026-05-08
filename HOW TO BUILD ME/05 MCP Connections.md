# 05 — MCP Connections

MCP (Model Context Protocol) servers give Claude live access to your tools — no API keys, no code.

## Setup (5 minutes)

1. Go to **claude.ai → Settings → Integrations**
2. Connect each service with your work account:
   - Google (Gmail + Calendar + Drive — one connection)
   - Slack
   - Atlassian (Jira + Confluence — one connection)

That's it. Claude Code in any session will have access to all connected tools.

## What Each Connection Enables

### Gmail
- Read emails and threads
- Search by sender, date, keyword
- Create drafts
- Label/organize threads

### Google Calendar
- Read today's and future events
- Check availability
- Get attendee lists

### Google Drive
- Read any doc/sheet/slide you have access to
- Fetch latest version of a linked file
- Create and update files
- `clip [Drive URL]` uses this — no download needed

### Slack
- Read channel messages and DMs
- Search across channels
- Send messages and drafts
- Look up user profiles

### Jira / Confluence (Atlassian)
- Read sprint boards and tickets
- Search issues by JQL
- Read Confluence pages
- Add comments

## Snowflake (Optional, requires Python)

```bash
pip3 install snowflake-connector-python
mkdir -p ~/.snowflake
```

Create `~/.snowflake/connections.toml`:
```toml
[default]
account = "YOUR-ACCOUNT-ID"
user = "YOUR.EMAIL@COMPANY.COM"
authenticator = "externalbrowser"   # SSO
role = "YOUR_ROLE"
warehouse = "YOUR_WAREHOUSE"
```

Then add `/snowflake` global skill at `~/.claude/commands/snowflake.md` — see the global skills section.

## Looker

No native MCP exists. Workarounds:
1. Query Snowflake directly for the same underlying data
2. Export Looker → Google Drive → `clip [link]`
3. Build a custom MCP using Looker REST API (advanced)

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Atlassian disconnected mid-session | Start a new Claude Code session — MCPs reconnect automatically |
| Gmail not finding emails | Check the search query syntax (`newer_than:1d`, `from:x@y.com`) |
| Drive file access denied | Confirm the file is shared with your connected Google account |
| Snowflake SSO popup | Browser must open — check pop-up blockers |
