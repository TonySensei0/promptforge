#!/bin/bash
# collect-context.sh — Gather repository context for PromptForge refinement
# Usage: ./collect-context.sh [project-directory]
# Outputs: A structured context summary for the refinement process

PROJECT_DIR="${1:-.}"
cd "$PROJECT_DIR" 2>/dev/null || { echo "ERROR: Directory not found: $PROJECT_DIR"; exit 1; }

echo "=== REPOSITORY CONTEXT ==="
echo ""
echo "## Project Detection"
bash "$(dirname "$0")/detect-project.sh" "$PROJECT_DIR" | python3 -m json.tool 2>/dev/null || bash "$(dirname "$0")/detect-project.sh" "$PROJECT_DIR"

echo ""
echo "## Project Structure"
echo "Top-level files and directories:"
ls -1 "$PROJECT_DIR" | head -30

echo ""
echo "## Configuration Files Present"
for f in package.json Cargo.toml go.mod pyproject.toml pom.xml build.gradle tsconfig.json Dockerfile docker-compose.yml .env.example .env Makefile; do
    [ -f "$f" ] && echo "  ✓ $f" || echo "  ✗ $f"
done

echo ""
echo "## README Summary"
if [ -f "README.md" ]; then
    head -20 README.md
else
    echo "  No README.md found"
fi

echo ""
echo "## Git Status"
if git rev-parse --git-dir >/dev/null 2>&1; then
    echo "  Branch: $(git branch --show-current 2>/dev/null)"
    echo "  Recent commits:"
    git log --oneline -5 2>/dev/null || echo "  (no commits or detached HEAD)"
else
    echo "  Not a git repository"
fi

echo ""
echo "## Environment Variables (from .env.example if present)"
if [ -f ".env.example" ]; then
    grep -E '^[A-Z_]+=' .env.example 2>/dev/null | head -20
elif [ -f ".env" ]; then
    # Show only variable names, not values
    grep -E '^[A-Z_]+=' .env 2>/dev/null | sed 's/=.*/=***/' | head -20
else
    echo "  No .env.example or .env found"
fi

echo ""
echo "## Test Setup"
if [ -f "package.json" ]; then
    echo "  Test script: $(grep '"test"' package.json 2>/dev/null | head -1)"
    echo "  Lint script: $(grep '"lint"' package.json 2>/dev/null | head -1)"
    echo "  Build script: $(grep '"build"' package.json 2>/dev/null | head -1)"
    echo "  Dev script: $(grep '"dev"' package.json 2>/dev/null | head -1)"
elif [ -f "Makefile" ]; then
    echo "  Available make targets:"
    grep '^[a-zA-Z_-]*:' Makefile | head -10
elif [ -f "Cargo.toml" ]; then
    echo "  Cargo test: cargo test"
    echo "  Cargo run: cargo run"
    echo "  Cargo check: cargo check"
fi

echo ""
echo "## Framework-Specific Patterns"

# Detect auth patterns
echo "### Authentication"
if [ -d "src/auth" ] || [ -d "app/api/auth" ] || [ -d "routes/auth" ]; then
    echo "  Auth directory found:"
    find . -type d -name "auth" | head -5
else
    echo "  No dedicated auth directory found"
fi

# Detect API patterns
echo "### API Routes"
if [ -d "app/api" ]; then
    echo "  Next.js API routes found in app/api/"
    ls app/api/ 2>/dev/null | head -10
elif [ -d "src/routes" ] || [ -d "routes" ]; then
    echo "  Route directory found"
elif [ -d "api" ]; then
    echo "  API directory found"
else
    echo "  No standard API directory found"
fi

# Detect database files
echo "### Database"
if [ -f "prisma/schema.prisma" ]; then
    echo "  Prisma schema found at prisma/schema.prisma"
    echo "  Models:"
    grep '^model ' prisma/schema.prisma 2>/dev/null
elif [ -f "drizzle.config.ts" ] || [ -f "drizzle.config.js" ]; then
    echo "  Drizzle ORM config found"
elif ls src/migrations >/dev/null 2>&1 || ls migrations >/dev/null 2>&1; then
    echo "  Migration directory found"
fi

echo ""
echo "=== END CONTEXT ==="
