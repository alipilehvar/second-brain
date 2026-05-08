# 00 — Bootstrap Prompt (Run This in Claude Code)

> Copy the prompt below and paste it into Claude Code in an **empty folder** where you want your vault to live.
> Claude will ask you 10 questions, then build the entire system and optionally publish it to GitHub.
> No technical knowledge required.

---

## How to Run

1. Create an empty folder on your computer (e.g. `~/Desktop/My Second Brain/`)
2. Open Claude Code in that folder: `cd ~/Desktop/My\ Second\ Brain && claude`
3. Copy everything inside the `---PROMPT START---` / `---PROMPT END---` block below
4. Paste it into Claude Code and press Enter
5. Answer the questions Claude asks
6. Wait ~5 minutes while Claude builds everything

That's it. When it finishes, open the folder in Obsidian.

---

---PROMPT START---

You are going to build me a complete AI-powered second brain / work OS from scratch. This is a PARA-based Obsidian vault connected to Claude Code via MCP servers, inspired by Tiago Forte's PARA method and Andrej Karpathy's LLM Wiki pattern.

## Step 1 — Gather My Info

Before building anything, ask me these questions one at a time. Wait for each answer before asking the next:

1. What is your **full name**? (e.g. "Jane Smith")
2. What is your **job title / role**? (e.g. "Director of Product")
3. What **company** do you work for? (e.g. "Acme Corp")
4. What is your **work email**? (e.g. jane@acme.com)
5. What **city** are you in? (for weather in daily digest)
6. Who are your **VIP stakeholders**? List name + email, comma-separated. These surface FIRST in every digest. (e.g. "John Smith john@acme.com, Sarah Lee sarah@acme.com")
7. Who are your **direct reports / team**? List name + email, comma-separated. (e.g. "Tom Jones tom@acme.com, Ana Rios ana@acme.com") — or type NONE
8. What **project management tool** does your team use? (Jira / Linear / Asana / None)
   - If Jira: what is your board URL? (e.g. https://company.atlassian.net/jira/software/projects/TEAM/boards)
9. What is your **main revenue or business target** this year? (e.g. "$10M ARR" or "1M users") — or type SKIP
10. Do you want me to **publish to GitHub** when done? (yes/no)
    - If yes: what should the GitHub repo name be? (e.g. "my-second-brain")

Store all answers in memory. Use them throughout the build. Replace every `[YOUR NAME]`, `[YOUR ROLE]`, etc. placeholder with the actual values.

---

## Step 2 — Build the Vault

Once you have all answers, build the following without asking more questions. Execute all steps in order.

### 2a. Create Folder Structure

Create these folders (use `mkdir -p`):
```
1 Projects/Priority/
1 Projects/Important/
1 Projects/Idea Dump/
2 Areas/Role & Strategy/
2 Areas/Team/
2 Areas/Stakeholders/
2 Areas/Hiring/
3 Reference/Raw/Projects/
3 Reference/Wiki/
3 Reference/Looker/
4 Archives/
5 People/VIP/
5 People/Team/
6 Reviews/Daily/
6 Reviews/Team/
6 Reviews/Weekly/
7 Metrics & KPIs/WBR/
7 Metrics & KPIs/MBR/
7 Metrics & KPIs/QBR/
7 Metrics & KPIs/Anomalies/
7 Metrics & KPIs/Metric Definitions/
8 [NAME]'S BRAIN/Agents/
.claude/commands/
.obsidian/snippets/
HOW TO BUILD ME/
```
Where `[NAME]` = the user's first name in ALL CAPS (e.g. `8 JANE'S BRAIN`).

### 2b. Create Root CLAUDE.md

Create `CLAUDE.md` at the vault root. This is the operating manual — Claude Code reads it every session. Include:

```markdown
# [Name]'s Vault — Claude Operating Manual

Work second brain for [Full Name], [Role] at [Company].
**First read:** `8 [NAME]'S BRAIN/About [Name].md` · **Schema:** `8 [NAME]'S BRAIN/Schema.md`

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
| `5 People/VIP/` | [VIP names] — surface FIRST ⭐ |
| `5 People/Team/` | [Team names] — surface SECOND ⭐ |
| `6 Reviews/Daily/` | Cumulative daily digest (new + open carry-forwards only) |
| `6 Reviews/Team/` | Team sprint snapshot — separate daily file |
| `6 Reviews/Weekly/` | Weekly retro + Leadership OS scores |
| `7 Metrics & KPIs/` | WBR, MBR, QBR, Anomalies, Metric Definitions (SSOT) |
| `8 [NAME]'S BRAIN/` | Schema, About [Name], Memory, Agents, Command Center |

## Core Rules
1. Read `8 [NAME]'S BRAIN/About [Name].md` before acting — every session
2. Daily notes are cumulative — carry forward unchecked items, never repeat resolved
3. People pages = single source of truth — update after every interaction
4. VIP ([VIP names]) + Team ([Team names]) always surface first ⭐
5. Raw → Wiki only on request via `wikify` — wiki pages accumulate, never overwrite
6. All commands use no prefix — see `8 [NAME]'S BRAIN/Command Center.md`
7. Coach [Name] to say NO when overcommitting. Use `3 Reference/Wiki/Say No Playbook.md`
8. Flag hedging language in leadership emails
[IF JIRA: 9. [Tool] board: [Board URL]]
```

### 2c. Create About [Name].md

Create `8 [NAME]'S BRAIN/About [Name].md` with frontmatter `private: true`. Populate with all the user's info from Step 1. Include sections:
- Identity (name, role, company, email, location)
- Team (direct reports table: Name | Email | Location | Standup)
- Revenue Target (if provided)
- Work Personality — Coach Accordingly (leave as TBD placeholders for user to fill)
- Key Stakeholders (VIPs from answers, boss = TBD)
- First 90 Days (week 1-2 through month 3 framework)

Add a note at top: `> ⚠️ Private — do NOT include in GitHub template`

### 2d. Create Schema.md

Create `8 [NAME]'S BRAIN/Schema.md` with full YAML frontmatter contracts for:
- `type: project` — title, area, status (active/complete/paused), priority (1-5), next_action, due, revenue_impact
- `type: area` — title, description, tags
- `type: person` — name, role, org, team (vip/team/peer), stakeholder, stakeholder_priority, last_contact, tags
- `type: wiki` — title, domain, sources (array), drive_link (optional), processed, tags
- `type: raw` — title, source_type, url/drive_link, processed (false), date_added
- `type: daily` — date, sources (array), open_items, new_items
- `type: weekly` — week_of, leadership_score (1-4), no_count, highlights
- `type: anomaly` — title, metric, severity (P1/P2/P3), status (open/resolved), date_detected
- `type: wbr/mbr/qbr` — period, revenue, highlights, misses, next_actions

Include rule: **Cumulative Wiki Rule** — when `wikify` runs on an existing wiki page, it APPENDS new insights and logs in `## Changelog`. Never overwrites.

### 2e. Create Command Center

Create `8 [NAME]'S BRAIN/Command Center.md` with a complete reference table of all commands, their purpose, status (✅ built / 🔲 not yet), and usage example.

Include all commands: alfred, 1on1, anomaly, archive, brand, clip, commands, deepdive, email, exec-brief, jira (or linear/asana based on their tool), lint, mbr, new, no, note, person, quarterly, retro, slack, status, tldr, tomorrow, wbr, weekly, wikify.

### 2f. Create Home.md

Create `Home.md` at the vault root — the dashboard. Include:
- Greeting with name and today's date
- Revenue target progress bar (if provided)
- Dataview query: active projects (type=project, status=active), sorted by priority desc
- Dataview query: open anomalies (type=anomaly, status=open)
- Dataview query: recent daily notes (type=daily, last 7)
- VIP/Team quick-reference table with emails
- Leadership OS 4-layer scores (Leading Self / Others / Results / Strategic)
- Upcoming 1:1s (from People pages)
- Quick command reference (top 8 most-used)

### 2g. Create All _Index.md Files

Create an `_Index.md` in every folder. Each index should:
- Explain what belongs in this folder (1-2 sentences)
- Include a Dataview query showing contents
- List the relevant commands

Create these indexes:
- `1 Projects/_Index.md` — scoring table (4-5=Priority, 2-3=Important, 1=Idea Dump)
- `2 Areas/_Index.md`, `Role & Strategy/_Index.md`, `Team/_Index.md`, `Stakeholders/_Index.md`, `Hiring/_Index.md`
- `3 Reference/Raw/_Index.md`, `Raw/Projects/_Index.md`, `Wiki/_Index.md`, `Looker/_Index.md`
- `4 Archives/_Index.md`
- `5 People/_Index.md` (include VIP table + Team table with names from answers), `_Template.md`
- `6 Reviews/Daily/_Index.md` (include sort tip: Z→A for newest first), `Team/_Index.md`, `Weekly/_Index.md`
- `7 Metrics & KPIs/_Index.md`, `WBR/_Index.md`, `MBR/_Index.md`, `QBR/_Index.md`, `Anomalies/_Index.md`, `Metric Definitions/_Index.md`
- `8 [NAME]'S BRAIN/Agents/_Index.md`

### 2h. Create People Pages

For each VIP (from answer #6), create `5 People/VIP/[Full Name].md` with:
- Full frontmatter (type: person, team: vip, stakeholder_priority: 5)
- Email, Slack handle (TBD)
- About section (TBD)
- 1:1 Cadence (TBD)
- Goals, Interactions, Open Action Items, Notes sections

For each direct report (from answer #7), create `5 People/Team/[Full Name].md` with:
- Full frontmatter (type: person, team: team)
- Email, location (TBD), standup time (TBD)
- Sections: About, 1:1 Notes, Development, Interactions, Open Action Items

### 2i. Create Agent Spec Files

Create these in `8 [NAME]'S BRAIN/Agents/`:

**Daily Digest Agent.md** — alfred spec:
- Inputs: Gmail last 24h, Calendar today, Slack mentions/DMs, [Project tool] sprint, Granola meetings, carry-over unchecked items, weather for [City]
- VIP/Team priority: [VIP names] surface FIRST ⭐, [Team names] surface SECOND ⭐
- 12 steps: (1) Read About file (2) Gmail VIP-first (3) Calendar (4) Slack VIP-first (5) [Project tool] sprint (6) Granola meeting action items (7) carry-overs from yesterday's note (8) weather 3-day (9) capacity check (6+ meetings = flag) (10) write daily note to `6 Reviews/Daily/YYYY-MM-DD.md` (10b) write team sprint snapshot to `6 Reviews/Team/YYYY-MM-DD-[tool].md` (11) update People pages (12) Leadership OS nudge
- Output format: daily note with Top 3, ⭐ VIP table, Full To-Do, Calendar, Email, Slack, Granola, Sprint, Weather, Leadership OS, Nudge

**Anomaly Agent.md** — anomaly spec:
- Sources: Snowflake (direct query), project tool, Slack, email
- Severity: P1 (revenue/data down >20%), P2 (degraded 10-20%), P3 (<10% or quality)
- Output: `7 Metrics & KPIs/Anomalies/YYYY-MM-DD-[metric].md`

**Deep Dive Agent.md** — deepdive spec:
- Input: project name or question
- Sources: Snowflake, Jira/project tool, Wiki pages, Raw folder, Slack threads, Drive
- Output: A/B/C recommendation with supporting data + confidence level

### 2j. Create Wiki Starter Pages

Create `3 Reference/Wiki/Leadership OS.md`:
A 4-layer leadership framework:
- **Layer 1 — Leading Self:** Energy management, focus protection, decision quality
- **Layer 2 — Leading Others:** 1:1 quality, feedback cadence, delegation, development
- **Layer 3 — Leading Results:** OKR clarity, initiative prioritization, WBR ownership
- **Layer 4 — Leading Strategically:** Executive presence, stakeholder management, saying NO
Each layer: description + 3 anti-patterns to avoid + weekly check question + score (1-4).

Create `3 Reference/Wiki/Say No Playbook.md`:
- Decision filter: "Does this move my top 3 forward?" Hell Yes or No rule
- 7 scripts for declining: peer request, skip-level ask, cross-team ask, last-minute add, project scope creep, meeting that should be email, ask that belongs to someone else
- NO tracker: `- [ ] [date] Said NO to: [what] · Suggested alternative: [what]`

### 2k. Create All 25+ x- Skill Files in .claude/commands/

Create each file as a `.md` file. Each file is the **full instruction** Claude Code follows when the command is run. Build all of these:

**alfred.md** — Full daily digest. Include VIP/Team names from answers. Include project tool URL. 12 steps as defined in Agent spec. Include Granola step (pull yesterday's + today's meeting action items). Include daily note format template.

**1on1.md** — Pre-meeting brief for named person. Read their People page (open action items, last 1:1 notes, development notes). Pull recent Slack/email between user and that person. Check their project tool tickets if direct report. Output: prep brief with talking points, open actions, feedback to give.

**anomaly.md** — Investigate a metric anomaly. Query Snowflake for context, check project tool for related tickets, scan Slack for mentions. Classify P1/P2/P3. Write to `7 Metrics & KPIs/Anomalies/`.

**archive.md** — Move a project to `4 Archives/`. Update frontmatter (status: complete, archived_date). Write a 3-bullet closure summary.

**brand.md** — Answer brand/design questions. Read `3 Reference/Wiki/[Company] Brand Guidelines.md`. If not populated yet, instruct user to run `clip [Confluence/Drive URL]` then `wikify`.

**clip.md** — Save a Drive/web link to `3 Reference/Raw/`. Create a raw note with: title, drive_link (or url), 2-line summary (from URL metadata), processed: false, date_added: today. Do NOT download content — keep the link live.

**commands.md** — Print the full command reference from `8 [NAME]'S BRAIN/Command Center.md`.

**deepdive.md** — Follow the Deep Dive Agent spec in `8 [NAME]'S BRAIN/Agents/Deep Dive Agent.md`. Multi-source synthesis. Output A/B/C recommendations.

**email.md** — Triage unread email. VIP/Team first ⭐. For each: what they need, urgency, draft response if action needed. Flag hedging language in any leadership-bound emails.

**exec-brief.md** — Create a 1-page executive brief on a topic. Headline, 3 bullets, so-what, recommendation. Crisp, no hedging.

**jira.md** (or linear.md / asana.md based on their answer) — Check the sprint board. User's tickets + team breakdown per person: done/in-progress/blocked. Flag blockers. Include board URL from answers.

**lint.md** — Vault health check. Report: broken wiki links, stale projects (no update >14 days), ghost people (no interaction >30 days), unprocessed Raw notes (>7 days old, processed: false), notes missing required frontmatter fields.

**mbr.md** — Monthly Business Review. Pull all WBR files from the month. Query Snowflake for revenue/KPI data. Synthesize: wins, misses, trends, next month focus. Write to `7 Metrics & KPIs/MBR/YYYY-MM.md`.

**new.md** — Create a new project. Ask: name, area (1-4), priority score (1-5), next action, due date. Write to correct subfolder. Update `1 Projects/_Index.md`.

**no.md** — Help decline a request. Read `3 Reference/Wiki/Say No Playbook.md`. Classify the request type. Suggest the right script. Draft the decline message. Add to NO tracker.

**note.md** — Quick capture. Save input text as a raw note in `3 Reference/Raw/`. Add frontmatter: type: raw, source_type: quick-note, processed: false, date_added: today. Title = first 8 words of text.

**person.md** — Create or update a person page. If page exists: update interactions + open action items. If new: create from `5 People/_Template.md`. Populate from Gmail/Slack context if available.

**quarterly.md** — Quarterly Business Review. Pull all MBRs from the quarter. OKR review (planned vs actual). Team health. Roadmap vs reality. Next quarter plan. Write to `7 Metrics & KPIs/QBR/YYYY-QN.md`.

**retro.md** — Weekly self-retro. Score yourself on Leadership OS 4 layers (1-4). Count NOs said this week. One specific change for next week. Append to current weekly note.

**slack.md** — Triage Slack. VIP/Team DMs and @mentions FIRST ⭐. Then other @mentions. Then key channels. For each: what needs response, urgency, draft reply if needed.

**status.md** — One-paragraph status update on a named project. Pull from project file, recent Jira tickets, and Slack mentions. Format for sharing with leadership.

**tldr.md** — Summarize a pasted document or Drive URL into 5 bullets. Bottom line up front.

**tomorrow.md** — End-of-day prep. Review today's unchecked items. Preview tomorrow's calendar. Set top 3 for tomorrow. Write carry-over note.

**wbr.md** — Weekly Business Review. Pull revenue/KPI data from Snowflake. Summarize week's metrics: traffic, conversion, revenue, anomalies. Write to `7 Metrics & KPIs/WBR/YYYY-MM-DD.md`.

**weekly.md** — Weekly summary. Pull all daily notes from this week. Combine into: accomplishments, decisions made, action items, blockers, team highlights. Write to `6 Reviews/Weekly/YYYY-WNN.md`.

**wikify.md** — Synthesize raw material into a Wiki page.
- Input: filename in Raw/, folder in Raw/Projects/, or Drive link
- If Drive link: fetch latest from Google Drive MCP
- Read all .md, .html, .txt files in scope
- Check if a Wiki page exists for this topic
- If YES: read existing page fully → identify NEW insights → APPEND only → log in `## Changelog`
- If NO: create fresh wiki page in `3 Reference/Wiki/[Topic].md`
- Preserve inline HTML in output (Obsidian renders it natively)
- Mark source as processed: true after completion
- **Never overwrite existing wiki knowledge — only accumulate**

### 2l. Create .gitignore

Create `.gitignore`:

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
.space/
.DS_Store
```

### 2m. Create CSS Snippet for Folder Colors

Create `.obsidian/snippets/folder-colors.css`:

```css
/* Second Brain X — Folder Colors */
.nav-folder-title[data-path="1 Projects"] .nav-folder-title-content { color: #ff6b6b !important; font-weight: 600; }
.nav-folder-title[data-path="2 Areas"] .nav-folder-title-content { color: #4dabf7 !important; font-weight: 600; }
.nav-folder-title[data-path="3 Reference"] .nav-folder-title-content { color: #69db7c !important; font-weight: 600; }
.nav-folder-title[data-path="4 Archives"] .nav-folder-title-content { color: #868e96 !important; font-weight: 600; }
.nav-folder-title[data-path="5 People"] .nav-folder-title-content { color: #cc5de8 !important; font-weight: 600; }
.nav-folder-title[data-path="6 Reviews"] .nav-folder-title-content { color: #ffd43b !important; font-weight: 600; }
.nav-folder-title[data-path="7 Metrics & KPIs"] .nav-folder-title-content { color: #ff922b !important; font-weight: 600; }
```
Replace `8 [NAME]'S BRAIN` with the actual brain folder name and add:
```css
.nav-folder-title[data-path="8 [NAME]'S BRAIN"] .nav-folder-title-content { color: #20c997 !important; font-weight: 700; }
```

### 2n. Copy HOW TO BUILD ME

Download or clone the HOW TO BUILD ME documentation from the GitHub repo (if this was cloned) — or confirm that the HOW TO BUILD ME/ folder already exists. Do not overwrite if it exists.

---

## Step 3 — Verify the Build

After creating all files, run a verification:
1. Count total files created — report the number
2. List any folders that are missing _Index.md
3. Confirm all 25 x- skill files exist in `.claude/commands/`
4. Confirm CLAUDE.md exists at vault root
5. Confirm About [Name].md exists in the brain folder
6. Report any personalization placeholders still showing `[TBD]` or `[TODO]`

Print a build report:
```
✅ Build Complete — [Name]'s Second Brain
─────────────────────────────────────────
📁 Folders created: X
📄 Files created: X
⚙️  Commands installed: X/25
🔑 Personalized with: [Name], [Company], [VIPs], [Team]
⚠️  Still needs: [list any TBDs]

## Next Steps
1. Open this folder in Obsidian
2. Enable CSS snippets: Settings → Appearance → CSS Snippets → toggle folder-colors
3. Install Obsidian plugins: Dataview, Templater, Calendar
4. Connect MCP servers: Gmail, Slack, Jira/[tool], Google Drive, Google Calendar
   → See HOW TO BUILD ME/05 MCP Connections.md
5. Fill in About [Name].md — add your work personality coaching notes
6. Run your first alfred
```

---

## Step 4 — Publish to GitHub (If Requested)

If the user answered YES to publishing GitHub in Step 1:

1. Initialize git: `git init`
2. Add only safe files: `git add .` (gitignore handles the rest)
3. Create initial commit: `git commit -m "Initial build: [Name]'s Second Brain X"`
4. Create GitHub repo via `gh repo create [repo-name] --public --description "AI-powered work OS built on PARA + LLM Wiki + Claude Code"`
5. Push: `git branch -M main && git push -u origin main`
6. Set as template repository (requires manual step — tell user): "Go to your repo Settings → check 'Template repository' so others can use it as a starting point"
7. Print the repo URL

If the user wants a README for the GitHub page, generate one based on the README.md in HOW TO BUILD ME/, adapted with their name/company removed and replaced with generic placeholders.

---

## Important Notes for Claude While Building

- **Never ask clarifying questions** after Step 1 — just build. If something is ambiguous, make the sensible default choice and note it in the build report.
- **Personalize everything** — every file should have the user's real name, role, company, VIP names. No generic `[YOUR NAME]` left in files that are meant to be used (About file, CLAUDE.md, alfred, people pages).
- **Generic files** (HOW TO BUILD ME, Schema.md, Wiki pages, skill command files) should NOT contain personal info — these are the shareable parts.
- **Speed matters** — create files in parallel where possible. Don't read back files you just wrote.
- **The brain folder name** must use the user's first name in ALL CAPS: `8 JANE'S BRAIN`. All references to it in CLAUDE.md, Home.md, and skill files must match exactly.
- **Granola note** — always add this line to alfred: "Check if Granola is connected to your work email. If Granola shows meetings from a personal account, ask the user to open Granola → Preferences → add their work email."

---PROMPT END---

---

## What Gets Built

When the prompt completes, you will have:

| What | Count |
|------|-------|
| Folders | 30+ |
| Skill commands (x-) | 25 |
| Index files | 20+ |
| People pages | 1 per VIP + 1 per team member |
| Wiki starter pages | Leadership OS, Say No Playbook |
| Agent specs | Daily Digest, Anomaly, Deep Dive |
| Config files | CLAUDE.md, .gitignore, folder-colors.css |
| Dashboard | Home.md with Dataview queries |

Total build time: ~3–5 minutes.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Claude stops mid-build | Re-paste the prompt and say "Continue from Step 2[letter] — you stopped at [where]" |
| Brain folder name has wrong spacing | Run: `mv "8 YOURNAME'S BRAIN" "8 [CORRECTNAME]'S BRAIN"` |
| Obsidian doesn't show folder colors | Settings → Appearance → CSS Snippets → toggle `folder-colors` ON |
| Dataview queries show "No results" | Install Dataview plugin in Obsidian Community Plugins |
| x- commands not recognized | Confirm `.claude/commands/` folder is inside your vault root |
| GitHub push fails | Run `gh auth login` first, then retry Step 4 |

---

## After the Build — MCP Connections

The commands alfred, email, slack, jira, wbr etc. all depend on live data connections. Connect these in Claude Code settings (or at claude.ai/settings → Integrations):

| Integration | Enables |
|-------------|---------|
| Gmail | alfred, email |
| Google Calendar | alfred, tomorrow |
| Google Drive | clip, wikify (Drive links) |
| Slack | alfred, slack, 1on1 |
| Jira / Linear / Asana | alfred, jira, 1on1 |
| Granola | alfred (meeting action items) |
| Snowflake | wbr, mbr, anomaly, deepdive |

Full setup instructions: `HOW TO BUILD ME/05 MCP Connections.md`
