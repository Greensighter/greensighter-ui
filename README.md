# Greensighter UI

Design tokens for Greensighter: color, typography, spacing and radius.

The source of truth is the Figma file [Design System](https://www.figma.com/design/TGZXUIB6V7Z5b6rO5q4zHb/Design-System). `tokens/tokens.json` mirrors its variables and text styles.

## What's here

| Path | What it is |
|---|---|
| `tokens/tokens.json` | All tokens in [W3C Design Tokens](https://tr.designtokens.org/format/) format. Edit this file. |
| `css/tokens.css` | CSS custom properties and text-style classes, generated from the JSON. |
| `scripts/build.mjs` | The generator. |
| `index.html` | A showcase page for every token, with a Dark/Light switch. |

## Use it

```html
<link rel="stylesheet" href="css/tokens.css">
```

Or install it from git and import it:

```sh
npm install git+ssh://git@github.com/Greensighter/greensighter-ui.git
```

```css
@import "@greensighter/ui";
```

### Themes

Semantic colors have a Dark and a Light value. Dark is the default. Set `data-theme` on any element to switch that subtree:

```html
<article data-theme="light">…</article>
```

Use Dark for thumbnails and social posts, and Light for blog infographics.

### Tokens

Use the semantic tokens. The primitives (`--gs-color-*`) only feed them.

```css
.card {
  background: var(--gs-bg-surface);
  color: var(--gs-text-primary);
  border: 1px solid var(--gs-border-subtle);
  border-radius: var(--gs-radius-2xl);
  padding: var(--gs-spacing-24);
}
```

| Group | Variables |
|---|---|
| Background | `--gs-bg-{canvas, surface, surface-raised, glass, inverse, accent, accent-soft}` |
| Text | `--gs-text-{primary, secondary, muted, accent, on-accent, inverse}` |
| Border | `--gs-border-{subtle, strong, glass, accent}` |
| Status | `--gs-status-{positive, negative, warning}` |
| Chart | `--gs-chart-{1…5, neutral}` |
| Spacing | `--gs-spacing-{0, 2, 4, 8, 12, 16 … 256}` (8px grid, 4px for fine detail) |
| Radius | `--gs-radius-{none, xs, sm, md, lg, xl, 2xl … 9xl, full}` |
| Font | `--gs-font-family-*`, `--gs-font-weight-*`, `--gs-font-size-*`, `--gs-font-line-height-*` |

Chips and pills use `radius-full`, cards use `radius-2xl` (24px), and large glass panels use `radius-4xl` (48px).

### Typography

Apply a text-style class instead of setting sizes by hand:

`.gs-text-display-xl`, `.gs-text-display-l`, `.gs-text-h1` … `.gs-text-h4`, `.gs-text-body-l`, `.gs-text-body-m`, `.gs-text-body-s`, `.gs-text-label-m`, `.gs-text-label-s`, `.gs-text-caption`

The family is **Safiro**, a licensed font that this package doesn't include. Load it yourself with `@font-face`. Without it, text falls back to Helvetica Neue or Arial.

## Change tokens

1. Edit `tokens/tokens.json`.
2. Run `npm run build`. This regenerates `css/tokens.css` and the data in `index.html`.
3. Commit both.
