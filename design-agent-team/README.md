# Design Agent Team

Three cooperating Claude Code subagents: **project-manager**, **ui-ux-designer**, **reviewer**.
Frontend only, no backend. Design in Figma, build as a static site, deploy to a static host.

## Layout
- `CLAUDE.md`: team charter loaded for every agent
- `.claude/agents/`: the three agent definitions
- `.mcp.json`: Figma MCP server (approve it on first launch)
- `templates/`: handoff, feature spec, review report
- `docs/`: brief, feature specs, backlog (PM)
- `design/`: design system source of truth (design-system.md, tokens.css, tokens.json, components.md), flows, Figma links (Designer)
- `src/`: the static frontend (Designer)
- `reviews/`: review reports (Reviewer)
- `handoffs/`: notes between agents, plus `_log.md`
- `KICKOFF.md`: prompt that starts a project

## First run
1. `cd` into this folder and run `claude`.
2. Approve the `figma` MCP server when asked, then run `/mcp` and sign in to Figma.
3. Run `/agents` and confirm the three agents are listed.
4. Open `KICKOFF.md`, fill in the brackets, and paste it.

Needs Claude Code installed and a Figma account. Deploying needs a static host account (Vercel, Netlify, Cloudflare Pages or GitHub Pages).
