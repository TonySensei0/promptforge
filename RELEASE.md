# Release Process

This document describes how to publish a new PromptForge release.

## Prerequisites

- Git configured with commit access to the repository
- GitHub CLI (`gh`) authenticated
- All tests passing
- Installers tested on clean environments

## Release Checklist

### 1. Update Version

Update the `VERSION` file at the project root.

```bash
echo "1.0.0" > VERSION
```

Update `CHANGELOG.md` — move items from `[Unreleased]` to the new version section.

### 2. Run Tests

```bash
# Validate all examples
for ex in examples/*.md; do
  bash scripts/validate-output.sh "$ex"
done

# Verify installation for all platforms
bash scripts/verify-installation.sh claude
bash scripts/verify-installation.sh antigravity
bash scripts/verify-installation.sh cursor

# Test uninstaller
bash installers/install.sh claude
bash installers/install.sh antigravity
bash installers/install.sh cursor
bash installers/uninstall.sh claude
bash installers/uninstall.sh antigravity
bash installers/uninstall.sh cursor
```

### 3. Validate JSON

```bash
# Validate the schema
python3 -c "import json; json.load(open('schemas/refined-prompt.schema.json'))"
echo "Schema: OK"

# Validate marketplace and plugin manifests
python3 -c "import json; json.load(open('.claude-plugin/marketplace.json'))"
python3 -c "import json; json.load(open('plugins/promptforge/.claude-plugin/plugin.json'))"
echo "Manifests: OK"
```

### 4. Validate Installers

```bash
# Make sure all installers are executable
chmod +x installers/*.sh scripts/*.sh

# Test the universal installer
bash installers/install.sh --help
bash installers/install.sh --version

# Test each platform installer with --help or dry-run
```

### 5. Test on Clean Environments

```bash
# Simulate clean Claude Code installation
TMPDIR=$(mktemp -d)
cp -r plugins/promptforge "$TMPDIR/.claude/plugins/"
bash scripts/verify-installation.sh claude
rm -rf "$TMPDIR"

# Simulate clean Antigravity installation
TMPDIR=$(mktemp -d)
ANTIGRAVITY_SKILLS_DIR="$TMPDIR/.gemini/antigravity/skills" bash installers/install-antigravity.sh
rm -rf "$TMPDIR"

# Simulate clean Cursor project
TMPDIR=$(mktemp -d)
bash installers/install-cursor.sh "$TMPDIR"
rm -rf "$TMPDIR"
```

### 6. Commit and Tag

```bash
git add -A
git commit -m "Release vX.Y.Z: <description>"
git tag -a "vX.Y.Z" -m "Release vX.Y.Z: <description>"
git push origin master
git push origin "vX.Y.Z"
```

### 7. Create GitHub Release

```bash
gh release create "vX.Y.Z" \
  --title "PromptForge vX.Y.Z" \
  --notes-file /tmp/release-notes.md
```

### 8. Update Documentation

- Update README.md installation URLs if the repository URL has changed
- Update any version references in documentation

## Versioning Policy

PromptForge follows [Semantic Versioning](https://semver.org/):

- **Major (X.0.0)**: Breaking changes to the methodology, adapter format, or plugin API
- **Minor (0.X.0)**: New features, new profiles, new adapters — backward compatible
- **Patch (0.0.X)**: Bug fixes, documentation updates, installer improvements

## Rollback

If a release has issues:

```bash
# Delete the tag
git tag -d "vX.Y.Z"
git push origin ":refs/tags/vX.Y.Z"

# Delete the GitHub release
gh release delete "vX.Y.Z"

# Fix the issue and release again
```

## Branching Model

PromptForge uses a simple branching model:

- `master` (or `main`) — stable releases only
- Feature work happens in branches and is merged via pull requests
- Tags are created on `master`/`main` for releases
