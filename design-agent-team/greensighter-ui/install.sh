#!/usr/bin/env bash
# Install the Claude design agent team into a project.
# Usage:  bash install.sh /path/to/your/project      (defaults to the current folder)
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)"
TARGET="${1:-$PWD}"
mkdir -p "$TARGET"
cd "$TARGET"

echo "Installing into: $TARGET"

# Charter
if [ -f CLAUDE.md ]; then
  cp "$SRC/CLAUDE.md" CLAUDE.team.md
  echo "! CLAUDE.md already exists. Wrote CLAUDE.team.md; merge it into CLAUDE.md yourself."
else
  cp "$SRC/CLAUDE.md" CLAUDE.md
fi

# Agents
mkdir -p .claude/agents
for f in project-manager ui-ux-designer reviewer; do
  cp "$SRC/agents/$f.md" ".claude/agents/$f.md"
done

# Figma MCP
if [ -f .mcp.json ]; then
  echo "! .mcp.json already exists. Add this server to it yourself:"
  cat "$SRC/mcp.json"
else
  cp "$SRC/mcp.json" .mcp.json
fi

# Templates, design system (source of truth), kickoff
mkdir -p templates design docs/features design/flows src reviews handoffs
cp "$SRC"/templates/*.md templates/
cp "$SRC"/design-system/* design/
cp "$SRC/kickoff/KICKOFF.md" KICKOFF.md
[ -f docs/backlog.md ] || printf '# Backlog\n\nOwned by the Project Manager.\n\n| ID | Title | Priority | Status | Owner | Notes |\n|---|---|---|---|---|---|\n' > docs/backlog.md
[ -f handoffs/_log.md ] || printf '# Coordinator log\n\n| Timestamp | Agent | Action | Result |\n|---|---|---|---|\n' > handoffs/_log.md
touch docs/features/.gitkeep design/flows/.gitkeep src/.gitkeep reviews/.gitkeep

cat <<'EOF2'

Done. Next:
  1. cd "$TARGET" and run: claude
  2. Approve the figma MCP server, run /mcp and sign in to Figma.
  3. Run /agents and check that project-manager, ui-ux-designer and reviewer are listed.
  4. Fill in the brackets in KICKOFF.md and paste it into the session.
EOF2
