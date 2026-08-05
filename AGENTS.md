Hugo blog. See [`README.md`](README.md) for setup and the new-post command.

## Apostrophes and quotes in post source

Don't flag mixed straight (`'`) and curly (`’`) apostrophes in Markdown source, and don't normalise them.
Goldmark's typographer is enabled in `hugo.toml`, so straight apostrophes render as `&rsquo;` and already-curly ones pass through unchanged — both produce the same HTML.
The same applies to quotes, dashes, and ellipses.
