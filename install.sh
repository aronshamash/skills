#!/bin/bash

set -e

SKILLS_DIR=~/.claude/skills
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing skills to Claude Code..."

# Create skills directory if it doesn't exist
mkdir -p "$SKILLS_DIR"

# Install each skill
for skill in "$SCRIPT_DIR"/*/; do
  skill_name=$(basename "$skill")

  # Skip if not a directory or if it's a hidden directory
  if [[ ! -d "$skill" ]] || [[ "$skill_name" == .* ]]; then
    continue
  fi

  # Skip if SKILL.md doesn't exist
  if [[ ! -f "$skill/SKILL.md" ]]; then
    continue
  fi

  echo "  Installing $skill_name..."

  # Remove existing symlink or directory
  rm -rf "$SKILLS_DIR/$skill_name"

  # Create symlink
  ln -sf "$skill" "$SKILLS_DIR/$skill_name"
done

echo "✓ Skills installed successfully to $SKILLS_DIR"
echo ""
echo "Available skills:"
for skill in "$SKILLS_DIR"/*/; do
  skill_name=$(basename "$skill")
  if [[ -f "$skill/SKILL.md" ]]; then
    echo "  - /$skill_name"
  fi
done
