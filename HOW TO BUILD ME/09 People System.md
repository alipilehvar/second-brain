# 09 — People System (CRM)

One markdown file per person. Claude updates them automatically after every interaction.

## Structure

```
5 People/
├── VIP/              ← key stakeholders (surface ⭐ first in digests)
├── Team/             ← direct reports (surface ⭐ second)
├── _Index.md         ← master list by group
└── _Template.md      ← copy when creating new pages
```

## Person Page Template

```markdown
---
type: person
name: [Full Name]
role: [Job Title]
org: [company]
team: vip              # vip | team | peer | stakeholder | leadership
stakeholder: true
stakeholder_priority: 5
last_contact: YYYY-MM-DD
tags: []
---
# [Full Name]

**Email:** 
**Slack:** @handle
**Team:** 

## About
[1-2 lines: what they own, working style]

## Goals (Current Quarter)
- [ ]

## 1:1 Notes
### YYYY-MM-DD
- Topics:
- Action items (theirs): [ ]
- Action items (mine): [ ]
- Feedback given:

## Development
- Strengths:
- Growth areas:
- Career trajectory:

## Interactions
- YYYY-MM-DD — [what happened, source: email/slack/meeting]

## Open Action Items
- [ ]

## Notes
- What motivates them?
- Feedback preferences?
```

## VIP System

Mark key stakeholders with `team: vip` in frontmatter. In your CLAUDE.md, explicitly name them:

```markdown
## VIP Priority
Always surface first ⭐: [Name] ([email]), [Name] ([email])
Surface second ⭐: Direct reports — [Name], [Name], [Name]
```

Claude will then put their emails and Slack messages at the top of every digest.

## Auto-Update Rules

Tell Claude in CLAUDE.md:
> "Update the relevant person's page in 5 People/ after every email, Slack DM, or meeting interaction."

With this rule, every `alfred` run automatically logs interactions to person pages.

## Using 1on1

Before every 1:1, run `1on1 [Full Name]`. Claude will:
1. Read their page (open action items, last 1:1 notes, development plan)
2. Pull recent Slack/email between you and them
3. Check their Jira tickets (if direct report)
4. Generate a prep brief with talking points
