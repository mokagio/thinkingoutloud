## Setup

Install Hugo via Homebrew:

```
brew install hugo
```

The theme is a git submodule.
On a fresh clone, pull it in with:

```
git submodule update --init --recursive
```

Run the local server with drafts enabled:

```
hugo server -D
```

## New post

Add new posts with stubbed front matter with

```
hugo new content posts/<title>.md
```
