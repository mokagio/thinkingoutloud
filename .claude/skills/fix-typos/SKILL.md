---
name: fix-typos
description: |
  Fix mechanical, unambiguous typos in a post automatically — spelling,
  missing grammatical endings, homophone slips, duplicated words.
  Everything else (phrasing, formatting, tense inconsistency, anything with
  more than one reasonable fix) is listed for the user to decide, not changed.
  Use when asked to "fix typos" or "clean up typos" in a post.
allowed-tools: Read, Edit, Grep, Glob
---

# Fix Typos

Fix only the class of error that has exactly one correct reading.
Everything with a judgment call in it gets listed for the user instead of
silently changed.

## Why this skill exists

Typo-fixing is safe to automate only when there's no real decision being
made — a missing plural, a dropped `-ing`, a misspelled word.
The moment a fix involves phrasing, tone, or restructuring, it stops being a
typo fix and becomes an editorial choice that belongs to the author.
Blurring that line means edits silently rewrite the author's voice under the
label "typo fix".

## Arguments

`$ARGUMENTS` — path to the file to fix, or a description of which draft to
look at.
If ambiguous, use Glob on `content/posts/*.md` and pick the most recently
modified file.

## Workflow

### 1. Read the piece

Read the file specified in `$ARGUMENTS`.

### 2. Classify every candidate issue

For each surface issue found, sort it into exactly one bucket:

**Auto-fix (mechanical, one correct reading):**

- Misspelled words, verifiable against a dictionary.
- Missing grammatical endings required by agreement: dropped `-ing`, `-s`,
  `-ed` (e.g. "stop worry about" → "stop worrying about", "solve problem" →
  "solve problems").
- Homophone/function-word slips where only one reading is grammatical (e.g.
  "be then sources" → "be they sources").
- Duplicated words ("the the").
- Broken markdown syntax with an unambiguous fix (unclosed emphasis marker,
  doubled punctuation).

**Flag for the user (judgment call, do not touch):**

- Phrasing that "doesn't sound right" but has more than one plausible fix.
- Formatting choices (emphasis style, list structure, quote formatting)
  unless the markdown is outright broken.
- Tense or voice inconsistencies across sentences or paragraphs.
- Word choice, awkward sentence structure, anything where fixing it changes
  meaning or voice.
- Any case where you're not confident there's exactly one correct fix.

When unsure which bucket an issue belongs to, default to flagging it — this
skill only automates the fixes with no real decision in them.

### 3. Apply only the auto-fix bucket

Edit the file for every mechanical fix identified.
Do not apply anything from the flagged bucket.

### 4. Report both lists

Present two lists:

- **Fixed automatically** — line number, original text, fix applied.
- **Needs your call** — line number, what's off, and (if useful) the fix you
  would have made, framed as a suggestion, not applied.

Keep the report mechanical for the fixed list and brief for the flagged
list — this is a diff to scan, not an essay.
