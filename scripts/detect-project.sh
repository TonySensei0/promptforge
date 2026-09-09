#!/bin/bash
# detect-project.sh — Detect project type, framework, and tooling
# Usage: ./detect-project.sh [project-directory]
# Outputs: JSON object with detected properties

PROJECT_DIR="${1:-.}"
cd "$PROJECT_DIR" 2>/dev/null || { echo '{"error": "Directory not found"}'; exit 1; }

detect_package_manager() {
    if [ -f "pnpm-lock.yaml" ]; then echo "pnpm";
    elif [ -f "yarn.lock" ]; then echo "yarn";
    elif [ -f "package-lock.json" ]; then echo "npm";
    elif [ -f "bun.lockb" ]; then echo "bun";
    elif [ -f "Cargo.lock" ]; then echo "cargo";
    elif [ -f "go.sum" ]; then echo "go";
    elif [ -f "pyproject.toml" ] || [ -f "setup.py" ] || [ -f "requirements.txt" ]; then echo "pip";
    elif [ -f "pom.xml" ]; then echo "maven";
    elif [ -f "build.gradle" ] || [ -f "build.gradle.kts" ]; then echo "gradle";
    else echo "unknown"; fi
}

detect_language() {
    if [ -f "package.json" ]; then
        if grep -q '"typescript"' package.json 2>/dev/null; then echo "TypeScript";
        elif grep -q '"type": "module"' package.json 2>/dev/null; then echo "JavaScript (ESM)";
        else echo "JavaScript"; fi
    elif [ -f "tsconfig.json" ]; then echo "TypeScript";
    elif [ -f "Cargo.toml" ]; then echo "Rust";
    elif [ -f "go.mod" ]; then echo "Go";
    elif [ -f "pyproject.toml" ]; then echo "Python";
    elif [ -f "pom.xml" ] || [ -f "build.gradle" ]; then echo "Java";
    else echo "unknown"; fi
}

detect_framework() {
    if [ -f "package.json" ]; then
        if grep -q '"next"' package.json 2>/dev/null; then echo "Next.js";
        elif grep -q '"react"' package.json 2>/dev/null; then echo "React";
        elif grep -q '"vue"' package.json 2>/dev/null; then echo "Vue";
        elif grep -q '"@angular/core"' package.json 2>/dev/null; then echo "Angular";
        elif grep -q '"express"' package.json 2>/dev/null; then echo "Express";
        elif grep -q '"fastify"' package.json 2>/dev/null; then echo "Fastify";
        elif grep -q '"nestjs/core"' package.json 2>/dev/null; then echo "NestJS";
        elif grep -q '"svelte"' package.json 2>/dev/null; then echo "Svelte";
        elif grep -q '"remix"' package.json 2>/dev/null; then echo "Remix";
        else echo "none-detected"; fi
    elif [ -f "Cargo.toml" ]; then
        if grep -q 'actix' Cargo.toml 2>/dev/null; then echo "Actix";
        elif grep -q 'axum' Cargo.toml 2>/dev/null; then echo "Axum";
        elif grep -q 'rocket' Cargo.toml 2>/dev/null; then echo "Rocket";
        elif grep -q 'diesel' Cargo.toml 2>/dev/null; then echo "Diesel (ORM)";
        else echo "Rust (no framework detected)"; fi
    elif [ -f "go.mod" ]; then
        if grep -q 'gin-gonic' go.mod 2>/dev/null; then echo "Gin";
        elif grep -q 'gorilla/mux' go.mod 2>/dev/null; then echo "Gorilla Mux";
        elif grep -q 'echo' go.mod 2>/dev/null; then echo "Echo";
        elif grep -q 'gorm' go.mod 2>/dev/null; then echo "GORM (ORM)";
        else echo "Go (no framework detected)"; fi
    else echo "unknown"; fi
}

detect_test_framework() {
    if [ -f "package.json" ]; then
        if grep -q '"vitest"' package.json 2>/dev/null; then echo "Vitest";
        elif grep -q '"jest"' package.json 2>/dev/null; then echo "Jest";
        elif grep -q '"mocha"' package.json 2>/dev/null; then echo "Mocha";
        elif grep -q '"@playwright/test"' package.json 2>/dev/null; then echo "Playwright";
        elif grep -q '"cypress"' package.json 2>/dev/null; then echo "Cypress";
        else echo "none-detected"; fi
    elif [ -f "Cargo.toml" ] && [ -d "tests" ]; then
        echo "built-in (cargo test)"
    elif [ -f "go.mod" ] && ls *_test.go >/dev/null 2>&1; then
        echo "built-in (go test)"
    else echo "none-detected"; fi
}

detect_database() {
    if [ -f "package.json" ]; then
        if grep -q '"prisma"' package.json 2>/dev/null; then echo "Prisma ORM";
        elif grep -q '"drizzle-orm"' package.json 2>/dev/null; then echo "Drizzle ORM";
        elif grep -q '"typeorm"' package.json 2>/dev/null; then echo "TypeORM";
        elif grep -q '"mongoose"' package.json 2>/dev/null; then echo "Mongoose (MongoDB)";
        elif grep -q '"pg"' package.json 2>/dev/null; then echo "PostgreSQL (pg)";
        elif grep -q 'better-sqlite3' package.json 2>/dev/null; then echo "SQLite (better-sqlite3)";
        else echo "none-detected"; fi
    elif [ -f "Cargo.toml" ]; then
        if grep -q 'diesel' Cargo.toml 2>/dev/null; then echo "Diesel (ORM)";
        elif grep -q 'sqlx' Cargo.toml 2>/dev/null; then echo "SQLx";
        elif grep -q 'sea-orm' Cargo.toml 2>/dev/null; then echo "SeaORM";
        else echo "none-detected"; fi
    elif [ -f "go.mod" ]; then
        if grep -q 'gorm' go.mod 2>/dev/null; then echo "GORM (ORM)";
        elif grep -q 'sqlx' go.mod 2>/dev/null; then echo "SQLx";
        elif grep -q 'pgx' go.mod 2>/dev/null; then echo "pgx (PostgreSQL)";
        else echo "none-detected"; fi
    else echo "unknown"; fi
}

detect_ci() {
    if [ -d ".github/workflows" ] && ls .github/workflows/*.yml >/dev/null 2>&1; then echo "GitHub Actions";
    elif [ -f ".gitlab-ci.yml" ]; then echo "GitLab CI";
    elif [ -f "Jenkinsfile" ]; then echo "Jenkins";
    elif [ -f ".circleci/config.yml" ]; then echo "CircleCI";
    else echo "none-detected"; fi
}

has_dockerfile() {
    [ -f "Dockerfile" ] || [ -f "docker-compose.yml" ] || [ -f "docker-compose.yaml" ]
}

# Build JSON output
JSON='{"language":"'"$(detect_language)"'","package_manager":"'"$(detect_package_manager)"'","framework":"'"$(detect_framework)"'","test_framework":"'"$(detect_test_framework)"'","database":"'"$(detect_database)"'","ci":"'"$(detect_ci)"'","has_typescript":'"$([ -f "tsconfig.json" ] && echo "true" || echo "false")"',"has_dockerfile":'"$(has_dockerfile && echo "true" || echo "false")"',"has_readme":'"$([ -f "README.md" ] && echo "true" || echo "false")"',"project_root":"'"$(pwd)"'"}'
echo "$JSON"
