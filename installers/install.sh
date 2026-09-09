#!/usr/bin/env bash
# PromptForge Universal Installer
# Usage: ./install.sh <platform> [options]
# Platforms: claude, antigravity, cursor
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
VERSION="$(cat "$PROJECT_ROOT/VERSION")"

usage() {
  cat <<EOF
PromptForge v${VERSION} — Universal Installer

Usage:
  $(basename "$0") <platform>

Platforms:
  claude       Install for Claude Code
  antigravity  Install for Google Antigravity
  cursor       Install for Cursor

Options:
  --help       Show this help message
  --version    Show version
  --uninstall  Run the uninstaller

Examples:
  $(basename "$0") claude
  $(basename "$0") antigravity
  $(basename "$0") cursor
EOF
}

if [[ $# -eq 0 ]] || [[ "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ "${1:-}" == "--version" ]]; then
  echo "PromptForge v${VERSION}"
  exit 0
fi

if [[ "${1:-}" == "--uninstall" ]]; then
  exec "$SCRIPT_DIR/uninstall.sh" "${@:2}"
fi

PLATFORM="${1:-}"

case "$PLATFORM" in
  claude)
    echo "Installing PromptForge for Claude Code..."
    exec "$SCRIPT_DIR/install-claude-code.sh"
    ;;
  antigravity)
    echo "Installing PromptForge for Google Antigravity..."
    exec "$SCRIPT_DIR/install-antigravity.sh"
    ;;
  cursor)
    echo "Installing PromptForge for Cursor..."
    exec "$SCRIPT_DIR/install-cursor.sh"
    ;;
  *)
    echo "Error: Unknown platform '${PLATFORM}'"
    echo ""
    usage
    exit 1
    ;;
esac
