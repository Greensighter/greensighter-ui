# Workflow diagrams

FigJam board with the workflow scheme (three review gates, one Coordinator), the edit flow (one rework round) and the written description of who orchestrates and how edits are provided:

https://www.figma.com/board/ZUzbZ9wSoYkCPZYTu4TRss

(Ask the owner for access if it does not open. The same content is described in text in `playbook.md` sections 1 and 8, and in `CLAUDE.md` sections 5 to 7.)

## In words

1. Human gives the idea to the Coordinator (the main Claude session).
2. Coordinator calls the Project Manager: brief, feature specs, backlog.
3. Gate 1: Reviewer checks the spec. Changes requested goes back to the Project Manager.
4. Designer designs in Figma using only the Untitled UI design system.
5. Gate 2: Reviewer checks the Figma file. Changes requested goes back to the Designer.
6. Designer builds the static frontend and deploys a preview.
7. Gate 3: Reviewer checks the live preview. Approved means the feature is done.
8. A spec gap goes to the Project Manager. A second rejection at the same gate escalates to the human.

Edits: the Reviewer never edits work. It writes a review file with numbered issues (R1-01, ...), the owner fixes by ID (Figma first, then code), answers FIXED or DISPUTED per issue, and the Reviewer re-verifies.
