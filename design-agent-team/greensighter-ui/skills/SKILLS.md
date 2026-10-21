# Recommended skills

These third-party skills were used alongside the agent team. They are NOT copied into this repository: each has its own licence (one of them, transitions-dev, forbids redistributing the library). Install each one from its source.

| Skill | What it does | Source and licence note |
|---|---|---|
| transitions-dev, transitions-polish, transitions-ui-generation | 35 production CSS transitions, motion-token audit, "AI is generating this UI" reveal | https://github.com/Jakubantalik/transitions.dev (free for personal and commercial use, no redistribution of the library) |
| unslop (audit) | Finds the tells of AI-generated or low-craft UI and writes fix plans | https://github.com/0design/unslop-skill (MIT and CC-BY-4.0). Needs its canon MCP server for a verified pass: use the Claude Code plugin where possible |
| aindf-screen-author | Builds screens only from a design system through a design-system MCP | https://github.com/0design/ai-native-design-framework (MIT). Needs the AINDF MCP server |
| better-interface, better-ui, better-typography, better-colors, better-accessibility, better-layout, better-writing, interface-review, explain-interface, break, state-machine, variant, build-design, technical-drawing | 14 interface review, polish and build skills | https://github.com/jakubkrehel/skills (check the repo licence) |
| logo-design | Logo and brand-mark design with a 1,400-logo reference library | https://github.com/kaankiziltug/logo-design-skill (MIT) |

## Install in Claude Code

```
npx skills add Jakubantalik/transitions.dev
npx skills add 0design/unslop-skill
npx skills add 0design/ai-native-design-framework
npx skills add jakubkrehel/skills
```
Plugins (Claude Code):
```
/plugin marketplace add 0design/unslop-skill
/plugin install unslop@unslop
/plugin marketplace add kaankiziltug/logo-design-skill
/plugin install logo-design@logo-design-skill
/plugin marketplace add jakubkrehel/skills
/plugin install interfaces@interfaces
```

## Install in the Claude app (claude.ai or desktop)

The app takes `.skill` files, which are zip files of one skill folder:

```
git clone <source repo>
cd <repo>/skills            # the folder that contains the skill folders
zip -r <skill-name>.skill <skill-name>
```
Then Settings, Capabilities, Skills, upload the file and switch it on. Install `better-interface` plus the on-demand skills you will really use rather than everything. Skills that run scripts or need an MCP server work best in Claude Code.

## Figma

Enable the official Figma connector (Claude app) or add the MCP server in Claude Code: `claude mcp add --transport http figma https://mcp.figma.com/mcp`. The Figma plugin's own skills (figma-use, figma-generate-design, figma-design-to-code and others) install with the Figma plugin.
