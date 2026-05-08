# 04 — Schema Design

Every note has YAML frontmatter. This is the contract that lets Claude query your vault like a database and lets Dataview render dashboards.

## Why Schema Matters

Without schema: Claude guesses what a note is about.
With schema: Claude can query "show all active projects sorted by priority" or "who haven't I contacted in 14 days?"

## Core Types

### Project
```yaml
---
type: project
title: [Project Name]
priority: 4          # 1=idea dump, 2-3=important, 4-5=priority
energy: high         # high (needs deep focus) | low (quick win)
status: active       # active | paused | done
due: YYYY-MM-DD
area: team           # which area this project serves
tags: []
---
```

### Area
```yaml
---
type: area
title: [Area Name]
status: active       # active | inactive
tags: []
---
```

### Person
```yaml
---
type: person
name: [Full Name]
role: [Job Title]
org: [company]
team: vip            # vip | team | peer | stakeholder | leadership
stakeholder: true    # true = in active stakeholder management
stakeholder_priority: 5   # 1-5
last_contact: YYYY-MM-DD
tags: []
---
```

### Wiki (Reference)
```yaml
---
type: wiki
title: [Topic Name]
topic: [category]
drive_link:          # Google Drive URL if source lives on Drive
related: []          # [[links]] to projects/areas using this knowledge
last_updated: YYYY-MM-DD
tags: []
---
```

### Daily Review
```yaml
---
type: daily
date: YYYY-MM-DD
sources: [gmail, slack, jira, calendar]
open_items: 3        # carried forward from yesterday
new_items: 7         # new today
---
```

### Weekly Review
```yaml
---
type: weekly
week: YYYY-WNN
dates: YYYY-MM-DD to YYYY-MM-DD
no_count: 2          # NOs said this week (target: 2+)
leadership_score: 14 # /20 from self-assessment
---
```

### Anomaly
```yaml
---
type: anomaly
date: YYYY-MM-DD
source: snowflake    # snowflake | jira | slack | email | agent
severity: high       # low | medium | high
status: open         # open | investigating | resolved
tags: []
---
```

### Raw (inbox)
```yaml
---
type: raw
source: [url or description]
drive_link:          # if from Google Drive — enables live fetch
fetched: YYYY-MM-DD
processed: false     # set to true after wikify
---
```

## Dataview Examples

These work out of the box in Obsidian with the Dataview plugin:

```
# Active projects sorted by priority
table priority as "Score", due as "Due"
from "1 Projects"
where type = "project" and status = "active"
sort priority desc

# People not contacted in 14+ days
table role as "Role", last_contact as "Last Contact"
from "5 People"
where type = "person" and last_contact < date(today) - dur(14 days)
sort last_contact asc

# Open anomalies
table date as "Date", source as "Source", severity as "Severity"
from "7 Metrics & KPIs/Anomalies"
where type = "anomaly" and status = "open"
sort date desc
```
