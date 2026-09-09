#!/usr/bin/env bash
# PromptForge — Antigravity Installer
# Installs PromptForge skills for Google Antigravity.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
VERSION="$(cat "$PROJECT_ROOT/VERSION")"

ANTIGRAVITY_SKILLS_DIR="${ANTIGRAVITY_SKILLS_DIR:-$HOME/.gemini/antigravity/skills}"
REQUIRED_SKILLS=(
  "refine-build"
  "refine-architect"
  "refine-security"
  "refine-performance"
  "refine-frontend"
  "refine-backend"
  "refine-product"
  "refine-debug"
)

# Source for skills: use the Antigravity adapter
SKILL_SOURCE="$PROJECT_ROOT/adapters/antigravity/.agents/skills"

echo "=== PromptForge v${VERSION} — Antigravity Installer ==="
echo ""

# Validate source exists
if [[ ! -d "$SKILL_SOURCE" ]]; then
  echo "ERROR: Skill source directory not found: $SKILL_SOURCE"
  echo "Run this installer from the PromptForge project root."
  exit 1
fi

# Check if Antigravity directory exists (may not, for new users)
if [[ ! -d "$ANTIGRAVITY_SKILLS_DIR" ]]; then
  echo "Creating Antigravity skills directory: $ANTIGRAVITY_SKILLS_DIR"
  mkdir -p "$ANTIGRAVITY_SKILLS_DIR"
fi

echo "Target directory: $ANTIGRAVITY_SKILLS_DIR"
echo ""

INSTALLED=0
SKIPPED=0

for skill in "${REQUIRED_SKILLS[@]}"; do
  DEST="$ANTIGRAVITY_SKILLS_DIR/$skill"
  SRC="$SKILL_SOURCE/$skill"

  if [[ ! -d "$SRC" ]]; then
    echo "WARNING: Source skill not found: $SRC — skipping"
    continue
  fi

  if [[ -d "$DEST" ]]; then
    echo "  $skill — already exists (skipping)"
    SKIPPED=$((SKIPPED + 1))
  else
    cp -R "$SRC" "$DEST"
    # Make SKILL.md executable isn't required but ensure directory is clean
    echo "  $skill — installed"
    INSTALLED=$((INSTALLED + 1))
  fi
done

echo ""
echo "=== Installation Complete ==="
echo "Installed: $INSTALLED | Skipped: $SKIPPED"
echo ""
echo "Next steps:"
echo "  1. Restart Google Antigravity"
echo "  2. Use: /refine-build <your request>"
echo ""
echo "Available commands:"
for skill in "${REQUIRED_SKILLS[@]}"; do
  echo "  - /$skill"
done
