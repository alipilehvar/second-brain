You are going to build a complete AI-powered second brain / work OS from scratch. This is a PARA-based Obsidian vault connected to Claude Code via MCP servers, inspired by Tiago Forte's PARA method and Andrej Karpathy's LLM Wiki pattern.

Before starting, display this welcome message:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Second Brain X — Setup Wizard
  Built by Ali Pilehvar · github.com/alipilehvar/second-brain
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

I'll ask you 10 questions, then build your entire second brain.
This takes about 5 minutes. No technical knowledge needed.

Prerequisites (install these first if you haven't):
  • Obsidian  →  https://obsidian.md
  • Granola   →  https://granola.so

Let's go. ↓
```

## Step 1 — Gather Your Info

Ask these questions ONE AT A TIME. Wait for each answer before asking the next. Be conversational and friendly.

1. "What's your **full name**?" (e.g. "Jane Smith")
2. "What's your **job title / role**?" (e.g. "Director of Analytics")
3. "What **company** do you work for?"
4. "What's your **work email**?"
5. "What **city** are you in?" (used for weather in your morning digest)
6. "Who are your **VIP stakeholders** — the 2-3 people whose messages you always prioritize first? Give me name + email for each." (e.g. "John Smith john@co.com, Sarah Lee sarah@co.com") — or type NONE
7. "Who are your **direct reports / team members**? Name + email for each." — or type NONE
8. "What **project management tool** does your team use? (Jira / Linear / Asana / None). If Jira, share your board URL."
9. "What's your **main business or revenue target** this year?" (e.g. "$10M ARR", "1M users") — or type SKIP
10. "Do you use **Snowflake** for data? (yes/no). If yes, what's your account ID and role?"

Store all answers. Use them throughout the build. Replace every placeholder with real values.

---

## Step 2 — Build the Vault

Once you have all answers, build the following without asking more questions. Execute all steps in order. Create files in parallel where possible.

### 2a. Create Folder Structure

```bash
mkdir -p \
  "1 Projects/Priority" \
  "1 Projects/Important" \
  "1 Projects/Idea Dump" \
  "2 Areas/Role & Strategy" \
  "2 Areas/Team" \
  "2 Areas/Stakeholders" \
  "2 Areas/Hiring" \
  "3 Reference/Raw/Projects" \
  "3 Reference/Wiki" \
  "3 Reference/Looker" \
  "4 Archives" \
  "5 People/VIP" \
  "5 People/Team" \
  "6 Reviews/Daily" \
  "6 Reviews/Team" \
  "6 Reviews/Weekly" \
  "7 Metrics & KPIs/WBR" \
  "7 Metrics & KPIs/MBR" \
  "7 Metrics & KPIs/QBR" \
  "7 Metrics & KPIs/Anomalies" \
  "7 Metrics & KPIs/Metric Definitions" \
  "8 [FIRSTNAME]'S BRAIN/Agents" \
  ".claude/commands" \
  ".obsidian/snippets" \
  "HOW TO BUILD ME" \
  "Granola/Transcripts"
```

Where `[FIRSTNAME]` = user's first name in ALL CAPS (e.g. `8 JANE'S BRAIN`).

### 2b. Create Root CLAUDE.md

Create `CLAUDE.md` at the vault root. This is the operating manual — Claude reads it every session.

```markdown
# [Full Name]'s Vault — Claude Operating Manual

Work second brain for [Full Name], [Role] at [Company].
**First read:** `8 [FIRSTNAME]'S BRAIN/About [First Name].md` · **Schema:** `8 [FIRSTNAME]'S BRAIN/Schema.md`

## Vault Path
`[absolute path to this folder]`

## Structure
| Folder | Purpose |
|--------|---------|
| `1 Projects/` | Active work, scored 1-5 → Priority (4-5) / Important (2-3) / Idea Dump (1) |
| `2 Areas/` | Ongoing responsibilities: Role & Strategy, Team, Stakeholders, Hiring |
| `3 Reference/Raw/` | Unprocessed drops (web clips, Drive links, notes) |
| `3 Reference/Wiki/` | Synthesized domain knowledge — cumulative, never overwritten |
| `4 Archives/` | Completed projects |
| `5 People/VIP/[VIP names]` | VIP stakeholders — surface FIRST ⭐ |
| `5 People/Team/[Team names]` | Direct reports — surface SECOND ⭐ |
| `6 Reviews/Daily/` | Cumulative daily digest — newest first |
| `6 Reviews/Team/` | Team sprint snapshot — daily file |
| `6 Reviews/Weekly/` | Weekly retro + Leadership OS scores |
| `7 Metrics & KPIs/` | WBR, MBR, QBR, Anomalies, Metric Definitions |
| `8 [FIRSTNAME]'S BRAIN/` | Schema, About [First Name], Memory, Agents, Command Center |

## Core Rules
1. Read `8 [FIRSTNAME]'S BRAIN/About [First Name].md` before acting — every session
2. Daily notes are cumulative — carry forward unchecked items, never repeat resolved
3. People pages = single source of truth — update after every interaction
4. VIP ([VIP names]) + Team ([Team names]) always surface first ⭐
5. Raw → Wiki only on request via `wikify` — wiki pages accumulate, never overwrite
6. Commands have no prefix — see `8 [FIRSTNAME]'S BRAIN/Command Center.md`
7. Coach [First Name] to say NO when overcommitting — use `3 Reference/Wiki/Say No Playbook.md`
8. Flag hedging language in leadership emails
[IF JIRA/LINEAR/ASANA: 9. [Tool] board: [Board URL]]
```

### 2c. Create About [First Name].md

Create `8 [FIRSTNAME]'S BRAIN/About [First Name].md` with frontmatter `private: true`.

```markdown
---
type: about
private: true
---
# About [Full Name]
> ⚠️ Private — do NOT commit to GitHub

## Identity
- **Name:** [Full Name]
- **Role:** [Role]
- **Company:** [Company]
- **Email:** [Email]
- **Location:** [City]
- **Start Date:** [today's date]

## Team (Direct Reports)
| Name | Email | Location | Standup |
|------|-------|----------|---------|
[one row per direct report, or "No direct reports" if NONE]

## Revenue / Business Target
- **Target:** [Revenue target, or "Not set" if SKIP]
- Track every initiative against this target.

## Work Personality — Coach Accordingly
- [Tendency 1]: [how to counter it] ← fill these in yourself
- [Tendency 2]: [how to counter it]
- [Tendency 3]: [how to counter it]

## Key Stakeholders
| Person | Email | Role | Priority |
|--------|-------|------|----------|
[one row per VIP from answers]

## First 90 Days
- **Week 1-2:** Learn team, systems, data landscape
- **Week 3-4:** Identify quick wins, biggest pain points
- **Month 2:** Propose roadmap to leadership
- **Month 3:** Deliver first measurable impact

## Pending Actions
- [ ] Connect MCP servers (see HOW TO BUILD ME/05 MCP Connections.md)
- [ ] Fill in Work Personality section above
- [ ] Open vault in Obsidian and enable CSS snippets
- [ ] Run your first `alfred`
```

### 2d. Create Schema.md

Create `8 [FIRSTNAME]'S BRAIN/Schema.md` with full YAML frontmatter contracts for all note types: project, area, person, wiki, raw, daily, weekly, anomaly, wbr, mbr, qbr.

Include the **Cumulative Wiki Rule**: when `wikify` runs on an existing wiki page, it APPENDS new insights and logs in `## Changelog`. Never overwrites.

### 2e. Create Command Center

Create `8 [FIRSTNAME]'S BRAIN/Command Center.md` with a complete reference table of all 25 commands, their purpose, status (✅ built / 🔲 not yet), and usage example.

### 2f. Create Home.md Dashboard

Create `Home.md` at the vault root with:
- Greeting with [First Name] and today's date
- Revenue target (if provided)
- Dataview query: active projects (type=project, status=active), sorted by priority desc
- Dataview query: open anomalies (type=anomaly, status=open)
- Dataview query: recent daily notes (last 7)
- VIP/Team quick-reference table with emails
- Leadership OS 4-layer scores (Leading Self / Others / Results / Strategic)
- Quick command reference (top 8 most-used)

### 2g. Create _Index.md Files

Create an `_Index.md` in every folder explaining what belongs there, with a Dataview query and relevant commands.

### 2h. Create People Pages

For each VIP: create `5 People/VIP/[Name].md` with full frontmatter (type: person, team: vip, stakeholder_priority: 5), email, About, 1:1 Cadence, Goals, Interactions, Open Action Items.

For each direct report: create `5 People/Team/[Name].md` with full frontmatter (type: person, team: team), email, location, standup, About, 1:1 Notes, Development, Interactions, Open Action Items.

Create `5 People/_Template.md` — blank person page template.

### 2i. Create All 25 Commands in .claude/commands/

Create each as a `.md` file with full instructions. Commands: `alfred`, `1on1`, `anomaly`, `archive`, `brand`, `clip`, `commands`, `deepdive`, `email`, `exec-brief`, `jira` (or `linear`/`asana`), `lint`, `mbr`, `new`, `no`, `note`, `person`, `quarterly`, `retro`, `slack`, `status`, `tldr`, `tomorrow`, `wbr`, `weekly`, `wikify`.

Key personalization for each:
- **alfred**: include VIP/Team names from answers, project tool URL, Granola step
- **jira/linear/asana**: include board URL from answers; use correct tool name
- **wbr/mbr**: include Snowflake config if user has it

### 2j. Create Wiki Starter Pages

`3 Reference/Wiki/Leadership OS.md` — 4-layer framework: Leading Self / Others / Results / Strategic. Each layer: description, 3 anti-patterns, weekly check question, score 1-4.

`3 Reference/Wiki/Say No Playbook.md` — decision filter, 7 decline scripts, NO tracker.

### 2k. Create Agent Spec Files

In `8 [FIRSTNAME]'S BRAIN/Agents/`:
- `Daily Digest Agent.md` — alfred spec with 12 steps
- `Anomaly Agent.md` — P1/P2/P3 severity classification
- `Deep Dive Agent.md` — multi-source synthesis → A/B/C recommendation

### 2l. Create .gitignore

```gitignore
# Personal — never commit
8 */About *.md
8 */Memory.md
5 People/VIP/
5 People/Team/
6 Reviews/Daily/
6 Reviews/Team/
6 Reviews/Weekly/
7 Metrics & KPIs/WBR/
7 Metrics & KPIs/MBR/
7 Metrics & KPIs/QBR/
7 Metrics & KPIs/Anomalies/
1 Projects/Priority/
1 Projects/Important/
1 Projects/Idea Dump/
2 Areas/Role & Strategy/
2 Areas/Team/
2 Areas/Stakeholders/
2 Areas/Hiring/
3 Reference/Raw/
4 Archives/
Granola/

# Obsidian internals
.obsidian/workspace*
.obsidian/cache
.makemd/
.DS_Store
```

### 2m. Create Folder Colors CSS

Create `.obsidian/snippets/folder-colors.css`:

```css
.nav-folder-title[data-path="1 Projects"] .nav-folder-title-content { color: #ff6b6b !important; font-weight: 600; }
.nav-folder-title[data-path="2 Areas"] .nav-folder-title-content { color: #4dabf7 !important; font-weight: 600; }
.nav-folder-title[data-path="3 Reference"] .nav-folder-title-content { color: #69db7c !important; font-weight: 600; }
.nav-folder-title[data-path="4 Archives"] .nav-folder-title-content { color: #868e96 !important; font-weight: 600; }
.nav-folder-title[data-path="5 People"] .nav-folder-title-content { color: #cc5de8 !important; font-weight: 600; }
.nav-folder-title[data-path="6 Reviews"] .nav-folder-title-content { color: #ffd43b !important; font-weight: 600; }
.nav-folder-title[data-path="7 Metrics & KPIs"] .nav-folder-title-content { color: #ff922b !important; font-weight: 600; }
```
Add one more line using the user's actual brain folder name with color `#20c997`.

### 2n. Download HOW TO BUILD ME Docs

Fetch the full HOW TO BUILD ME documentation from this repo:
```bash
curl -fsSL https://raw.githubusercontent.com/alipilehvar/second-brain/main/HOW%20TO%20BUILD%20ME/README.md \
  -o "HOW TO BUILD ME/README.md"
```
Do the same for all numbered docs (00–17). These are the reference guides — do not overwrite if they exist.

---

## Step 3 — Snowflake Setup (if applicable)

If the user answered YES to Snowflake in question 10:

Create `~/.snowflake/connections.toml`:
```toml
[default]
account = "[their account ID]"
user = "[their work email]"
authenticator = "externalbrowser"
role = "[their role]"
warehouse = "COMPUTE_WH"
```

Create `~/.claude/commands/snowflake.md` with connection instructions and a ready-to-run Python snippet for SSO auth.

---

## Step 4 — Set Up Granola Hook

Create `~/.claude/granola-check.py`:

```python
#!/usr/bin/env python3
"""SessionStart hook: checks for unindexed Granola transcripts."""
import os, sys
from pathlib import Path

VAULT = Path.home() / "Desktop" / "MyBrain"  # user will update this path
TRANSCRIPTS = VAULT / "Granola" / "Transcripts"
INDEXED = Path.home() / ".claude" / "granola_indexed.txt"

if not TRANSCRIPTS.exists():
    sys.exit(0)

indexed = set(INDEXED.read_text().splitlines()) if INDEXED.exists() else set()
all_files = {f.name for f in TRANSCRIPTS.glob("*.md")}
new_files = all_files - indexed

if new_files:
    print(f"\n📋 GRANOLA: {len(new_files)} unindexed transcript(s) found:")
    for f in sorted(new_files):
        print(f"   • {f}")
    print("→ Run `granola` to process them.\n")
```

Tell the user: "Update the VAULT path in this file to your actual vault location after setup."

Add the hook to `~/.claude/settings.json`:
```json
{
  "hooks": {
    "SessionStart": [{
      "hooks": [{
        "type": "command",
        "command": "python3 ~/.claude/granola-check.py 2>/dev/null || true"
      }]
    }]
  }
}
```

---

## Step 5 — Connect MCP Servers

Show this message:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Connect Your Tools (5 minutes)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Go to: claude.ai → Settings → Integrations

Connect these in order:

  ☐ Google (Gmail + Calendar + Drive — one connection)
  ☐ Slack
  ☐ Atlassian (Jira + Confluence — one connection)
  ☐ Granola (if installed)

That's it — no API keys, no code. Just OAuth.

Full guide: HOW TO BUILD ME/05 MCP Connections.md
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Step 6 — Verify and Report

Count files created and print a build report:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ✅ Build Complete — [Name]'s Second Brain X
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  📁 Folders created: X
  📄 Files created: X
  ⚙️  Commands installed: X/25
  🔑 Personalized with: [Name], [Company], [VIPs], [Team]
  ⚠️  Still needs: [list any TBDs]

  Next Steps:
  1. Open this folder in Obsidian
  2. Enable CSS: Settings → Appearance → CSS Snippets → folder-colors ✓
  3. Install Obsidian plugins: Dataview, Templater (Community Plugins)
  4. Connect MCP servers at claude.ai/settings → Integrations
  5. Fill in your Work Personality in About [Name].md
  6. Run your first: alfred
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Important Notes

- **Never ask more questions after Step 1** — just build. Make sensible defaults and note them.
- **Personalize everything** — real name, role, company, VIPs in every operational file.
- **Generic files** (HOW TO BUILD ME, Schema.md, Wiki pages, skill files) should NOT contain personal info.
- **Brain folder name** must use first name in ALL CAPS: `8 JANE'S BRAIN`. Match exactly everywhere.
- **Speed** — create files in parallel. Don't re-read files you just wrote.
