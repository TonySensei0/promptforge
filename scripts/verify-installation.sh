#!/usr/bin/env bash
# PromptForge — Installation Verification Script
# Usage: ./verify-installation.sh <platform>
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
VERSION="$(cat "$PROJECT_ROOT/VERSION")"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

failures=0

check() {
  local label="$1"
  local result="$2"
  local detail="${3:-}"
  if [[ "$result" == "pass" ]]; then
    echo -e "  ${GREEN}✓${NC} $label"
  elif [[ "$result" == "warn" ]]; then
    echo -e "  ${YELLOW}!${NC} $label"
  else
    echo -e "  ${RED}✗${NC} $label"
    [[ -n "$detail" ]] && echo "      $detail"
    failures=$((failures + 1))
  fi
}

if [[ $# -eq 0 ]]; then
  echo "Usage: $(basename "$0") <platform>"
  echo "Platforms: claude, antigravity, cursor"
  exit 1
fi

PLATFORM="${1:-}"

echo "=== PromptForge v${VERSION} — Installation Verification ==="
echo "Platform: $PLATFORM"
echo ""

case "$PLATFORM" in
  claude)
    verify_claude
    ;;
  antigravity)
    verify_antigravity
    ;;
  cursor)
    verify_cursor
    ;;
  *)
    echo "Error: Unknown platform '${PLATFORM}'"
    exit 1
    ;;
esac

echo ""
if [[ $failures -eq 0 ]]; then
  echo -e "${GREEN}All checks passed.${NC}"
  exit 0
else
  echo -e "${RED}$failures check(s) failed.${NC}"
  exit 1
fi

verify_claude() {
  TARGET_DIR="${CLAUDE_CODE_DIR:-$HOME/.claude}"
  PLUGIN_TARGET="$TARGET_DIR/plugins/promptforge"

  echo "Checking Claude Code plugin..."
  echo ""

  check "Plugin directory exists" "$( [[ -d "$PLUGIN_TARGET" ]] && echo pass || echo fail )" "$PLUGIN_TARGET"
  check "Plugin manifest exists" "$( [[ -f "$PLUGIN_TARGET/.claude-plugin/plugin.json" ]] && echo pass || echo fail )"

  if [[ -f "$PLUGIN_TARGET/.claude-plugin/plugin.json" ]]; then
    NAME=$(grep '"name"' "$PLUGIN_TARGET/.claude-plugin/plugin.json" | head -1 | sed 's/.*: *"//;s/".*//')
    check "Plugin name is 'promptforge'" "$( [[ "$NAME" == "promptforge" ]] && echo pass || echo fail )" "Found: $NAME"
  fi

  check "Marketplace manifest exists" "$( [[ -f "$PROJECT_ROOT/.claude-plugin/marketplace.json" ]] && echo pass || echo fail )"

  # Check skills
  SKILLS_DIR="$PLUGIN_TARGET/skills"
  EXPECTED_SKILLS=(refine-build refine-architect refine-security refine-performance refine-frontend refine-backend refine-product refine-debug)
  FOUND_SKILLS=0
  for skill in "${EXPECTED_SKILLS[@]}"; do
    [[ -f "$SKILLS_DIR/$skill/SKILL.md" ]] && FOUND_SKILLS=$((FOUND_SKILLS + 1))
  done
  check "All 8 skills installed ($FOUND_SKILLS/8)" "$( [[ "$FOUND_SKILLS" -eq 8 ]] && echo pass || echo fail )"

  # Check core references
  check "Core methodology bundled" "$( [[ -f "$SKILLS_DIR/_core/base-protocol.md" ]] && echo pass || echo fail )"

  echo ""
  echo "Marketplace info:"
  if [[ -f "$PROJECT_ROOT/.claude-plugin/marketplace.json" ]]; then
    MARKETPLACE_NAME=$(grep '"name"' "$PROJECT_ROOT/.claude-plugin/marketplace.json" | head -1 | sed 's/.*: *"//;s/".*//')
    echo "  Marketplace: $MARKETPLACE_NAME"
    echo "  Plugin: promptforge"
  fi
}

verify_antigravity() {
  ANTIGRAVITY_SKILLS_DIR="${ANTIGRAVITY_SKILLS_DIR:-$HOME/.gemini/antigravity/skills}"
  EXPECTED_SKILLS=(refine-build refine-architect refine-security refine-performance refine-frontend refine-backend refine-product refine-debug)

  echo "Checking Antigravity skills..."
  echo ""

  check "Antigravity skills directory exists" "$( [[ -d "$ANTIGRAVITY_SKILLS_DIR" ]] && echo pass || echo fail )" "$ANTIGRAVITY_SKILLS_DIR"

  FOUND=0
  for skill in "${EXPECTED_SKILLS[@]}"; do
    if [[ -f "$ANTIGRAVITY_SKILLS_DIR/$skill/SKILL.md" ]]; then
      FOUND=$((FOUND + 1))
    fi
  done
  check "All 8 SKILL.md files present ($FOUND/8)" "$( [[ "$FOUND" -eq 8 ]] && echo pass || echo fail )"

  # Check that each skill has content
  for skill in "${EXPECTED_SKILLS[@]}"; do
    if [[ -f "$ANTIGRAVITY_SKILLS_DIR/$skill/SKILL.md" ]]; then
      SIZE=$(wc -c < "$ANTIGRAVITY_SKILLS_DIR/$skill/SKILL.md")
      check "  $skill/SKILL.md is non-empty ($SIZE bytes)" "$( [[ "$SIZE" -gt 0 ]] && echo pass || echo fail )"
    fi
  done
}

verify_cursor() {
  TARGET_DIR="${1:-.}"
  if [[ ! -d "$TARGET_DIR/.cursor" ]]; then
    echo "Checking Cursor project..."
    echo ""
    check ".cursor directory exists" "fail" "$TARGET_DIR/.cursor not found"
    return
  fi

  TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"
  CURSOR_TARGET="$TARGET_DIR/.cursor"

  echo "Checking Cursor project: $TARGET_DIR"
  echo ""

  check ".cursor/commands/ directory exists" "$( [[ -d "$CURSOR_TARGET/commands" ]] && echo pass || echo fail )"
  check ".cursor/rules/ directory exists" "$( [[ -d "$CURSOR_TARGET/rules" ]] && echo pass || echo fail )"

  EXPECTED_COMMANDS=(refine-architect.md refine-build.md refine-debug.md refine-frontend.md refine-performance.md refine-security.md)
  FOUND=0
  for cmd in "${EXPECTED_COMMANDS[@]}"; do
    [[ -f "$CURSOR_TARGET/commands/$cmd" ]] && FOUND=$((FOUND + 1))
  done
  check "All 6 command files present ($FOUND/6)" "$( [[ "$FOUND" -eq 6 ]] && echo pass || echo fail )"

  check "promptforge.mdc rule exists" "$( [[ -f "$CURSOR_TARGET/rules/promptforge.mdc" ]] && echo pass || echo fail )"

  # Check that our files contain "PromptForge"
  OWNED=0
  for cmd in "${EXPECTED_COMMANDS[@]}"; do
    if [[ -f "$CURSOR_TARGET/commands/$cmd" ]] && grep -q "PromptForge" "$CURSOR_TARGET/commands/$cmd"; then
      OWNED=$((OWNED + 1))
    fi
  done
  check "Command files are PromptForge-owned ($OWNED/6)" "$( [[ "$OWNED" -eq 6 ]] && echo pass || echo warn )"
}
