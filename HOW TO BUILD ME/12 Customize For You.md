# 12 — Customize For You

This guide covers everything you need to change to make this system yours.

## Step 1: Rename the Brain Folder

Change `8 ALI'S BRAIN` to `8 [YOUR NAME]'S BRAIN`:
```bash
mv "8 ALI'S BRAIN" "8 [YOUR NAME]'S BRAIN"
```

Then find/replace in all files:
```bash
find . -name "*.md" | xargs sed -i '' "s|8 ALI'S BRAIN|8 [YOUR NAME]'S BRAIN|g"
```

## Step 2: Fill in About [You].md

Replace all `TBD` and placeholder fields in `8 [YOUR BRAIN]/About [You].md`:
- Your name, role, company, email
- Your direct reports (name, email, location, standup time)
- Revenue/business targets
- Your tech stack
- Your work personality — add honest coaching notes
- Key stakeholders

This file is gitignored — never shared.

## Step 3: Update CLAUDE.md (root)

Change:
- Your name, role, company
- VIP list (name + email for ⭐ priority)
- Team list (direct reports)
- Jira board URL
- Revenue target

## Step 4: Add Your VIP + Team to 5 People/

For each VIP and direct report:
- `person [Full Name]` — I'll create the page and pre-fill from Gmail/Slack

## Step 5: Folder Colors

The CSS snippet is at `.obsidian/snippets/folder-colors.css`.
Colors are defined per folder path. Change hex codes to match your preference or company brand.

Activate: **Obsidian Settings → Appearance → CSS Snippets → toggle folder-colors**

## Step 6: Add Your Domain Knowledge to Wiki

Drop key docs into Raw and wikify them:
- Brand guidelines → `clip [Confluence URL]` → `wikify`
- Metric definitions → `clip [Sheet URL]` → `wikify`
- Architecture docs → drop in `Raw/Projects/` → `wikify Projects/[folder]`

## Step 7: Leadership Framework (Optional)

The default includes:
- `3 Reference/Wiki/Leadership OS.md` — 4-layer leadership framework
- `3 Reference/Wiki/Say No Playbook.md` — scripts for declining requests

Replace or extend with your own frameworks.

## Step 8: Coaching Notes

In `8 [YOUR BRAIN]/About [You].md` there's a "Work Personality" section. This is where you write honest coaching notes for Claude:

```markdown
## Work Personality — Coach Accordingly
- [Your tendency]: [how to counter it]
- e.g. "Says YES to everything — actively coach to decline"
- e.g. "Spends too long in meetings — flag if 6+ meetings on calendar"
```

Claude reads this every session and adjusts its coaching accordingly.

## What NOT to Change

- The `x-` command prefix — keep this namespace consistent
- The YAML frontmatter field names — Dataview queries depend on them
- The folder numbering (1-8) — sort order depends on it
- The `.gitignore` pattern — keeps personal files out of GitHub

## Color Reference (Default)

| Folder      | Hex       | Meaning                    |
| ----------- | --------- | -------------------------- |
| 1 Projects  | `#ff6b6b` | Red — action/urgency       |
| 2 Areas     | `#4dabf7` | Blue — responsibility      |
| 3 Reference | `#69db7c` | Green — knowledge          |
| 4 Archives  | `#868e96` | Gray — inactive            |
| 5 People    | `#cc5de8` | Purple — relationships     |
| 6 Reviews   | `#ffd43b` | Yellow — time/cadence      |
| 7 Metrics   | `#ff922b` | Orange — data/performance  |
| 8 Brain     | `#20c997` | Teal — system/intelligence |
