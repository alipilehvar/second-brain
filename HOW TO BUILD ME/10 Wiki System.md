# 10 — Wiki System (Raw → Wiki)

The LLM Wiki pattern: you drop raw material, Claude synthesizes knowledge pages that compound over time.

## The Flow

```
You drop:                Claude creates:              Result:
─────────────            ───────────────              ───────
Drive link     ─clip→  Raw note (linked)  ─wikify→  Wiki page
Web clip       ─drop→    Raw file           ─wikify→  (cumulative)
HTML export    ─drop→    Raw folder         ─wikify→
Meeting notes  ─Granola→ Transcript         ─wikify→
```

## Raw Folder (`3 Reference/Raw/`)

Everything unprocessed lands here. No editing required — just drop it.

| Source | How to add |
|--------|-----------|
| Google Drive doc | `clip [Drive URL]` — no download, link stays live |
| Web article | Obsidian web clipper Chrome extension → auto-saves to Raw |
| Quick thought | `note [your text]` |
| Investigation folder | Create subfolder in `3 Reference/Raw/Projects/[topic]/` |

Raw files get frontmatter with `processed: false`. `lint` flags them after 7 days.

## Wiki Pages (`3 Reference/Wiki/`)

Synthesized, curated knowledge. Not project summaries (those live in Projects). Not person notes (those live in People). Wiki = **cross-cutting domain knowledge**.

Examples:
- "How Segment Works" — architecture, data model, gotchas
- "Brand Guidelines" — colors, fonts, voice, logo rules
- "Leadership OS" — your leadership framework reference
- "Say No Playbook" — scripts for declining requests
- "Metric Definitions" — SSOT for all your KPIs

## Cumulative Updates (Key Principle)

When you run `wikify` on a topic that already has a Wiki page:
1. Claude reads the existing page fully
2. Identifies what's NEW in the source material
3. **Appends** new insights — never overwrites existing knowledge
4. Logs the addition in `## Changelog` at the bottom

This means your Wiki compounds. The more you feed it, the smarter it gets.

## HTML Support

If you drop HTML files (Confluence exports, web clips, Looker reports):
- Claude reads the HTML as structured content
- Extracts meaningful content (strips nav/footer noise)
- Preserves formatted tables and key structures as inline HTML in the .md file
- Obsidian renders inline HTML natively

## Drive Links Stay Live

When you use `clip [Drive URL]`:
- Claude saves the link, NOT the content
- Each time you run `wikify` on that note, Claude fetches the **latest version** from Drive
- Your Wiki page always reflects the current state of the source doc

## Example Workflow

```
1. Your data team has a metrics doc on Drive
   → clip https://docs.google.com/...

2. Claude creates Raw note with drive_link, 2-line summary
   → 3 Reference/Raw/2026-05-06-metrics-doc.md

3. You run: wikify 2026-05-06-metrics-doc.md
   → Claude fetches from Drive, synthesizes
   → Creates/updates 3 Reference/Wiki/Metric Definitions.md

4. Next month the Drive doc is updated
   → Run wikify again
   → Claude appends new definitions, logs in Changelog
   → Old definitions preserved
```
