.PHONY: new

# Usage: make new Post Title In Natural Language
# Creates content/posts/post-title-in-natural-language.md via `hugo new`.
new:
	@words="$(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))"; \
	if [ -z "$$words" ]; then \
		echo "Usage: make new Post Title In Natural Language"; \
		exit 1; \
	fi; \
	slug=$$(echo "$$words" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-'); \
	hugo new content/posts/$$slug.md

# Swallow the trailing words so make doesn't complain about missing targets.
%:
	@:
