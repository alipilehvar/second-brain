# 14 — VS Code + Claude Code Workflow

How to use VS Code as your vault editor alongside Claude Code CLI — creating wiki pages, editing commands, and building artifacts without leaving your code environment.

---

## Why VS Code + Claude Code Together

| Tool | Best For |
|------|----------|
| **Obsidian** | Reading, navigating, and viewing your vault (Dataview, graph view, daily notes) |
| **VS Code** | Editing markdown files, writing/editing command files, multi-file changes |
| **Claude Code CLI** | Running commands (`alfred`, `wikify`, etc.) from any terminal |
| **Claude Code VS Code Extension** | Chat + file edits inline while looking at your vault files |

You don't have to choose — use all four together.

---

## Setup

### 1. Open the Vault in VS Code

```bash
code ~/Desktop/"Ali X Vault"
```

Or: File → Open Folder → select `Ali X Vault`.

VS Code will show the full PARA folder structure in the sidebar. All `.md` files are editable directly.

### 2. Install Claude Code Extension (VS Code)

1. Open VS Code Extensions panel (`Cmd+Shift+X`)
2. Search **Claude Code** (Anthropic)
3. Install → it adds a Claude panel in the sidebar
4. Sign in with your Anthropic account

This gives you inline Claude chat + file edits without leaving VS Code.

### 3. Run Claude Code CLI from VS Code Terminal

Open integrated terminal: `Ctrl+\`` (backtick)

```bash
cd ~/Desktop/"Ali X Vault"
claude
```

Now you can type any vault command (`alfred`, `wikify Projects/segment-dive`, etc.) in the same window where you're editing files. Claude's edits show up instantly in the VS Code file tree.

---

## Creating Artifacts from VS Code

### Create a Wiki Page

1. Drop raw files into `3 Reference/Raw/` via Finder or VS Code Explorer
2. In Claude Code terminal: `wikify [filename]`
3. New wiki page appears in `3 Reference/Wiki/` — VS Code reloads it automatically

### Edit a Command File

Command files live in `.claude/commands/`. Open any `.md` file there in VS Code and edit directly. Changes take effect immediately — Claude Code reloads command files on each run.

### Build a New Command

1. In VS Code: right-click `.claude/commands/` → New File → `mycommand.md`
2. Write the instruction in markdown
3. In Claude Code terminal: type `mycommand` — it runs immediately
4. After testing, update `8 ALI'S BRAIN/Command Center.md` with the new entry

### Batch-Create Files

If you want Claude to generate multiple vault files at once (e.g., people pages, project stubs), just describe what you want in the Claude Code terminal. Claude creates files directly in the vault — you see them appear in VS Code's file tree in real time.

---

## Recommended VS Code Settings for Markdown Vaults

Install these extensions:
- **Markdown All in One** — table formatting, shortcuts
- **Markdown Preview Enhanced** — render wiki-style links
- **YAML** — frontmatter validation
- **GitLens** — see who changed what (useful for shared vaults)

Useful settings to add to VS Code `settings.json`:
```json
{
  "editor.wordWrap": "on",
  "files.associations": { "*.md": "markdown" },
  "markdown.preview.breaks": true,
  "[markdown]": {
    "editor.defaultFormatter": "yzhang.markdown-all-in-one"
  }
}
```

---

## Replication — Anyone Can Clone This System

> This section is for sharing the vault system with teammates. All personal data is excluded by `.gitignore`.

### What Is Shareable (Generic)

| What | Location | Contains Personal Data? |
|------|----------|------------------------|
| Folder structure | All PARA folders | ❌ No |
| Command files | `.claude/commands/*.md` | ❌ No |
| Wiki starter pages | `3 Reference/Wiki/Leadership OS.md`, `Say No Playbook.md` | ❌ No |
| HOW TO BUILD ME docs | `HOW TO BUILD ME/` | ❌ No |
| Schema | `8 ALI'S BRAIN/Schema.md` | ❌ No |
| CLAUDE.md | vault root | ❌ (personalize before sharing) |
| Agent specs | `8 ALI'S BRAIN/Agents/` | ❌ No |

### What Is Private (Never Share)

| What | Location |
|------|----------|
| About Ali | `8 ALI'S BRAIN/About Ali.md` |
| Memory | `8 ALI'S BRAIN/Memory.md` |
| Claude auto-memory | `~/.claude/projects/*/memory/` |
| People pages | `5 People/VIP/`, `5 People/Team/` |
| Daily/Weekly reviews | `6 Reviews/` |
| All metrics files | `7 Metrics & KPIs/WBR/`, `MBR/`, `QBR/`, `Anomalies/` |
| Raw drops | `3 Reference/Raw/` |
| Projects + Archives | `1 Projects/`, `4 Archives/` |
| Areas (personal docs) | `2 Areas/` |

All of the above are in `.gitignore` and will not be committed to GitHub.

### Steps for a Teammate to Replicate

```
1. Clone or copy the repo / template
2. Open the vault in Obsidian
3. Open same folder in VS Code: code ~/Desktop/"My Second Brain"
4. Open Claude Code: cd ~/Desktop/"My Second Brain" && claude
5. Run the bootstrap prompt (HOW TO BUILD ME/00 Bootstrap Prompt.md)
   → Claude will ask 10 questions and build the personalized layer
6. Connect MCPs at claude.ai → Settings → Integrations:
   Gmail, Calendar, Drive, Slack, Jira/Atlassian
7. Fill in 8 [THEIRNAME]'S BRAIN/About [Them].md
8. Run: alfred
```

Total setup time: ~15 minutes (excluding MCP auth).

---

## Changelog
- 2026-05-06: Created — covers VS Code + Claude Code CLI workflow, artifact creation, and replication instructions
