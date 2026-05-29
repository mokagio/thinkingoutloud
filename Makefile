.PHONY: new

# Repeated words in a title (e.g. "The End ... The End") arrive as duplicate
# command-line goals, and make prints "`The' is up to date." for each repeat.
# Silent mode suppresses that; recipes below echo explicitly, so real output stays.
MAKEFLAGS += --silent

# Usage: make new Post Title In Natural Language
# Creates content/posts/YYYY-MM-DD-post-title-in-natural-language.md via `hugo new`.
new:
	@words="$(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))"; \
	if [ -z "$$words" ]; then \
		echo "Usage: make new Post Title In Natural Language"; \
		exit 1; \
	fi; \
	slug=$$(echo "$$words" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-'); \
	date=$$(date +%Y-%m-%d); \
	hugo new content/posts/$$date-$$slug.md; \
	if [ -n "$$EDITOR" ]; then \
		$$EDITOR content/posts/$$date-$$slug.md; \
	else \
		echo "\$$EDITOR not set; skipping open."; \
	fi

# Swallow the trailing words so make doesn't complain about missing targets.
%:
	@:
