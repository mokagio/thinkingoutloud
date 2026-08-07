---
name: fill-book-links
description: |
  Fill in missing or empty markdown links for books cited in a post, using
  the same amazon.com convention already used across the corpus.
  Use when asked to "fill in the book links", "add the missing links",
  or when a draft cites a book with an empty `()` or no link at all.
allowed-tools: Read, Edit, Grep, Glob, WebSearch
---

# Fill Book Links

Find book citations in a post that have no link, or an empty `()`, and fill
them in with a working amazon.com link — matching how every other book
citation in this corpus is linked.

## Why this skill exists

Draft posts often cite a book by title while writing, with the link left
empty (`[_Title_]()`) as a placeholder to fill in later.
This skill closes that placeholder consistently, using the same source
(amazon.com) and the same link shape as the rest of the corpus, instead of
whatever link shape shows up first in a search.

## Arguments

`$ARGUMENTS` — path to the file to fix, or a description of which draft to
look at (e.g. "the latest post").
If ambiguous, use Glob on `content/posts/*.md` and pick the most recently
modified file.

## Workflow

### 1. Read the target post

Read the file specified in `$ARGUMENTS`.

### 2. Find unlinked book citations

Look for:

- Empty markdown links: `[_Title_]()`.
- Book titles mentioned in italics or quotes with no link at all, where
  surrounding prose makes clear it's a book citation (e.g. "in his book
  _Title_").

### 3. Establish the corpus convention

Grep `content/posts/*.md` for `amazon.com` to confirm the link shape in use:

```
[_Title_](https://www.amazon.com/.../dp/ISBN-OR-ASIN)
```

### 4. Check for an existing link to the same book first

Grep the corpus for the book's title.
If another post already links to it, reuse that exact URL — do not pick a
different edition than the one already established.

### 5. Otherwise, find the canonical link

Search the web for the book's amazon.com listing.
Prefer, in order:

1. The edition the author's own site or publisher lists as canonical.
2. A standard print edition (hardcover or paperback) over Kindle/audiobook,
   unless no print edition exists.
3. The `.com` (US) storefront, matching the rest of the corpus.

### 6. Apply the link

Edit the file, preserving the corpus's italic-title-in-link style:
`[_Title_](url)`.
Do not touch surrounding prose — this skill only fills links, it does not
edit wording.

### 7. Report back

List each link filled in, with the title, the URL chosen, and — when a
choice between editions existed — why that edition was picked.
Edition choice is a judgment call; surface it rather than silently picking
one.
