#!/usr/bin/env bash
# PromptForge — Universal Uninstaller
# Removes PromptForge files from Claude Code, Antigravity, or Cursor.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
VERSION="$(cat "$PROJECT_ROOT/VERSION")"

usage() {
  cat <<EOF
PromptForge v${VERSION} — Uninstaller

Usage:
  $(basename "$0") <platform>

Platforms:
  claude       Remove PromptForge from Claude Code
  antigravity  Remove PromptForge from Google Antigravity
  cursor       Remove PromptForge from Cursor project

WARNING:
  This script only removes PromptForge-owned files.
  It will NOT delete your entire ~/.claude/, ~/.gemini/, or .cursor/ directory.
EOF
}

if [[ $# -eq 0 ]]; then
  usage
  exit 1
fi

PLATFORM="${1:-}"

case "$PLATFORM" in
  claude)
    uninstall_claude_code
    ;;
  antigravity)
    uninstall_antigravity
    ;;
  cursor)
    uninstall_cursor
    ;;
  *)
    echo "Error: Unknown platform '${PLATFORM}'"
    usage
    exit 1
    ;;
esac

uninstall_claude_code() {
  echo "=== PromptForge v${VERSION} — Claude Code Uninstaller ==="
  echo ""

  TARGET_DIR="${CLAUDE_CODE_DIR:-$HOME/.claude}"
  PLUGIN_TARGET="$TARGET_DIR/plugins/promptforge"

  if [[ ! -d "$PLUGIN_TARGET" ]]; then
    echo "PromptForge plugin not found at: $PLUGIN_TARGET"
    echo "Nothing to uninstall."
    exit 0
  fi

  echo "Found PromptForge plugin at: $PLUGIN_TARGET"
  read -r -p "Remove PromptForge plugin? [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY])
      rm -rf "$PLUGIN_TARGET"
      echo "Removed: $PLUGIN_TARGET"
      echo ""
      echo "Note: The plugins/ directory in ~/.claude/ was preserved."
      ;;
    *)
      echo "Uninstall cancelled."
      exit 0
      ;;
  esac
}

uninstall_antigravity() {
  echo "=== PromptForge v${VERSION} — Antigravity Uninstaller ==="
  echo ""

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

  if [[ ! -d "$ANTIGRAVITY_SKILLS_DIR" ]]; then
    echo "Antigravity skills directory not found: $ANTIGRAVITY_SKILLS_DIR"
    echo "Nothing to uninstall."
    exit 0
  fi

  REMOVED=0
  for skill in "${REQUIRED_SKILLS[@]}"; do
    DEST="$ANTIGRAVITY_SKILLS_DIR/$skill"
    if [[ -d "$DEST" ]]; then
      rm -rf "$DEST"
      echo "Removed: $DEST"
      REMOVED=$((REMOVED + 1))
    fi
  done

  echo ""
  echo "Removed $REMOVED skill(s)."
  echo "Note: The skills/ directory in ~/.gemini/antigravity/ was preserved."
}

uninstall_cursor() {
  echo "=== PromptForge v${VERSION} — Cursor Uninstaller ==="
  echo ""

  TARGET_DIR="${1:-.}"
  if [[ ! -d "$TARGET_DIR/.cursor" ]]; then
    echo "No .cursor directory found at: $TARGET_DIR"
    echo "Nothing to uninstall."
    exit 0
  fi

  TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"
  CURSOR_TARGET="$TARGET_DIR/.cursor"

  COMMANDS_REMOVED=0
  RULES_REMOVED=0

  # Remove PromptForge commands
  for cmd in refine-architect refine-build refine-debug refine-frontend refine-performance refine-security; do
    FILE="$CURSOR_TARGET/commands/$cmd.md"
    if [[ -f "$FILE" ]] && grep -q "PromptForge" "$FILE" 2>/dev/null; then
      rm "$FILE"
      echo "Removed: $FILE"
      COMMANDS_REMOVED=$((COMMANDS_REMOVED + 1))
    fi
  done

  # Remove PromptForge rule
  RULE_FILE="$CURSOR_TARGET/rules/promptforge.mdc"
  if [[ -f "$RULE_FILE" ]]; then
    rm "$RULE_FILE"
    echo "Removed: $RULE_FILE"
    RULES_REMOVED=$((RULES_REMOVED + 1))
  fi

  echo ""
  echo "Removed $COMMANDS_REMOVED command(s) and $RULES_REMOVED rule(s)."
  echo "Note: The .cursor/ directory and other files were preserved."
}
