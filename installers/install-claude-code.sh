#!/usr/bin/env bash
# PromptForge — Claude Code Installer
# Installs PromptForge as a Claude Code plugin.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
VERSION="$(cat "$PROJECT_ROOT/VERSION")"
PLUGIN_NAME="promptforge"
PLUGIN_SOURCE="$PROJECT_ROOT/plugins/$PLUGIN_NAME"

echo "=== PromptForge v${VERSION} — Claude Code Installer ==="
echo ""

# Validate plugin source exists
if [[ ! -d "$PLUGIN_SOURCE" ]]; then
  echo "ERROR: Plugin source directory not found: $PLUGIN_SOURCE"
  echo "Run this installer from the PromptForge project root."
  exit 1
fi

if [[ ! -f "$PLUGIN_SOURCE/.claude-plugin/plugin.json" ]]; then
  echo "ERROR: Plugin manifest not found: $PLUGIN_SOURCE/.claude-plugin/plugin.json"
  exit 1
fi

# Detect Claude Code configuration directory
# Check for project-level .claude first, then user-level
if [[ -n "${CLAUDE_CODE_DIR:-}" ]]; then
  TARGET_DIR="$CLAUDE_CODE_DIR"
elif [[ -d ".claude" ]]; then
  TARGET_DIR="$(pwd)/.claude"
else
  TARGET_DIR="$HOME/.claude"
fi

PLUGIN_TARGET="$TARGET_DIR/plugins/$PLUGIN_NAME"

echo "Target directory: $TARGET_DIR"
echo "Plugin target:   $PLUGIN_TARGET"
echo ""

# Create target directories
mkdir -p "$TARGET_DIR/plugins"

# Check if plugin already exists
if [[ -d "$PLUGIN_TARGET" ]]; then
  echo "PromptForge plugin already exists at: $PLUGIN_TARGET"
  read -r -p "Overwrite existing installation? [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY])
      echo "Removing existing installation..."
      rm -rf "$PLUGIN_TARGET"
      ;;
    *)
      echo "Installation cancelled."
      exit 0
      ;;
  esac
fi

# Install plugin
echo "Installing plugin..."
cp -R "$PLUGIN_SOURCE" "$PLUGIN_TARGET"

# Validate installation
echo ""
echo "Validating installation..."
if [[ ! -f "$PLUGIN_TARGET/.claude-plugin/plugin.json" ]]; then
  echo "ERROR: Plugin manifest missing after installation."
  exit 1
fi

SKILL_COUNT=$(find "$PLUGIN_TARGET/skills" -maxdepth 2 -name "SKILL.md" 2>/dev/null | wc -l)
if [[ "$SKILL_COUNT" -lt 8 ]]; then
  echo "WARNING: Expected 8 skills, found $SKILL_COUNT"
else
  echo "Skills installed: $SKILL_COUNT"
fi

echo ""
echo "=== Installation Complete ==="
echo ""
echo "Next steps:"
echo "  1. Restart Claude Code"
echo "  2. Use /promptforge:refine-build <your request>"
echo ""
echo "Available skills:"
for skill in refine-build refine-architect refine-security refine-performance refine-frontend refine-backend refine-product refine-debug; do
  echo "  - /promptforge:$skill"
done
