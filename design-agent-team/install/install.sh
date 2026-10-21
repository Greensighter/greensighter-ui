#!/usr/bin/env bash
# Run from the project root:  bash install/install.sh
# Copies the agent definitions and Figma MCP config into place, then initialises git.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p .claude/agents
cp install/project-manager.md install/ui-ux-designer.md install/reviewer.md .claude/agents/
cp install/mcp.json .mcp.json
[ -d .git ] || { git init -q && git add -A && git commit -qm "Initial design agent team setup"; }
echo "Done. Next: run 'claude' in this folder, approve the figma MCP server, run /mcp to sign in, then /agents to confirm."
