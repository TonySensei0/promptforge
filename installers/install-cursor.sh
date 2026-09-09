#!/usr/bin/env bash
# PromptForge — Cursor Installer
# Installs PromptForge commands and rules into a Cursor project.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
VERSION="$(cat "$PROJECT_ROOT/VERSION")"

# Source for Cursor adapter
CURSOR_SOURCE="$PROJECT_ROOT/adapters/cursor/.cursor"

REQUIRED_COMMANDS=(
  "refine-architect"
  "refine-build"
  "refine-debug"
  "refine-frontend"
  "refine-performance"
  "refine-security"
)

echo "=== PromptForge v${VERSION} — Cursor Installer ==="
echo ""

# Validate target directory
TARGET_DIR="${1:-.}"
if [[ ! -d "$TARGET_DIR" ]]; then
  echo "ERROR: Target directory not found: $TARGET_DIR"
  echo "Usage: $(basename "$0") <path-to-project>"
  exit 1
fi

TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"
CURSOR_TARGET="$TARGET_DIR/.cursor"
COMMANDS_TARGET="$CURSOR_TARGET/commands"
RULES_TARGET="$CURSOR_TARGET/rules"

echo "Target project: $TARGET_DIR"
echo ""

# Validate source exists
if [[ ! -d "$CURSOR_SOURCE" ]]; then
  echo "ERROR: Cursor adapter source not found: $CURSOR_SOURCE"
  echo "Run this installer from the PromptForge project root."
  exit 1
fi

# Backup existing .cursor if it has files we don't own
if [[ -d "$CURSOR_TARGET" ]]; then
  EXISTING_FILES=$(find "$CURSOR_TARGET" -maxdepth 2 -type f ! -name "promptforge*" ! -name "refine-*" 2>/dev/null | wc -l)
  if [[ "$EXISTING_FILES" -gt 0 ]]; then
    echo "WARNING: $CURSOR_TARGET already exists with $EXISTING_FILES existing file(s)."
    echo "PromptForge will only add its own files. Existing files will be preserved."
    echo ""
  fi
fi

# Create directories
mkdir -p "$COMMANDS_TARGET" "$RULES_TARGET"

INSTALLED=0
SKIPPED=0

# Install commands
for cmd in "${REQUIRED_COMMANDS[@]}"; do
  SRC="$CURSOR_SOURCE/commands/$cmd.md"
  DEST="$COMMANDS_TARGET/$cmd.md"

  if [[ ! -f "$SRC" ]]; then
    echo "WARNING: Source command not found: $SRC — skipping"
    continue
  fi

  if [[ -f "$DEST" ]]; then
    # Check if existing file is a PromptForge file
    if grep -q "PromptForge" "$DEST" 2>/dev/null; then
      echo "  $cmd — already installed (skipping)"
      SKIPPED=$((SKIPPED + 1))
    else
      echo "  $cmd — SKIPPED (existing file is not PromptForge-owned: $DEST)"
      SKIPPED=$((SKIPPED + 1))
    fi
  else
    cp "$SRC" "$DEST"
    echo "  $cmd — installed"
    INSTALLED=$((INSTALLED + 1))
  fi
done

# Install project rule
RULE_SRC="$CURSOR_SOURCE/rules/promptforge.mdc"
RULE_DEST="$RULES_TARGET/promptforge.mdc"

if [[ -f "$RULE_SRC" ]]; then
  if [[ -f "$RULE_DEST" ]]; then
    echo "  promptforge.mdc — already exists (skipping)"
    SKIPPED=$((SKIPPED + 1))
  else
    cp "$RULE_SRC" "$RULE_DEST"
    echo "  promptforge.mdc — installed"
    INSTALLED=$((INSTALLED + 1))
  fi
fi

echo ""
echo "=== Installation Complete ==="
echo "Installed: $INSTALLED | Skipped: $SKIPPED"
echo ""
echo "Next steps:"
echo "  1. Open the project in Cursor"
echo "  2. Use the command palette (Ctrl+Shift+P / Cmd+Shift+P)"
echo "  3. Search for: PromptForge: Refine Build"
echo ""
echo "Available commands:"
for cmd in "${REQUIRED_COMMANDS[@]}"; do
  echo "  - PromptForge: Refine $(echo "$cmd" | sed 's/refine-//' | sed 's/\b\(.\)/\u\1/g')"
done
