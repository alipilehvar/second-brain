# Second Brain X — Plugin

This folder contains the Claude Code plugin for Second Brain X.

## What This Plugin Does

Installs one command — `setup-brain` — into Claude Code globally.

When a user types `setup-brain`, Claude asks them 10 simple questions (name, role, company, team, key people, tools) and then builds their entire AI-powered second brain workspace automatically in about 5 minutes. No technical knowledge required.

## Files

| File | Purpose |
|------|---------|
| `manifest.json` | Plugin metadata — name, version, description, command list |
| `setup-brain.md` | The full setup wizard — Claude reads this and runs the 10-question interview + full build |

## Install

### One-line install (works today)

```bash
curl -fsSL https://raw.githubusercontent.com/alipilehvar/second-brain/main/install.sh | bash
```

This copies `setup-brain.md` to `~/.claude/commands/setup-brain.md` — making the `setup-brain` command available in any Claude Code session globally.

### Claude Code Marketplace (submission pending)

Once approved, users will be able to install with:

```bash
claude plugin install second-brain
```

Or from the Claude Code desktop app: **Settings → Plugins → Browse → "second-brain" → Install**

## How to Submit to the Claude Code Marketplace

1. Go to [claude.ai/code](https://claude.ai/code) → Settings → Plugins → "Submit a Plugin"
2. Provide the GitHub repo URL: `https://github.com/alipilehvar/second-brain`
3. The manifest.json in this folder is picked up automatically
4. Anthropic reviews and lists the plugin — then `claude plugin install second-brain` works globally

## For Anthropic Reviewers

**Plugin type:** Global skill command  
**Command added:** `setup-brain`  
**What it does:** Interactive wizard that builds a PARA-based Obsidian vault with 25 Claude Code commands, personalized CLAUDE.md, People CRM, and Wiki system. Based on Tiago Forte's PARA method + Andrej Karpathy's LLM Wiki pattern.  
**Data:** All data stays on the user's local machine. The wizard collects name/role/email/team to personalize the CLAUDE.md and vault — this is written to local files only, never sent externally.  
**MCP requirements:** Gmail, Google Calendar, Slack, Jira/Linear (all optional — the vault works without them, connections unlock additional commands)  
**No external API calls** from the plugin itself.
