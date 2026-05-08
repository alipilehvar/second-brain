# Second Brain X — Your AI-Powered Work Assistant

> **For anyone who feels buried in email, meetings, Slack, and scattered notes.**  
> One setup. Every morning, one command organizes your entire day.

---

## What Does This Do?

Every morning you type one word — `alfred` — and your AI assistant:

- **Reads your email** and surfaces what needs your attention (your most important people first)
- **Checks your calendar** and flags back-to-back meetings or overloaded days
- **Scans your Slack** for messages that need a response
- **Reviews your project board** (Jira, Linear, or Asana) — your team's progress, blockers, what's due
- **Reads your meeting transcripts** (via Granola) and pulls out action items you need to follow up on
- **Writes one clean daily note** with everything organized in one place

No more switching between five apps to figure out what to do. One command. One note. Day organized.

Beyond the morning routine, it also:
- Preps you for any 1:1 meeting in 30 seconds (`1on1 [name]`)
- Helps you say no to requests gracefully (`no [describe the ask]`)
- Turns any document, article, or meeting note into a searchable wiki page (`wikify`)
- Keeps a running relationship file on every person you work with

---

## Install the Plugin

### No coding needed — three downloads and one command

**Step 1 — Download these three apps:**

| App | Download | What It Does |
|-----|----------|-------------|
| **Obsidian** | [obsidian.md](https://obsidian.md) | Your notes viewer — free, Mac/Windows/Linux |
| **Claude Code** | [claude.ai/code](https://claude.ai/code) | The AI that runs everything — desktop app or terminal |
| **Granola** | [granola.so](https://granola.so) | Records your meetings silently — Mac |

**Step 2 — Connect your tools** (10 min, no coding):

Go to **[claude.ai](https://claude.ai) → Settings → Integrations** and click Add next to:
- Gmail (or Google Workspace)
- Google Calendar
- Slack
- Jira, Linear, or Asana (whichever your team uses)
- Granola

Each one is just signing in with your work account. No API keys. No code. One-time setup.

**Step 3 — Install the plugin:**

Open Claude Code, then paste this one line and press Enter:

```
curl -fsSL https://raw.githubusercontent.com/alipilehvar/second-brain/main/install.sh | bash
```

**Step 4 — Create an empty folder, open Claude Code in it, and type:**

```
setup-brain
```

Claude will ask you 10 simple questions (your name, your role, who your key people are, which tools you use). Answer them. Claude builds your entire workspace in about 5 minutes.

**Step 5 — Open the folder in Obsidian and run:**

```
alfred
```

That's it. You're set up.

---

## What It Builds For You

When you run `setup-brain`, Claude creates your full workspace automatically:

- **Your daily dashboard** — one Home page that shows your active projects, open items, and key contacts
- **A folder for every person you work with** — every meeting note, action item, and piece of context about them, all in one place
- **A living knowledge base** (the Wiki) — every document or article you feed it gets synthesized into a searchable page that gets smarter over time
- **25 ready-to-use commands** — for email triage, meeting prep, project updates, weekly reviews, and more

Everything stays on your computer. Nothing is sent anywhere except through the tools you already use (Gmail, Slack, etc.).

---

## What You'll Use Every Day

| When | Type This | What Happens |
|------|-----------|-------------|
| Every morning | `alfred` | Digest of email, calendar, Slack, meetings — all in one note |
| Before any 1:1 | `1on1 [person's name]` | Brief with their open items, last meeting notes, what to cover |
| Someone asks you to do something you can't | `no [describe the ask]` | Drafts a polite decline with the right framing |
| End of day | `closeday` | Captures ideas, follow-ups, pre-loads tomorrow |
| You read something worth saving | `clip [link]` | Saves it to your knowledge base |
| End of week | `weekly` | Synthesizes your week into one summary |

---

## How the Folders Work

Your workspace uses a simple 4-bucket system (called PARA) — everything has exactly one home:

| Folder | What Goes Here |
|--------|---------------|
| **1 Projects** | Active work with a deadline — things you're doing right now |
| **2 Areas** | Ongoing responsibilities — your role, your team, hiring, strategy |
| **3 Reference** | Knowledge — two sub-folders (see below) |
| **4 Archives** | Finished work — out of sight, but searchable |
| **5 People** | One page per person you interact with — your built-in CRM |
| **6 Reviews** | Daily notes, weekly summaries |

### Raw vs. Wiki — the most important distinction

Inside **3 Reference** there are two folders:

**Raw/** is your inbox for knowledge. Drop anything here — articles, links, meeting notes, PDFs. Nothing is processed yet. This is where things *land*.

**Wiki/** is your brain. This is where things *live*. Run `wikify [filename]` and Claude reads whatever you dropped in Raw, extracts what's useful, and either creates a new page or adds to an existing one — it never overwrites. Every source you add makes your wiki smarter. Six months in, your knowledge on any topic is already synthesized and searchable — you never have to re-derive it from scratch.

---

## For Technical Users

<details>
<summary>Terminal install, developer setup, Snowflake, and advanced configuration</summary>

### Terminal Install

```bash
npm install -g @anthropic-ai/claude-code
curl -fsSL https://raw.githubusercontent.com/alipilehvar/second-brain/main/install.sh | bash
mkdir ~/Desktop/MyBrain && cd ~/Desktop/MyBrain && claude
```
Then type `setup-brain`.

### Snowflake (data teams)

```bash
pip3 install snowflake-connector-python
```

Create `~/.snowflake/connections.toml`:
```toml
[default]
account = "YOUR-ACCOUNT-ID"
user = "YOUR.EMAIL@COMPANY.COM"
authenticator = "externalbrowser"
role = "YOUR_ROLE"
warehouse = "YOUR_WAREHOUSE"
```

Enables data warehouse queries directly from Claude.

### Chrome Web Clipper

Chrome Web Store → "Obsidian Web Clipper" → set default folder to `3 Reference/Raw/` → clip any page in one click.

### CLAUDE.md

The full operating manual template is at [`CLAUDE.md.template`](CLAUDE.md.template) — 23 rules covering Granola indexing, People system, project tool integration, and the automation hook.

### Plugin Structure

See [`plugin/README.md`](plugin/README.md) for plugin manifest and marketplace submission details.

</details>

---

## The Compound Effect

```
Day 1:    Save one article → wikify → 1 wiki page
Week 1:   5 mornings of alfred → carry-forward loop runs itself
Month 1:  Wiki grows — every new source enriches existing pages
Month 3:  15+ pages cross-referencing each other → knowledge graph
Month 6:  Ask any question about your work → answer already in the wiki
Year 1:   New team member → onboard from wiki → days instead of months
```

---

## Further Reading

| Doc | Best For |
|-----|---------|
| [`HOW TO BUILD ME/17 HOW KNOW - GitHub Gist (Short).md`](HOW%20TO%20BUILD%20ME/17%20HOW%20KNOW%20-%20GitHub%20Gist%20(Short).md) | Quick overview — shareable with anyone |
| [`HOW TO BUILD ME/16 HOW KNOW - Professional Second Brain.md`](HOW%20TO%20BUILD%20ME/16%20HOW%20KNOW%20-%20Professional%20Second%20Brain.md) | Full concept guide — architecture, design, daily cadence |
| [`HOW TO BUILD ME/05 MCP Connections.md`](HOW%20TO%20BUILD%20ME/05%20MCP%20Connections.md) | Tool connection troubleshooting |

---

## Credits

- LLM Wiki pattern by [Andrej Karpathy](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- PARA method by [Tiago Forte](https://fortelabs.com/blog/para/)
- Built with [Claude Code](https://claude.ai/code) by Anthropic
- [Obsidian](https://obsidian.md/) · [Granola](https://granola.so/)

---

*Built by [Ali Pilehvar](https://www.linkedin.com/in/alipilehvar/) · [Medium: AI & disruption](https://alipilevar.medium.com/)*
