#!/bin/bash
# validate-output.sh — Validate that a PromptForge refinement output contains all required sections
# Usage: ./validate-output.sh <file.md>
# Exit codes: 0 = valid, 1 = missing required sections

INPUT="${1:-}"
if [ -z "$INPUT" ] || [ ! -f "$INPUT" ]; then
    echo "ERROR: Please provide a valid markdown file."
    echo "Usage: $0 <file.md>"
    exit 1
fi

FAIL=0

# Required top-level sections
echo "=== Validating PromptForge Output ==="
echo ""

check_section() {
    local label="$1"
    local pattern="$2"
    if grep -q "$pattern" "$INPUT"; then
        echo "  ✓ $label"
    else
        echo "  ✗ $label — MISSING"
        FAIL=1
    fi
}

echo "Top-level sections:"
check_section "Original Request" "^# Original Request"
check_section "Understanding" "^# Understanding"
check_section "Confirmed Requirements" "^# Confirmed Requirements"
check_section "Assumptions" "^# Assumptions"
check_section "Missing Decisions" "^# Missing Decisions"
check_section "Scope" "^# Scope"
check_section "Non-Goals" "^# Non-Goals"
check_section "Repository Context" "^# Repository Context"
check_section "Refined Implementation Prompt" "^# Refined Implementation Prompt"
check_section "Quality Review" "^# Quality Review"
check_section "Approval Gate" "approve"

echo ""
echo "Refined Implementation Prompt subsections:"
check_section "Objective" "^## Objective"
check_section "Existing Context" "^## Existing Context"
check_section "User Stories" "^## User Stories"
check_section "Functional Requirements" "^## Functional Requirements"
check_section "Technical Constraints" "^## Technical Constraints"
check_section "Error States" "^## Error States"
check_section "Empty States" "^## Empty States"
check_section "Security Requirements" "^## Security Requirements"
check_section "Testing Requirements" "^## Testing Requirements"
check_section "Acceptance Criteria" "^## Acceptance Criteria"
check_section "Implementation Phases" "^## Implementation Phases"
check_section "Verification Commands" "^## Verification Commands"

echo ""
echo "Quality checks:"

# Check that assumptions are labeled (not buried in requirements)
ASSUMPTION_COUNT=$(grep -ic "assumption" "$INPUT" 2>/dev/null || echo 0)
if [ "$ASSUMPTION_COUNT" -gt 0 ]; then
    echo "  ✓ Assumptions are mentioned ($ASSUMPTION_COUNT references)"
else
    echo "  ✗ No assumptions found — assumptions must be explicitly labeled"
    FAIL=1
fi

# Check for approval gate
if grep -qi "approve" "$INPUT"; then
    echo "  ✓ Approval gate present"
else
    echo "  ✗ Approval gate MISSING — must end with 'approve' instruction"
    FAIL=1
fi

# Check for code blocks (should not have implementation code)
CODE_BLOCK_COUNT=$(grep -c '```' "$INPUT" 2>/dev/null || echo 0)
# Code blocks are OK in verification commands section
echo "  ℹ Code blocks found: $((CODE_BLOCK_COUNT / 2))"

# Check acceptance criteria are not vague
VAGUE_PATTERNS="user.friendly\|performant\|nice\|good UX\|intuitive\|beautiful\|modern\|clean"
VAGUE_COUNT=$(grep -iE "$VAGUE_PATTERNS" "$INPUT" 2>/dev/null | wc -l)
if [ "$VAGUE_COUNT" -eq 0 ]; then
    echo "  ✓ No vague acceptance criteria detected"
else
    echo "  ⚠ $VAGUE_COUNT potentially vague terms found in acceptance criteria — review for specificity"
fi

# Check for implementation phase count
PHASE_COUNT=$(grep -c "^### Phase" "$INPUT" 2>/dev/null || echo 0)
if [ "$PHASE_COUNT" -ge 2 ]; then
    echo "  ✓ Multiple implementation phases defined ($PHASE_COUNT)"
else
    echo "  ⚠ Fewer than 2 implementation phases found — consider breaking work into phases"
fi

echo ""
if [ "$FAIL" -eq 0 ]; then
    echo "=== VALIDATION PASSED ==="
    exit 0
else
    echo "=== VALIDATION FAILED ==="
    echo "Missing required sections. See ✗ marks above."
    exit 1
fi
