# Start Here — No Technical Knowledge Needed

> You don't need to know how to code. Follow these steps exactly and you'll have a working AI work assistant in about an hour.

---

## What You're Building

An AI assistant that every morning:
- Reads your email and tells you what needs attention
- Checks your calendar and flags problems
- Scans your Slack for messages that need a reply
- Reviews your team's project board
- Summarizes your recent meetings
- Writes one clean note with everything in one place

You type one word. It does the rest.

---

## Before You Start — 3 Things to Download

Install these three apps first. Each one is a normal download — just like installing any app on your computer.

### 1. Obsidian
This is where your notes will live. Think of it like a supercharged notebook.

👉 Go to **[obsidian.md](https://obsidian.md)** → click **Download** → install it like any other app

### 2. Claude Code
This is the AI that runs everything. It's made by Anthropic (the company behind Claude).

👉 Go to **[claude.ai/code](https://claude.ai/code)** → download the desktop app for Mac or Windows → install it

When you open it for the first time, it will ask you to sign in at claude.ai — do that, then come back to the app.

### 3. Granola
This records your meetings silently and creates notes automatically.

👉 Go to **[granola.so](https://granola.so)** → download → install

After installing, open Granola and go to **Preferences → Account → add your work email** (not personal Gmail). This is important — it needs your work email to match your work calendar.

---

## Step 1 — Create Your Brain Folder

Create a new empty folder on your computer. Call it something like **My Second Brain**.

- **Mac:** Open Finder → go to Desktop → right-click → New Folder → name it "My Second Brain"
- **Windows:** Open File Explorer → go to Desktop → right-click → New → Folder → name it "My Second Brain"

---

## Step 2 — Connect Your Tools to Claude

This is what gives the AI access to your email, Slack, and calendar. You do this once and it works forever.

**Go to [claude.ai](https://claude.ai)** (sign in if needed) **→ click your profile icon → Settings → Integrations**

You'll see a list of tools you can connect. Click **Add** next to each one and sign in with your work account:

| Connect This | Click | Uses Your |
|-------------|-------|-----------|
| **Google** | Add Google | Work Gmail + Calendar + Drive — all three connect at once |
| **Slack** | Add Slack | Your work Slack workspace |
| **Jira** or **Linear** | Add Atlassian / Add Linear | Your team's project board |
| **Granola** | Add Granola | Your meeting transcripts |

Each one just asks you to sign in — no passwords to remember, no technical setup. Takes about 30 seconds each.

---

## Step 3 — Open Claude Code in Your Brain Folder

Open the **Claude Code** desktop app you downloaded.

You'll see a way to open a folder. Open the **My Second Brain** folder you created in Step 1.

> If Claude Code asks you to open a terminal or type a command, don't worry — just follow the prompts. It's like a chat window where you type instructions.

---

## Step 4 — Check Your Connections

In Claude Code, type this exactly and press Enter:

```
/mcp
```

You'll see a list of your connected tools with a green ✓ or red ✗ next to each one.

- **Green ✓** = connected and ready
- **Red ✗** = not connected yet → go back to Step 2 and add it

Don't continue until Gmail and Slack show green. The others are optional but helpful.

---

## Step 5 — Install the Setup Wizard

In Claude Code, type this and press Enter:

```
curl -fsSL https://raw.githubusercontent.com/alipilehvar/second-brain/main/install.sh | bash
```

You'll see a message that says **"Plugin installed successfully!"** That means the setup wizard is ready.

---

## Step 6 — Run the Setup Wizard

Type this and press Enter:

```
setup-brain
```

The AI will ask you **10 simple questions** — one at a time. Things like:
- What's your name?
- What's your job title?
- Who are the 2-3 people whose emails you always need to see first?
- Who's on your team?
- Do you use Jira, Linear, or Asana?

Just answer naturally. The AI builds your entire workspace from your answers. Takes about 5 minutes.

---

## Step 7 — Open Your Brain in Obsidian

1. Open **Obsidian**
2. Click **"Open folder as vault"**
3. Select your **My Second Brain** folder

You'll see your new workspace with color-coded folders.

Now install three small add-ons inside Obsidian:
- Go to **Settings → Community Plugins → Turn on community plugins → Browse**
- Search for and install: **Dataview**, **Templater**, **Calendar**

Then go to **Settings → Appearance → CSS Snippets** → toggle **folder-colors** ON.

Your folders will become color-coded — red for active work, green for knowledge, purple for people.

---

## Step 8 — Enable Folder Colors

In Obsidian: **Settings → Appearance → CSS Snippets → toggle "folder-colors" ON**

---

## Step 9 — Verify Everything is Connected

Back in Claude Code, type:

```
/mcp
```

Make sure Gmail, Slack, and your project board all show green. If anything is red, go to [claude.ai](https://claude.ai) → Settings → Integrations → Add it.

---

## Step 10 — Run Your First Morning Briefing

Type this:

```
alfred
```

Wait about 30 seconds. Claude will read your email, calendar, Slack, and meetings — and write a single organized note with everything you need to know for the day.

**That's it. You're set up.**

---

## Every Morning After This

Open Claude Code → go to your My Second Brain folder → type:

```
alfred
```

That's your daily routine. Everything else is optional.

---

## Other Things You Can Do

Once you're comfortable with `alfred`, here are the other commands worth knowing:

| Type This | When To Use It |
|-----------|---------------|
| `1on1 Sarah` | Before a meeting with Sarah — get a quick brief on open items and what to discuss |
| `no` | When someone asks you to do something you don't have time for — gets you a polite way to decline |
| `clip [paste a link]` | When you read an article worth saving — stores it in your knowledge base |
| `closeday` | At the end of the day — saves ideas, logs follow-ups, sets up tomorrow |
| `weekly` | Friday afternoon — summary of your whole week |

---

## If Something Doesn't Work

**Claude Code says a tool isn't connected:**
→ Go to [claude.ai](https://claude.ai) → Settings → Integrations → find the tool → click Add → sign in again

**Granola isn't showing my meetings:**
→ Open Granola → Preferences → make sure your work email is added (not personal Gmail)

**I can't find my Brain folder in Obsidian:**
→ Obsidian → File → Open Vault → find your "My Second Brain" folder

**Something else:**
→ Type `commands` in Claude Code to see all available options
→ Or post in the GitHub issues: [github.com/alipilehvar/second-brain/issues](https://github.com/alipilehvar/second-brain/issues)

---

*Built by [Ali Pilehvar](https://www.linkedin.com/in/alipilehvar/) · [Medium: AI & disruption](https://alipilevar.medium.com/)*
