A blog where Gio posts rough ideas, open questions, short remarks.
As the title suggests, this is a place for _thinking out loud_.
Therefore, when asked for review, you don't need to remark on the open ended state of posts.

## Tech stack

This is a Hugo blog.
See [`README.md`](README.md) for setup and the new-post command.

## Apostrophes and quotes in post source

Don't flag mixed straight (`'`) and curly (`’`) apostrophes in Markdown source, and don't normalise them.
Goldmark's typographer is enabled in `hugo.toml`, so straight apostrophes render as `&rsquo;` and already-curly ones pass through unchanged — both produce the same HTML.
The same applies to quotes, dashes, and ellipses.
