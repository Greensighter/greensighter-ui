# Design system: Untitled UI v8.0 ("Untitled UI v8.0 - Vibe Projects")

**Single source of truth for every design and build decision in this project.** Read before every task. If this file and a chat message disagree, this file wins; if this file and the Figma file disagree, the Figma file wins and this file must be corrected (Designer owns it).

| | |
|---|---|
| Figma file | https://www.figma.com/design/oXH08VsT8HScKPV82FIZHC/Untitled-UI--v8.0--Vibe-Projects |
| fileKey | `oXH08VsT8HScKPV82FIZHC` |
| Audit date | 2026-10-21 (read-only audit, nothing in the Figma file was changed) |
| Counts | 7 variable collections, 691 variables, 44 text styles, 26 effect styles, 8 grid styles, 927 paint styles, 220 component sets (62 base + 110 application + 48 marketing), 113 pages |
| Machine-readable twins | `design/tokens.css` (CSS custom properties, prefix `--uui-`), `design/tokens.json` (collections, modes, aliases, resolved values, styles), `design/component-inventory.json` |
| Companion doc | `design/components.md` (inventory of all 220 component sets, anatomy and token bindings of the ~30 fundamental components) |

Variable collections (names and IDs):

| # | Collection | Collection ID | Modes | Variables | Use for |
|---|---|---|---|---|---|
| 0 | `_Primitives` (hidden from publishing) | `VariableCollectionId:5248:377685` | Style | 343 | Raw palette + spacing scale. Feeds aliases only. Never reference in UI. |
| 1 | `1. Color modes` | `VariableCollectionId:5256:372339` | Light mode, Dark mode | 273 | ALL colour in UI (text, border, fg, bg, effects, utility, component colours). |
| 2 | `2. Radius` | `VariableCollectionId:6298:46388` | Mode 1 | 11 | Corner radius. |
| 3 | `3. Spacing` | `VariableCollectionId:6298:45383` | Mode 1 | 17 | Gap, padding, margin (scope GAP). |
| 4 | `4. Widths` | `VariableCollectionId:6298:45304` | Mode 1 | 12 | Component / section / paragraph widths. |
| 5 | `5. Containers` | `VariableCollectionId:6283:327807` | Value | 3 | Page container padding and max width. |
| 6 | `6. Typography` | `VariableCollectionId:7403:16248` | Value | 32 | Font family, weight, size, line height (bound by the 44 text styles). |

Reading conventions used in this doc: "px" values are exact reads from Figma. A value written as `$token` is a Figma variable binding; the CSS name is the same token under `--uui-` with underscores turned into hyphens (see tokens.css header for the exact conversion). "(read)" means read directly from a node; "(inferred)" means derived, and every inference is labelled.

---

## GOLDEN RULES

1. **Tokens only.** Every colour, space, radius, font size, line height and shadow in code comes from `tokens.css`. Never type a hex or a px value that has a token. If a needed value has no token, use the value documented in section 5 "Values that exist only as hard-coded numbers" and mark it `ASSUMPTION` in a code comment.
2. **Use semantic colour tokens, never primitives.** Components reference `--uui-text-*`, `--uui-border-*`, `--uui-fg-*`, `--uui-bg-*`, `--uui-utility-*` (and the few component colours: toggle, slider, tooltip). `--uui-primitive-*` exists only to feed aliases. This is what makes dark mode work with zero extra code.
3. **Pick the role by function, not by looks.** Page headings `text-primary`; labels and section headings `text-secondary`; supporting/paragraph text `text-tertiary`; subtle text (footers, inactive tabs, table headers) `text-quaternary`; placeholder `text-placeholder`. Default border `border-secondary` (cards, tables, dividers); high-contrast border `border-primary` (inputs, secondary buttons, checkboxes); active/focused `border-brand`; error `border-error`.
4. **Light and dark are both mandatory.** All 273 colour tokens have a Dark mode value. Switch with `data-theme="light|dark"` on `<html>` and honour `prefers-color-scheme` when no choice is stored. Never write a colour in a component that is not a token, or dark mode breaks.
5. **One typeface: Inter** (display and body). Headings use the Display styles (xs 24 to 2xl 72), everything else uses the Text styles (xs 12 to xl 20). Body default is Text md 16px / 24px. Four weights only: Regular 400, Medium 500, Semibold 600, Bold 700. Display 2xl, xl, lg, md carry -2% letter spacing; all other styles 0%.
6. **4px soft grid, scale only.** Spacing comes from `--uui-spacing-*` (0, 2, 4, 6, 8, 12, 16, 20, 24, 32, 40, 48, 64, 80, 96, 128, 160). Do not invent 10, 14, 18 or 28 gaps. The only off-scale numbers in Figma are the vendor's own optical button paddings (10px vertical, 14px/18px horizontal); reproduce those exactly as listed in components.md and nowhere else.
7. **Radius by component class.** Buttons, inputs, selects, dropdown menus, square page numbers, nav menu buttons: `radius-md` 8. Checkbox md 6 (`radius-sm`), checkbox sm 4 (`radius-xs`). Badges (non-pill), tags, nav items, dropdown items: `radius-sm` 6. Cards, tables, alerts, notifications, metric cards, sidebar cards: `radius-xl` 12. Modals: `radius-2xl` 16. Pills, toggles, progress bars, avatars, radio: `radius-full` (9999).
8. **Elevation by role.** Inputs, secondary buttons, cards, tables, badges-modern: `shadow-xs`. Toggle knob: `shadow-sm`. Slider handle: `shadow-md`. Dropdown/select menus, tooltips, notifications: `shadow-lg`. Modals: `shadow-xl`. Primary and secondary buttons use `shadow-xs-skeuomorphic`. In dark mode every drop-shadow colour is transparent (by design): depth comes from borders and surface steps, do not add dark shadows.
9. **Focus is a ring, always visible.** On `:focus-visible` apply the `focus-ring` effect: 2px gap in `bg-primary` plus 4px `focus-ring` (#9E77ED, Brand/500). Error fields use `focus-ring-error` (#EF4444). Buttons use `focus-ring-shadow-xs-skeuomorphic`. Never remove focus styles.
10. **Control heights are fixed.** Button xs 32, sm 36, md 40, lg 44, xl 48. Input and select sm 36, md 40, lg 44. Touch targets must be at least 44px: use md/lg (lg = 44) for primary mobile controls; xs/sm are desktop-density sizes. Primary mobile CTA is lg.
11. **States are token swaps.** Hover uses the `_hover` token of the same family (`bg-brand-solid` to `bg-brand-solid_hover`, `text-secondary` to `text-secondary_hover`, `bg-primary` to `bg-primary_hover`). Current/selected nav item `bg-secondary`; selected menu item `bg-primary_hover`. Disabled is the whole component at 0.5 opacity, not a different colour.
12. **Layout: container 1280 max, 32px side padding on desktop, 16px on mobile;** 12/6/4 column grids (gutters 32/32/16; margins 32/32/16 on tablet/mobile). Frames are designed at 375 (mobile), 768 (tablet), 1280 or 1440 (desktop). Figma has no breakpoint variables; use the CSS breakpoints in section 5 (marked inferred).
13. **App shell:** left sidebar 280px wide (desktop) with a `border-secondary` edge, top header navigation 64px high on desktop and 56px on mobile, content in the 1280 container. Page surface `bg-primary`; secondary surfaces (table header, current nav item, nav cards) `bg-secondary`.
14. **Reuse the component, never re-draw it.** Build with the component set and its variant props as named in components.md (Size, Hierarchy, State, Type, Breakpoint, Theme). Names beginning with `_` are internal base parts, not for direct use in screens. Icons come from the Untitled UI line-icon set (Icons page, 1,173 components), 20px default and 16px in chevrons/help/xs buttons.
15. **No invented tokens for the gaps.** The file has no motion, z-index, breakpoint, opacity or border-width tokens (section 8). Where code needs them, use the documented observed values (0.5 disabled, 0.7 overlay, 1px border, 2px emphasised border) and flag them ASSUMPTION; ask the Designer before adding anything new.

---

## Quick reference (one screen)

| Topic | Value |
|---|---|
| Font | Inter (display + body). Fallback stack is not a token; append `ui-sans-serif, system-ui, sans-serif` in app CSS |
| Body | Text md 16/24 Regular, colour `text-tertiary` for paragraphs, `text-primary` for headings |
| Type scale (px size/line) | Display 2xl 72/90, xl 60/72, lg 48/60, md 36/44, sm 30/38, xs 24/32. Text xl 20/30, lg 18/28, md 16/24, sm 14/20, xs 12/18 |
| Weights | Regular 400, Medium 500, Semibold 600, Bold 700 |
| Brand | Purple: Brand/600 `#7F56D9` (solid), Brand/700 `#6941C6` (hover, link text), Brand/500 `#9E77ED` (focus ring), Brand/50 `#F9F5FF` |
| Neutral | 50 `#FAFAFA`, 100 `#F5F5F5`, 200 `#E5E5E5`, 300 `#D4D4D4`, 400 `#A3A3A3`, 500 `#737373`, 600 `#525252`, 700 `#404040`, 800 `#262626`, 900 `#171717`, 950 `#0A0A0A` |
| Light surfaces | `bg-primary` #FFFFFF, `bg-secondary` #FAFAFA, `bg-tertiary` #F5F5F5, hover `bg-primary_hover` #FAFAFA |
| Dark surfaces | `bg-primary` #0A0A0A, `bg-secondary` #171717, `bg-tertiary` #262626, `bg-primary_hover` #171717 |
| Text light / dark | primary #171717 / #FAFAFA; secondary #404040 / #D4D4D4; tertiary #525252 / #A3A3A3; quaternary #737373 / #A3A3A3; placeholder #737373 both |
| Borders light / dark | primary #D4D4D4 / #404040; secondary #E5E5E5 / #262626; brand #9E77ED / #B692F6; error #EF4444 / #F87171 |
| Status | error Red/600 `#DC2626`; warning Yellow/600 `#CA8A04`; success Green/600 `#16A34A` (text on light). Note warning text fails contrast on white (2.94:1), see section 4 |
| Spacing | 0, 2, 4, 6, 8, 12, 16, 20, 24, 32, 40, 48, 64, 80, 96, 128, 160 (`spacing-none` to `spacing-11xl`) |
| Radius | none 0, xxs 2, xs 4, sm 6, md 8, lg 10, xl 12, 2xl 16, 3xl 20, 4xl 24, full 9999 |
| Widths | xxs 320, xs 384, sm 480, md 560, lg 640, xl 768, 2xl 1024, 3xl 1280, 4xl 1440, 5xl 1600, 6xl 1920; paragraph max 720 |
| Containers | padding mobile 16, desktop 32; max width desktop 1280 |
| Grid | desktop 12 col gutter 32, tablet 6 col gutter 32 margin 32, mobile 4 col gutter 16 margin 16 |
| Heights | button 32/36/40/44/48; input 36/40/44; tab 32/36 (sm/md underline); toggle 24 (md) / 20 (sm); checkbox 20 (md) / 16 (sm); avatar 24/32/40/48/56/64 |
| Shadows | xs `0 1 2 0`, sm, md, lg, xl, 2xl, 3xl; focus ring `0 0 0 2 bg-primary, 0 0 0 4 focus-ring`; all in tokens.css as `--uui-effect-*` |
| Primary button | h40, pad 10/14, gap 4, r8, fill `bg-brand-solid`, text white Text sm Semibold, hover `bg-brand-solid_hover` (white on brand = 4.96:1, hover 6.62:1) |
| Input | h40 box, pad 8/12, gap 8, r8, `bg-primary`, 1px `border-primary`, `shadow-xs`; label Text sm Medium `text-secondary`; hint Text sm `text-tertiary`; focus 2px `border-brand` |
| Modal | 400 wide panel, r16, pad 24, `shadow-xl`, overlay `bg-overlay` at 0.7 + 16px backdrop blur |
| Dark mode | set `data-theme="dark"` on `<html>`; all colours switch through tokens |

---

## 1. File map

Figma file `oXH08VsT8HScKPV82FIZHC`, 113 pages: 10 cover pages (marked with a diamond glyph in Figma), 95 sub-pages, 8 separator pages (named with dashes, no content). Every page opens with a "Design system header" instance and a note frame "Notes and documentation (you can delete this)"; those are vendor documentation, not product UI.

### 1.1 Documentation and foundations

| Page | Node ID | Purpose | Main frames (node IDs) |
|---|---|---|---|
| Getting started | `1480:0` | Vendor welcome and how-to | Welcome `2195:443662`, Getting up and running `2198:441725`, Split up the file into multiple libraries `2818:377803`, How to master variants `2195:459314`, How to master Auto Layout `2199:441273` |
| Variables | `6520:67419` | How variables are structured and named | Introduction `6520:67420`, Variables in Untitled UI `6520:67525`, How variables are named `6520:70686`, Types of variables `6520:73432`, Additional notes `6520:76098` |
| FOUNDATIONS (cover) | `925:34508` | Divider/cover | |
| Colors | `1023:36350` | Colour documentation | Colors `5225:371288`, Gradients `1525:272676`, Color variables `6472:97620`, Color utility variables `6487:347428`, _Swatch base `1029:37647` |
| Typography | `18:1951` | Type scale documentation | Typography `1023:36826`, _Type scale base `1019:35537` |
| Logos | `1083:118533` | Logo assets | |
| Icons | `3463:407484` | 1,173 loose icon components (no component sets) grouped in category frames: Layout, Charts, Security, Education, Development, Arrows, Finance and eCommerce, General, Alerts and feedback, Shapes, Users, Media and devices, Images, Communication, Editor, Time, Files, Maps and travel, Weather | |
| Misc icons | `1025:31781` | Extra icons | |
| Effect styles | `1030:33573` | Shadows and blurs documentation | Shadows `1532:352912`, Shadows `5424:398991`, Blurs `1532:352913` |
| Spacing, radius & grids | `5245:372829` | Spacing, widths, containers, radius, grid layouts | Spacing `5245:372881`, Spacing primitives `6300:76782`, Radius `5253:372274`, Grid layouts `5245:373008` |

### 1.2 Components, assets, examples

| Page | Node ID | Group |
|---|---|---|
| **Getting started** (cover) | `1480:0` | |
| **Variables** (cover) | `6520:67419` | |
| **FOUNDATIONS** (cover) | `925:34508` | |
| Colors | `1023:36350` | FOUNDATIONS |
| Typography | `18:1951` | FOUNDATIONS |
| Logos | `1083:118533` | FOUNDATIONS |
| Icons | `3463:407484` | FOUNDATIONS |
| Misc icons | `1025:31781` | FOUNDATIONS |
| Effect styles | `1030:33573` | FOUNDATIONS |
| Spacing, radius & grids | `5245:372829` | FOUNDATIONS |
| **BASE COMPONENTS** (cover) | `1030:33572` | |
| Avatars | `18:1350` | BASE COMPONENTS |
| Badges | `12:539` | BASE COMPONENTS |
| Button groups | `16:399` | BASE COMPONENTS |
| Buttons | `1:1183` | BASE COMPONENTS |
| Checkboxes | `1097:63638` | BASE COMPONENTS |
| Dropdowns | `18:0` | BASE COMPONENTS |
| Inputs | `85:1269` | BASE COMPONENTS |
| Progress indicators | `1154:89940` | BASE COMPONENTS |
| Radio groups | `122:3484` | BASE COMPONENTS |
| Select | `11132:11643` | BASE COMPONENTS |
| Sliders | `1086:1423` | BASE COMPONENTS |
| Tags | `3306:403749` | BASE COMPONENTS |
| Text editors | `9291:557994` | BASE COMPONENTS |
| Toggles | `1102:4631` | BASE COMPONENTS |
| Tooltips | `1052:485` | BASE COMPONENTS |
| Video players | `9316:559159` | BASE COMPONENTS |
| **SHARED ASSETS** (cover) | `1238:52` | |
| Background elements | `4938:371336` | SHARED ASSETS |
| Banners | `1624:424681` | SHARED ASSETS |
| Email templates | `1226:360` | SHARED ASSETS |
| Log in and sign up pages | `134:3146` | SHARED ASSETS |
| Miscellaneous assets | `1291:157819` | SHARED ASSETS |
| Portfolio mockups | `1053:41971` | SHARED ASSETS |
| 404 pages | `1176:99947` | SHARED ASSETS |
| **APPLICATION EXAMPLES (you can move to a separate file)** (cover) | `1664:398801` | |
| Dashboards 01 | `1686:419019` | APPLICATION EXAMPLES (you can move to a separate file) |
| Dashboards 02 | `6277:262842` | APPLICATION EXAMPLES (you can move to a separate file) |
| Informational pages 01 | `1686:419020` | APPLICATION EXAMPLES (you can move to a separate file) |
| Informational pages 02 | `6277:315325` | APPLICATION EXAMPLES (you can move to a separate file) |
| Settings pages 01 | `1664:398802` | APPLICATION EXAMPLES (you can move to a separate file) |
| Settings pages 02 | `6277:291692` | APPLICATION EXAMPLES (you can move to a separate file) |
| **APPLICATION COMPONENTS** (cover) | `1215:104942` | |
| Activity feeds | `253:14231` | APPLICATION COMPONENTS |
| Alerts & notifications | `176:4256` | APPLICATION COMPONENTS |
| Application navigation | `82:1862` | APPLICATION COMPONENTS |
| Breadcrumbs | `43:3087` | APPLICATION COMPONENTS |
| Calendars | `7988:349308` | APPLICATION COMPONENTS |
| Card headers | `223:8525` | APPLICATION COMPONENTS |
| Charts | `1050:146949` | APPLICATION COMPONENTS |
| Code snippets | `1221:106300` | APPLICATION COMPONENTS |
| Color pickers | `12206:573373` | APPLICATION COMPONENTS |
| Command menus | `3307:403757` | APPLICATION COMPONENTS |
| Content dividers | `780:0` | APPLICATION COMPONENTS |
| Date pickers | `1143:85678` | APPLICATION COMPONENTS |
| Empty states | `1172:31` | APPLICATION COMPONENTS |
| File upload | `1157:90306` | APPLICATION COMPONENTS |
| Filters | `12206:572286` | APPLICATION COMPONENTS |
| Inline CTAs | `127:2907` | APPLICATION COMPONENTS |
| Loading indicators | `1172:32` | APPLICATION COMPONENTS |
| Messaging | `1251:12271` | APPLICATION COMPONENTS |
| Metrics | `185:279` | APPLICATION COMPONENTS |
| Modals | `172:4293` | APPLICATION COMPONENTS |
| Page headers | `185:2718` | APPLICATION COMPONENTS |
| Pagination | `225:7288` | APPLICATION COMPONENTS |
| Progress steps | `53:1288` | APPLICATION COMPONENTS |
| Section footers | `3275:371793` | APPLICATION COMPONENTS |
| Section headers | `190:4871` | APPLICATION COMPONENTS |
| Slideout menus | `231:922` | APPLICATION COMPONENTS |
| Tables | `214:0` | APPLICATION COMPONENTS |
| Tabs | `43:0` | APPLICATION COMPONENTS |
| Tree views | `12206:573377` | APPLICATION COMPONENTS |
| **MARKETING WEBSITE EXAMPLES (you can move to a separate file)** (cover) | `1622:261458` | |
| About pages | `1622:261463` | MARKETING WEBSITE EXAMPLES (you can move to a separate file) |
| Blog posts | `1631:330597` | MARKETING WEBSITE EXAMPLES (you can move to a separate file) |
| Blogs | `1622:261459` | MARKETING WEBSITE EXAMPLES (you can move to a separate file) |
| Contact pages | `1622:261464` | MARKETING WEBSITE EXAMPLES (you can move to a separate file) |
| FAQ pages | `1622:261465` | MARKETING WEBSITE EXAMPLES (you can move to a separate file) |
| Landing pages | `1622:261460` | MARKETING WEBSITE EXAMPLES (you can move to a separate file) |
| Legal pages | `1622:261466` | MARKETING WEBSITE EXAMPLES (you can move to a separate file) |
| Log in pages | `1623:261469` | MARKETING WEBSITE EXAMPLES (you can move to a separate file) |
| Pricing pages | `1622:261461` | MARKETING WEBSITE EXAMPLES (you can move to a separate file) |
| Sign up pages | `6201:298081` | MARKETING WEBSITE EXAMPLES (you can move to a separate file) |
| Team pages | `1639:514589` | MARKETING WEBSITE EXAMPLES (you can move to a separate file) |
| 404 pages | `1623:261468` | MARKETING WEBSITE EXAMPLES (you can move to a separate file) |
| **MARKETING WEBSITE COMPONENTS** (cover) | `1622:261457` | |
| Blog sections | `665:1107` | MARKETING WEBSITE COMPONENTS |
| Careers section | `1458:239246` | MARKETING WEBSITE COMPONENTS |
| Contact sections | `673:20368` | MARKETING WEBSITE COMPONENTS |
| Content | `647:15097` | MARKETING WEBSITE COMPONENTS |
| CTA sections | `645:15070` | MARKETING WEBSITE COMPONENTS |
| FAQ sections | `282:168` | MARKETING WEBSITE COMPONENTS |
| Footers | `278:13503` | MARKETING WEBSITE COMPONENTS |
| Header navigation | `683:17952` | MARKETING WEBSITE COMPONENTS |
| Header sections | `739:496` | MARKETING WEBSITE COMPONENTS |
| Features sections | `736:22481` | MARKETING WEBSITE COMPONENTS |
| Metrics sections | `291:164` | MARKETING WEBSITE COMPONENTS |
| Newsletter CTA sections | `641:15058` | MARKETING WEBSITE COMPONENTS |
| Pricing sections | `708:20673` | MARKETING WEBSITE COMPONENTS |
| Social proof sections | `286:15521` | MARKETING WEBSITE COMPONENTS |
| Team sections | `673:16258` | MARKETING WEBSITE COMPONENTS |
| Testimonial sections | `648:16272` | MARKETING WEBSITE COMPONENTS |
| **UTILITY** (cover) | `12584:384683` | |
| Design annotations | `1054:557` | UTILITY |
| Thumbnail | `2210:441096` | UTILITY |

Purpose of the groups:
- **BASE COMPONENTS** (cover `1030:33572`): form and UI atoms. 62 component sets.
- **APPLICATION COMPONENTS** (cover `1215:104942`): app-level patterns (navigation, tables, modals, charts...). 110 component sets.
- **MARKETING WEBSITE COMPONENTS** (cover `1622:261457`): marketing page sections. 48 component sets.
- **SHARED ASSETS** (`1238:52`), **APPLICATION EXAMPLES** (`1664:398801`) and **MARKETING WEBSITE EXAMPLES** (`1622:261458`): assembled pages built from the components; the cover names say "you can move to a separate file". They are the reference for page-level composition (templates).
- **UTILITY** (`12584:384683`): annotation helpers (Design annotations `1054:557`, Thumbnail `2210:441096`); not product UI.

---

## 2. Variables

### 2.1 Layering and naming

Three layers, in this order:

1. **`_Primitives`** (hidden from publishing): raw palette (311 colour variables: Base white/black/transparent, Neutral, Neutral (alpha), and 24 hue palettes) and the raw spacing scale (32 values 0 to 1920). Never used directly in UI.
2. **Alias collections** that point at primitives and are named by function: `1. Color modes`, `3. Spacing`, `4. Widths`, `5. Containers`. `2. Radius` and `6. Typography` hold raw values (no alias).
3. **Component-specific variables**, stored inside `1. Color modes` under "Component colors/Components/..." (toggle, slider, tooltip, avatar, footer, icon, mockup, text-editor, app-store-badge). Use only inside that component.

Vendor guidance (read from the Variables doc pages): use alias variables for 99% of work; use primitives only to feed aliases; use component variables only when truly needed; use "text" styles for body and UI, "display" styles for headings.

**Naming pattern** for semantic colours: `[property]-[semantic role]-[hierarchy]_[modifier]`, for example `text-secondary_hover`, `fg-brand-primary_alt`, `bg-brand-solid_hover`, `border-secondary_alt`. Property prefixes: `text-`, `border-`, `fg-` (icons and glyphs), `bg-`, `utility-`, `alpha-`, `shadow-`, `focus-ring`. Hierarchy words: primary, secondary, tertiary, quaternary (importance, strong to subtle), `solid` (filled), `section`. Modifiers after an underscore: `_hover`, `_alt` (variant that changes in dark mode), `_on-brand` (for use on brand-coloured surfaces), `_subtle`. A trailing "(900)" in some Figma names is only a hint of the primitive step; it is dropped in CSS.

**Where aliases land:** semantic to primitive (for example `text-secondary` to `Colors/Neutral/700`), or semantic to another semantic in the same collection (the `_alt` variants, for example `bg-primary_alt` dark = `bg-secondary`), or spacing/width/container to Spacing primitives.

**Which collection for what:**

| Need | Collection | Tokens |
|---|---|---|
| Any colour in UI | `1. Color modes` | `--uui-text-*`, `--uui-border-*`, `--uui-fg-*`, `--uui-bg-*`, `--uui-utility-*`, `--uui-alpha-*` |
| Gap, padding, margin | `3. Spacing` | `--uui-spacing-*` |
| Corner radius | `2. Radius` | `--uui-radius-*` |
| Element/section width | `4. Widths` | `--uui-width-*`, `--uui-paragraph-max-width` |
| Page container | `5. Containers` | `--uui-container-padding-mobile`, `--uui-container-padding-desktop`, `--uui-container-max-width-desktop` |
| Type | `6. Typography` | `--uui-font-family-*`, `--uui-font-weight-*`, `--uui-font-size-*`, `--uui-line-height-*` |
| Palette primitives | `_Primitives` | feed aliases only |

Variable scopes (what Figma lets each variable bind to): Text colours `TEXT_FILL`; borders `STROKE_COLOR`; foreground (fg) `ALL_FILLS` + `STROKE_COLOR`; backgrounds `FRAME_FILL` + `SHAPE_FILL` (`bg-primary` also `STROKE_COLOR` and `EFFECT_COLOR`); shadows and focus rings `EFFECT_COLOR` (focus rings also `STROKE_COLOR`); spacing `GAP`; radius `CORNER_RADIUS`; widths and container max width `WIDTH_HEIGHT` (paragraph max width `ALL`); font tokens `FONT_FAMILY`, `FONT_STYLE`, `FONT_SIZE`, `LINE_HEIGHT`. Primitives: colours `ALL`; spacing floats have no scope restriction recorded.

### 2.2 Primitive colour palettes (`_Primitives`, mode "Style")

Base: white #FFFFFF; black #000000; transparent #FFFFFF00. Palettes (hex, 50 to 950): Base, Neutral, Neutral (alpha), Brand, Red, Orange, Amber, Yellow, Lime, Green, Emerald, Teal, Cyan, Sky, Blue, Indigo, Violet, Purple, Fuchsia, Pink, Rose, Slate, Gray, Zinc, Stone, Taupe, Mauve, Mist, Olive. Neutral (alpha) is white at decreasing alpha (50 `#FFFFFFF7` to 950 `#FFFFFF00`).

| Palette | 50 | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900 | 950 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Neutral | #FAFAFA | #F5F5F5 | #E5E5E5 | #D4D4D4 | #A3A3A3 | #737373 | #525252 | #404040 | #262626 | #171717 | #0A0A0A |
| Neutral (alpha) | #FFFFFFF7 | #FFFFFFF5 | #FFFFFFE5 | #FFFFFFD1 | #FFFFFF9E | #FFFFFF6E | #FFFFFF4A | #FFFFFF38 | #FFFFFF1F | #FFFFFF0D | #FFFFFF00 |
| Brand | #F9F5FF | #F4EBFF | #E9D7FE | #D6BBFB | #B692F6 | #9E77ED | #7F56D9 | #6941C6 | #53389E | #42307D | #2C1C5F |
| Red | #FEF2F2 | #FEE2E2 | #FECACA | #FCA5A5 | #F87171 | #EF4444 | #DC2626 | #B91C1C | #991B1B | #7F1D1D | #450A0A |
| Orange | #FFF7ED | #FFEDD5 | #FED7AA | #FDBA74 | #FB923C | #F97316 | #EA580C | #C2410C | #9A3412 | #7C2D12 | #431407 |
| Amber | #FFFBEB | #FEF3C7 | #FDE68A | #FCD34D | #FBBF24 | #F59E0B | #D97706 | #B45309 | #92400E | #78350F | #451A03 |
| Yellow | #FEFCE8 | #FEF9C3 | #FEF08A | #FDE047 | #FACC15 | #EAB308 | #CA8A04 | #A16207 | #854D0E | #713F12 | #422006 |
| Lime | #F7FEE7 | #ECFCCB | #D9F99D | #BEF264 | #A3E635 | #84CC16 | #65A30D | #4D7C0F | #3F6212 | #365314 | #1A2E05 |
| Green | #F0FDF4 | #DCFCE7 | #BBF7D0 | #86EFAC | #4ADE80 | #22C55E | #16A34A | #15803D | #166534 | #14532D | #052E16 |
| Emerald | #ECFDF5 | #D1FAE5 | #A7F3D0 | #6EE7B7 | #34D399 | #10B981 | #059669 | #047857 | #065F46 | #064E3B | #022C22 |
| Teal | #F0FDFA | #CCFBF1 | #99F6E4 | #5EEAD4 | #2DD4BF | #14B8A6 | #0D9488 | #0F766E | #115E59 | #134E4A | #042F2E |
| Cyan | #ECFEFF | #CFFAFE | #A5F3FC | #67E8F9 | #22D3EE | #06B6D4 | #0891B2 | #0E7490 | #155E75 | #164E63 | #083344 |
| Sky | #F0F9FF | #E0F2FE | #BAE6FD | #7DD3FC | #38BDF8 | #0EA5E9 | #0284C7 | #0369A1 | #075985 | #0C4A6E | #082F49 |
| Blue | #EFF6FF | #DBEAFE | #BFDBFE | #93C5FD | #60A5FA | #3B82F6 | #2563EB | #1D4ED8 | #1E40AF | #1E3A8A | #172554 |
| Indigo | #EEF2FF | #E0E7FF | #C7D2FE | #A5B4FC | #818CF8 | #6366F1 | #4F46E5 | #4338CA | #3730A3 | #312E81 | #1E1B4B |
| Violet | #F5F3FF | #EDE9FE | #DDD6FE | #C4B5FD | #A78BFA | #8B5CF6 | #7C3AED | #6D28D9 | #5B21B6 | #4C1D95 | #2E1065 |
| Purple | #FAF5FF | #F3E8FF | #E9D5FF | #D8B4FE | #C084FC | #A855F7 | #9333EA | #7E22CE | #6B21A8 | #581C87 | #3B0764 |
| Fuchsia | #FDF4FF | #FAE8FF | #F5D0FE | #F0ABFC | #E879F9 | #D946EF | #C026D3 | #A21CAF | #86198F | #701A75 | #4A044E |
| Pink | #FDF2F8 | #FCE7F3 | #FBCFE8 | #F9A8D4 | #F472B6 | #EC4899 | #DB2777 | #BE185D | #9D174D | #831843 | #500724 |
| Rose | #FFF1F2 | #FFE4E6 | #FECDD3 | #FDA4AF | #FB7185 | #F43F5E | #E11D48 | #BE123C | #9F1239 | #881337 | #4C0519 |
| Slate | #F8FAFC | #F1F5F9 | #E2E8F0 | #CBD5E1 | #94A3B8 | #64748B | #475569 | #334155 | #1E293B | #0F172A | #020617 |
| Gray | #F9FAFB | #F3F4F6 | #E5E7EB | #D1D5DB | #9CA3AF | #6B7280 | #4B5563 | #374151 | #1F2937 | #111827 | #030712 |
| Zinc | #FAFAFA | #F4F4F5 | #E4E4E7 | #D4D4D8 | #A1A1AA | #71717A | #52525B | #3F3F46 | #27272A | #18181B | #09090B |
| Stone | #FAFAF9 | #F5F5F4 | #E7E5E4 | #D6D3D1 | #A8A29E | #78716C | #57534E | #44403C | #292524 | #1C1917 | #0C0A09 |
| Taupe | #FBFAF9 | #F3F1F1 | #E8E4E3 | #D8D2D0 | #ABA09C | #7C6D67 | #5B4F4B | #473C39 | #2B2422 | #1D1816 | #0C0A09 |
| Mauve | #FAFAFA | #F3F1F3 | #E7E4E7 | #D7D0D7 | #A89EA9 | #79697B | #594C5B | #463947 | #2A212C | #1D161E | #0C090C |
| Mist | #F9FBFB | #F1F3F3 | #E3E7E8 | #D0D6D8 | #9CA8AB | #67787C | #4B585B | #394447 | #22292B | #161B1D | #090B0C |
| Olive | #FBFBF9 | #F4F4F0 | #E8E8E3 | #D8D8D0 | #ABAB9C | #7C7C67 | #5B5B4B | #474739 | #2B2B22 | #1D1D16 | #0C0C09 |

### 2.3 Primitive spacing scale (`_Primitives`)

| CSS token | Figma name | Value |
|---|---|---|
| `--uui-primitive-spacing-0` | `Spacing/0 (0px)` | 0px |
| `--uui-primitive-spacing-0-5` | `Spacing/0․5 (2px)` | 2px |
| `--uui-primitive-spacing-1` | `Spacing/1 (4px)` | 4px |
| `--uui-primitive-spacing-1-5` | `Spacing/1․5 (6px)` | 6px |
| `--uui-primitive-spacing-2` | `Spacing/2 (8px)` | 8px |
| `--uui-primitive-spacing-3` | `Spacing/3 (12px)` | 12px |
| `--uui-primitive-spacing-4` | `Spacing/4 (16px)` | 16px |
| `--uui-primitive-spacing-5` | `Spacing/5 (20px)` | 20px |
| `--uui-primitive-spacing-6` | `Spacing/6 (24px)` | 24px |
| `--uui-primitive-spacing-8` | `Spacing/8 (32px)` | 32px |
| `--uui-primitive-spacing-10` | `Spacing/10 (40px)` | 40px |
| `--uui-primitive-spacing-12` | `Spacing/12 (48px)` | 48px |
| `--uui-primitive-spacing-16` | `Spacing/16 (64px)` | 64px |
| `--uui-primitive-spacing-20` | `Spacing/20 (80px)` | 80px |
| `--uui-primitive-spacing-24` | `Spacing/24 (96px)` | 96px |
| `--uui-primitive-spacing-32` | `Spacing/32 (128px)` | 128px |
| `--uui-primitive-spacing-40` | `Spacing/40 (160px)` | 160px |
| `--uui-primitive-spacing-48` | `Spacing/48 (192px)` | 192px |
| `--uui-primitive-spacing-56` | `Spacing/56 (224px)` | 224px |
| `--uui-primitive-spacing-64` | `Spacing/64 (256px)` | 256px |
| `--uui-primitive-spacing-80` | `Spacing/80 (320px)` | 320px |
| `--uui-primitive-spacing-96` | `Spacing/96 (384px)` | 384px |
| `--uui-primitive-spacing-120` | `Spacing/120 (480px)` | 480px |
| `--uui-primitive-spacing-140` | `Spacing/140 (560px)` | 560px |
| `--uui-primitive-spacing-160` | `Spacing/160 (640px)` | 640px |
| `--uui-primitive-spacing-180` | `Spacing/180 (720px)` | 720px |
| `--uui-primitive-spacing-192` | `Spacing/192 (768px)` | 768px |
| `--uui-primitive-spacing-256` | `Spacing/256 (1,024px)` | 1024px |
| `--uui-primitive-spacing-320` | `Spacing/320 (1,280px)` | 1280px |
| `--uui-primitive-spacing-360` | `Spacing/360 (1,440px)` | 1440px |
| `--uui-primitive-spacing-400` | `Spacing/400 (1,600px)` | 1600px |
| `--uui-primitive-spacing-480` | `Spacing/480 (1,920px)` | 1920px |

### 2.4 Semantic colours (`1. Color modes`, 273 variables, modes "Light mode" / "Dark mode")

Cell format: resolved hex (alias target). "raw" means the value is a literal in Figma, not an alias. Complete machine data is in tokens.json and tokens.css.

#### Text (21)

| CSS token | Figma name | Light | Dark | Use |
|---|---|---|---|---|
| `--uui-text-primary` | `text-primary (900)` | #171717 (Neutral/900) | #FAFAFA (Neutral/50) | Primary text, e.g. page headings |
| `--uui-text-primary-on-brand` | `text-primary_on-brand` | #FFFFFF (Base/white) | #FAFAFA (Neutral/50) |  |
| `--uui-text-secondary` | `text-secondary (700)` | #404040 (Neutral/700) | #D4D4D4 (Neutral/300) | Labels, section headings, secondary-button text |
| `--uui-text-secondary-hover` | `text-secondary_hover` | #262626 (Neutral/800) | #E5E5E5 (Neutral/200) |  |
| `--uui-text-secondary-on-brand` | `text-secondary_on-brand` | #E9D7FE (Brand/200) | #D4D4D4 (Neutral/300) |  |
| `--uui-text-tertiary` | `text-tertiary (600)` | #525252 (Neutral/600) | #A3A3A3 (Neutral/400) | Supporting text, paragraph text |
| `--uui-text-tertiary-hover` | `text-tertiary_hover` | #404040 (Neutral/700) | #D4D4D4 (Neutral/300) |  |
| `--uui-text-tertiary-on-brand` | `text-tertiary_on-brand` | #E9D7FE (Brand/200) | #A3A3A3 (Neutral/400) |  |
| `--uui-text-quaternary` | `text-quaternary (500)` | #737373 (Neutral/500) | #A3A3A3 (Neutral/400) | Subtle text, e.g. footer headings, inactive tab, table header |
| `--uui-text-quaternary-on-brand` | `text-quaternary_on-brand` | #D6BBFB (Brand/300) | #A3A3A3 (Neutral/400) |  |
| `--uui-text-white` | `text-white` | #FFFFFF (Base/white) | #FFFFFF (Base/white) | Text on solid brand / dark fills |
| `--uui-text-placeholder` | `text-placeholder` | #737373 (Neutral/500) | #737373 (Neutral/500) | Placeholder text (Neutral/500, chosen for accessibility over 400) |
| `--uui-text-brand-primary` | `text-brand-primary (900)` | #42307D (Brand/900) | #FAFAFA (Neutral/50) |  |
| `--uui-text-brand-secondary` | `text-brand-secondary (700)` | #6941C6 (Brand/700) | #D4D4D4 (Neutral/300) | Link color, active tab text |
| `--uui-text-brand-secondary-hover` | `text-brand-secondary_hover` | #53389E (Brand/800) | #E5E5E5 (Neutral/200) |  |
| `--uui-text-brand-tertiary` | `text-brand-tertiary (600)` | #7F56D9 (Brand/600) | #A3A3A3 (Neutral/400) | Required asterisk, brand accents |
| `--uui-text-brand-tertiary-alt` | `text-brand-tertiary_alt` | #7F56D9 (Brand/600) | #FAFAFA (Neutral/50) |  |
| `--uui-text-error-primary` | `text-error-primary (600)` | #DC2626 (Red/600) | #F87171 (Red/400) | Error messages |
| `--uui-text-error-primary-hover` | `text-error-primary_hover` | #B91C1C (Red/700) | #FCA5A5 (Red/300) |  |
| `--uui-text-warning-primary` | `text-warning-primary (600)` | #CA8A04 (Yellow/600) | #FACC15 (Yellow/400) |  |
| `--uui-text-success-primary` | `text-success-primary (600)` | #16A34A (Green/600) | #4ADE80 (Green/400) |  |

#### Border (8)

| CSS token | Figma name | Light | Dark | Use |
|---|---|---|---|---|
| `--uui-border-primary` | `border-primary` | #D4D4D4 (Neutral/300) | #404040 (Neutral/700) | High-contrast: inputs, button groups, checkboxes, secondary button |
| `--uui-border-secondary` | `border-secondary` | #E5E5E5 (Neutral/200) | #262626 (Neutral/800) | DEFAULT border: cards, tables, dividers, sidebar/header edges |
| `--uui-border-secondary-alt` | `border-secondary_alt` | #0000001A (raw) | #262626 (Neutral/800) | Alpha border for floating menus only |
| `--uui-border-tertiary` | `border-tertiary` | #F5F5F5 (Neutral/100) | #262626 (Neutral/800) | Subtle: chart axes |
| `--uui-border-brand` | `border-brand` | #9E77ED (Brand/500) | #B692F6 (Brand/400) | Active/focused input border |
| `--uui-border-brand-alt` | `border-brand_alt` | #7F56D9 (Brand/600) | #404040 (Neutral/700) |  |
| `--uui-border-error` | `border-error` | #EF4444 (Red/500) | #F87171 (Red/400) | Error input border |
| `--uui-border-error-subtle` | `border-error_subtle` | #FCA5A5 (Red/300) | #EF4444 (Red/500) | Destructive input border (default state) |

#### Foreground, for icons and glyphs (19 incl. fg-primary)

| CSS token | Figma name | Light | Dark | Use |
|---|---|---|---|---|
| `--uui-fg-primary` | `fg-primary (900)` | #171717 (Neutral/900) | #FFFFFF (Base/white) |  |
| `--uui-fg-secondary` | `fg-secondary (700)` | #404040 (Neutral/700) | #D4D4D4 (Neutral/300) |  |
| `--uui-fg-secondary-hover` | `fg-secondary_hover` | #262626 (Neutral/800) | #E5E5E5 (Neutral/200) |  |
| `--uui-fg-tertiary` | `fg-tertiary (600)` | #525252 (Neutral/600) | #A3A3A3 (Neutral/400) |  |
| `--uui-fg-tertiary-hover` | `fg-tertiary_hover` | #404040 (Neutral/700) | #D4D4D4 (Neutral/300) |  |
| `--uui-fg-quaternary` | `fg-quaternary (400)` | #A3A3A3 (Neutral/400) | #737373 (Neutral/500) | Low-contrast icons: buttons, help icons, input icons |
| `--uui-fg-quaternary-hover` | `fg-quaternary_hover` | #737373 (Neutral/500) | #A3A3A3 (Neutral/400) |  |
| `--uui-fg-white` | `fg-white` | #FFFFFF (Base/white) | #FFFFFF (Base/white) |  |
| `--uui-fg-brand-primary` | `fg-brand-primary (600)` | #7F56D9 (Brand/600) | #9E77ED (Brand/500) |  |
| `--uui-fg-brand-primary-alt` | `fg-brand-primary_alt` | #7F56D9 (alias fg-brand-primary (600)) | #D4D4D4 (Neutral/300) |  |
| `--uui-fg-brand-secondary` | `fg-brand-secondary (500)` | #9E77ED (Brand/500) | #9E77ED (Brand/500) |  |
| `--uui-fg-brand-secondary-alt` | `fg-brand-secondary_alt` | #9E77ED (alias fg-brand-secondary (500)) | #525252 (Neutral/600) |  |
| `--uui-fg-brand-secondary-hover` | `fg-brand-secondary_hover` | #7F56D9 (Brand/600) | #737373 (Neutral/500) |  |
| `--uui-fg-error-primary` | `fg-error-primary` | #DC2626 (Red/600) | #EF4444 (Red/500) |  |
| `--uui-fg-error-secondary` | `fg-error-secondary` | #EF4444 (Red/500) | #F87171 (Red/400) |  |
| `--uui-fg-warning-primary` | `fg-warning-primary` | #CA8A04 (Yellow/600) | #EAB308 (Yellow/500) |  |
| `--uui-fg-warning-secondary` | `fg-warning-secondary` | #EAB308 (Yellow/500) | #FACC15 (Yellow/400) |  |
| `--uui-fg-success-primary` | `fg-success-primary` | #16A34A (Green/600) | #22C55E (Green/500) |  |
| `--uui-fg-success-secondary` | `fg-success-secondary` | #22C55E (Green/500) | #4ADE80 (Green/400) |  |

#### Background (28 in this group)

| CSS token | Figma name | Light | Dark | Use |
|---|---|---|---|---|
| `--uui-bg-primary` | `bg-primary` | #FFFFFF (Base/white) | #0A0A0A (Neutral/950) | Page / card / input surface |
| `--uui-bg-primary-alt` | `bg-primary_alt` | #FFFFFF (Base/white) | #171717 (alias bg-secondary) | Variant of bg-primary; switches to bg-secondary in dark mode |
| `--uui-bg-primary-hover` | `bg-primary_hover` | #FAFAFA (Neutral/50) | #171717 (Neutral/900) | Hover background for secondary/tertiary buttons, menu items, table row hover |
| `--uui-bg-primary-solid` | `bg-primary-solid` | #0A0A0A (Neutral/950) | #262626 (alias bg-tertiary) | Dark surface, e.g. tooltips (switches to bg-tertiary in dark mode) |
| `--uui-bg-secondary` | `bg-secondary` | #FAFAFA (Neutral/50) | #171717 (Neutral/900) | Secondary surface: table header, sidebar current item, nav cards |
| `--uui-bg-secondary-alt` | `bg-secondary_alt` | #FAFAFA (Neutral/50) | #0A0A0A (alias bg-primary) | Variant of bg-secondary; switches to bg-primary in dark mode |
| `--uui-bg-secondary-hover` | `bg-secondary_hover` | #F5F5F5 (Neutral/100) | #262626 (Neutral/800) |  |
| `--uui-bg-secondary-solid` | `bg-secondary-solid` | #525252 (Neutral/600) | #525252 (Neutral/600) |  |
| `--uui-bg-tertiary` | `bg-tertiary` | #F5F5F5 (Neutral/100) | #262626 (Neutral/800) | Toggle off track, featured icons |
| `--uui-bg-quaternary` | `bg-quaternary` | #E5E5E5 (Neutral/200) | #404040 (Neutral/700) | Slider rail, progress bar track |
| `--uui-bg-overlay` | `bg-overlay` | #0A0A0A (Neutral/950) | #262626 (Neutral/800) | Modal overlay (used at node opacity 0.7 with backdrop-blur-md) |
| `--uui-bg-brand-primary` | `bg-brand-primary` | #F9F5FF (Brand/50) | #9E77ED (Brand/500) |  |
| `--uui-bg-brand-primary-alt` | `bg-brand-primary_alt` | #F9F5FF (Brand/50) | #171717 (alias bg-secondary) | Variant of bg-brand-primary; switches to bg-secondary in dark mode |
| `--uui-bg-brand-secondary` | `bg-brand-secondary` | #F4EBFF (Brand/100) | #7F56D9 (Brand/600) |  |
| `--uui-bg-brand-solid` | `bg-brand-solid` | #7F56D9 (Brand/600) | #7F56D9 (Brand/600) | Primary button, checked checkbox/radio, toggle on |
| `--uui-bg-brand-solid-hover` | `bg-brand-solid_hover` | #6941C6 (Brand/700) | #9E77ED (Brand/500) | Primary button hover |
| `--uui-bg-brand-section` | `bg-brand-section` | #53389E (Brand/800) | #171717 (alias bg-secondary) | Dark brand section background (CTA); switches to bg-secondary in dark mode |
| `--uui-bg-brand-section-subtle` | `bg-brand-section_subtle` | #6941C6 (Brand/700) | #0A0A0A (alias bg-primary) |  |
| `--uui-bg-error-primary` | `bg-error-primary` | #FEF2F2 (Red/50) | #450A0A (Red/950) |  |
| `--uui-bg-error-secondary` | `bg-error-secondary` | #FEE2E2 (Red/100) | #DC2626 (Red/600) |  |
| `--uui-bg-error-solid` | `bg-error-solid` | #DC2626 (Red/600) | #DC2626 (Red/600) |  |
| `--uui-bg-error-solid-hover` | `bg-error-solid_hover` | #B91C1C (Red/700) | #EF4444 (Red/500) |  |
| `--uui-bg-warning-primary` | `bg-warning-primary` | #FEFCE8 (Yellow/50) | #422006 (Yellow/950) |  |
| `--uui-bg-warning-secondary` | `bg-warning-secondary` | #FEF9C3 (Yellow/100) | #CA8A04 (Yellow/600) |  |
| `--uui-bg-warning-solid` | `bg-warning-solid` | #CA8A04 (Yellow/600) | #CA8A04 (Yellow/600) |  |
| `--uui-bg-success-primary` | `bg-success-primary` | #F0FDF4 (Green/50) | #052E16 (Green/950) |  |
| `--uui-bg-success-secondary` | `bg-success-secondary` | #DCFCE7 (Green/100) | #16A34A (Green/600) |  |
| `--uui-bg-success-solid` | `bg-success-solid` | #16A34A (Green/600) | #16A34A (Green/600) |  |

#### Effects colours: focus rings and shadows (23)

Shadow colours are the colour inputs of the shadow effect styles. In Dark mode they are all `Base/transparent` (#FFFFFF00) except the two skeuomorphic inner shadows (unchanged). `shadow-xs` is the drop shadow of `Shadows/shadow-xs`.

| CSS token | Figma name | Light | Dark | Use |
|---|---|---|---|---|
| `--uui-focus-ring` | `focus-ring` | #9E77ED (Brand/500) | #9E77ED (Brand/500) | Focus ring colour (Brand/500 both modes) |
| `--uui-focus-ring-error` | `focus-ring-error` | #EF4444 (Red/500) | #EF4444 (Red/500) | Error focus ring (Red/500 both modes) |
| `--uui-shadow-xs` | `shadow-xs` | #0000000D (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-main-centre-md` | `shadow-main-centre-md` | #0A0A0A24 (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-main-centre-lg` | `shadow-main-centre-lg` | #0A0A0A2E (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-overlay-lg` | `shadow-overlay-lg` | #0A0A0A1F (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-grid-md` | `shadow-grid-md` | #0A0A0A14 (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-sm-01` | `shadow-sm_01` | #0000001A (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-sm-02` | `shadow-sm_02` | #0000001A (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-md-01` | `shadow-md_01` | #0000001A (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-md-02` | `shadow-md_02` | #0000000F (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-lg-01` | `shadow-lg_01` | #00000014 (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-lg-02` | `shadow-lg_02` | #00000008 (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-lg-03` | `shadow-lg_03` | #0000000A (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-xl-01` | `shadow-xl_01` | #00000014 (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-xl-02` | `shadow-xl_02` | #00000008 (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-xl-03` | `shadow-xl_03` | #0000000A (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-2xl-01` | `shadow-2xl_01` | #0000002E (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-2xl-02` | `shadow-2xl_02` | #0000000A (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-3xl-01` | `shadow-3xl_01` | #00000024 (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-3xl-02` | `shadow-3xl_02` | #0000000A (raw) | #FFFFFF00 (Base/transparent) |  |
| `--uui-shadow-skeumorphic-inner` | `shadow-skeumorphic-inner` | #0000000D (raw) | #0000000D (raw) |  |
| `--uui-shadow-skeumorphic-inner-border` | `shadow-skeumorphic-inner-border` | #0000002E (raw) | #0000002E (raw) |  |

#### Alpha (20, `Component colors/Alpha`)

`alpha-white-N` and `alpha-black-N` are white/black at N% alpha; in Dark mode they invert (white becomes #0A0A0A alpha, black becomes white alpha). Use for overlays that must stay legible in both themes.

| CSS token | Figma name | Light | Dark | Use |
|---|---|---|---|---|
| `--uui-alpha-white-10` | `alpha-white-10` | #FFFFFF1A (raw) | #0A0A0A1A (raw) |  |
| `--uui-alpha-white-20` | `alpha-white-20` | #FFFFFF33 (raw) | #0A0A0A33 (raw) |  |
| `--uui-alpha-white-30` | `alpha-white-30` | #FFFFFF4D (raw) | #0A0A0A4D (raw) |  |
| `--uui-alpha-white-40` | `alpha-white-40` | #FFFFFF66 (raw) | #0A0A0A66 (raw) |  |
| `--uui-alpha-white-50` | `alpha-white-50` | #FFFFFF80 (raw) | #0A0A0A80 (raw) |  |
| `--uui-alpha-white-60` | `alpha-white-60` | #FFFFFF99 (raw) | #0A0A0A99 (raw) |  |
| `--uui-alpha-white-70` | `alpha-white-70` | #FFFFFFB2 (raw) | #0A0A0AB2 (raw) |  |
| `--uui-alpha-white-80` | `alpha-white-80` | #FFFFFFCC (raw) | #0A0A0ACC (raw) |  |
| `--uui-alpha-white-90` | `alpha-white-90` | #FFFFFFE5 (raw) | #0A0A0AE5 (raw) |  |
| `--uui-alpha-white-100` | `alpha-white-100` | #FFFFFF (raw) | #0A0A0A (Neutral/950) |  |
| `--uui-alpha-black-10` | `alpha-black-10` | #0000001A (raw) | #FFFFFF1A (raw) |  |
| `--uui-alpha-black-20` | `alpha-black-20` | #00000033 (raw) | #FFFFFF33 (raw) |  |
| `--uui-alpha-black-30` | `alpha-black-30` | #0000004D (raw) | #FFFFFF4D (raw) |  |
| `--uui-alpha-black-40` | `alpha-black-40` | #00000066 (raw) | #FFFFFF66 (raw) |  |
| `--uui-alpha-black-50` | `alpha-black-50` | #00000080 (raw) | #FFFFFF80 (raw) |  |
| `--uui-alpha-black-60` | `alpha-black-60` | #00000099 (raw) | #FFFFFF99 (raw) |  |
| `--uui-alpha-black-70` | `alpha-black-70` | #000000B2 (raw) | #FFFFFFB2 (raw) |  |
| `--uui-alpha-black-80` | `alpha-black-80` | #000000CC (raw) | #FFFFFFCC (raw) |  |
| `--uui-alpha-black-90` | `alpha-black-90` | #000000E5 (raw) | #FFFFFFE5 (raw) |  |
| `--uui-alpha-black-100` | `alpha-black-100` | #000000 (raw) | #FFFFFF (raw) |  |

#### Utility colours (134 variables, hues: Neutral, Brand, Red, Orange, Amber, Yellow, Green, Emerald, Sky, Blue, Indigo, Purple, Fuchsia, Pink, Slate)

Each hue has steps 50 to 700 (Neutral and Brand also 800, 900, and Brand has `_alt` twins whose dark value points at the Neutral utility step: `utility-brand-50_alt` dark = `utility-neutral-50`). Use for badges, tags, charts and status chips: fill step 50, border step 200, text step 700 (see Badge). Light-mode hex (steps 50 to 700):

| Hue | 50 | 100 | 200 | 300 | 400 | 500 | 600 | 700 |
|---|---|---|---|---|---|---|---|---|
| Neutral | #FAFAFA | #F5F5F5 | #E5E5E5 | #D4D4D4 | #A3A3A3 | #737373 | #525252 | #404040 |
| Brand | #F9F5FF | #F4EBFF | #E9D7FE | #D6BBFB | #B692F6 | #9E77ED | #7F56D9 | #6941C6 |
| Red | #FEF2F2 | #FEE2E2 | #FECACA | #FCA5A5 | #F87171 | #EF4444 | #DC2626 | #B91C1C |
| Orange | #FFF7ED | #FFEDD5 | #FED7AA | #FDBA74 | #FB923C | #F97316 | #EA580C | #C2410C |
| Amber | #FFFBEB | #FEF3C7 | #FDE68A | #FCD34D | #FBBF24 | #F59E0B | #D97706 | #B45309 |
| Yellow | #FEFCE8 | #FEF9C3 | #FEF08A | #FDE047 | #FACC15 | #EAB308 | #CA8A04 | #A16207 |
| Green | #F0FDF4 | #DCFCE7 | #BBF7D0 | #86EFAC | #4ADE80 | #22C55E | #16A34A | #15803D |
| Emerald | #ECFDF5 | #D1FAE5 | #A7F3D0 | #6EE7B7 | #34D399 | #10B981 | #059669 | #047857 |
| Sky | #F0F9FF | #E0F2FE | #BAE6FD | #7DD3FC | #38BDF8 | #0EA5E9 | #0284C7 | #0369A1 |
| Blue | #EFF6FF | #DBEAFE | #BFDBFE | #93C5FD | #60A5FA | #3B82F6 | #2563EB | #1D4ED8 |
| Indigo | #EEF2FF | #E0E7FF | #C7D2FE | #A5B4FC | #818CF8 | #6366F1 | #4F46E5 | #4338CA |
| Purple | #FAF5FF | #F3E8FF | #E9D5FF | #D8B4FE | #C084FC | #A855F7 | #9333EA | #7E22CE |
| Fuchsia | #FDF4FF | #FAE8FF | #F5D0FE | #F0ABFC | #E879F9 | #D946EF | #C026D3 | #A21CAF |
| Pink | #FDF2F8 | #FCE7F3 | #FBCFE8 | #F9A8D4 | #F472B6 | #EC4899 | #DB2777 | #BE185D |
| Slate | #F8FAFC | #F1F5F9 | #E2E8F0 | #CBD5E1 | #94A3B8 | #64748B | #475569 | #334155 |

Dark mode mirrors the steps: 50 to 950, 100 to 900, 200 to 800, 300 to 700, 400 to 600, 500 to 500, 600 to 400, 700 to 300 of the same hue (and Brand 800, 900 to 200, 100). Exceptions read from the file: utility-neutral-50 dark=@Colors/Neutral/900 (not @Colors/Neutral/950); utility-neutral-100 dark=@Colors/Neutral/800 (not @Colors/Neutral/900); utility-neutral-200 dark=@Colors/Neutral/700 (not @Colors/Neutral/800) (the Neutral utility scale is shifted one step: 50 to 900, 100 to 800, 200 to 700, 300 to 700, 400 to 600, 500 to 500, 600 to 400, 700 to 300, 800 to 200, 900 to 100).

#### Component colours (`Component colors/Components`)

| CSS token | Figma name | Light | Dark | Use |
|---|---|---|---|---|
| `--uui-app-store-badge-border` | `app-store-badge-border` | #A6A6A6 (raw) | #FFFFFF (Base/white) |  |
| `--uui-avatar-styles-bg-neutral` | `avatar-styles-bg-neutral` | #E0E0E0 (raw) | #E0E0E0 (raw) |  |
| `--uui-footer-button-fg` | `footer-button-fg` | #E9D7FE (Brand/200) | #D4D4D4 (Neutral/300) |  |
| `--uui-footer-button-fg-hover` | `footer-button-fg_hover` | #FFFFFF (Base/white) | #F5F5F5 (Neutral/100) |  |
| `--uui-icon-fg-brand` | `icon-fg-brand` | #7F56D9 (Brand/600) | #A3A3A3 (Neutral/400) |  |
| `--uui-icon-fg-brand-on-brand` | `icon-fg-brand_on-brand` | #E9D7FE (Brand/200) | #A3A3A3 (Neutral/400) |  |
| `--uui-featured-icon-light-fg-brand` | `featured-icon-light-fg-brand` | #7F56D9 (Brand/600) | #E9D7FE (Brand/200) |  |
| `--uui-featured-icon-light-fg-gray` | `featured-icon-light-fg-gray` | #737373 (Neutral/500) | #E5E5E5 (Neutral/200) |  |
| `--uui-featured-icon-light-fg-error` | `featured-icon-light-fg-error` | #DC2626 (Red/600) | #FECACA (Red/200) |  |
| `--uui-featured-icon-light-fg-warning` | `featured-icon-light-fg-warning` | #CA8A04 (Yellow/600) | #FEF08A (Yellow/200) |  |
| `--uui-featured-icon-light-fg-success` | `featured-icon-light-fg-success` | #16A34A (Green/600) | #BBF7D0 (Green/200) |  |
| `--uui-screen-mockup-border` | `screen-mockup-border` | #171717 (Neutral/900) | #404040 (Neutral/700) |  |
| `--uui-slider-handle-bg` | `slider-handle-bg` | #FFFFFF (Base/white) | #9E77ED (alias fg-brand-primary (600)) |  |
| `--uui-slider-handle-border` | `slider-handle-border` | #7F56D9 (Brand/600) | #0A0A0A (alias bg-primary) |  |
| `--uui-toggle-border` | `toggle-border` | #D4D4D4 (Neutral/300) | #FFFFFF00 (Base/transparent) |  |
| `--uui-toggle-slim-border-pressed` | `toggle-slim-border_pressed` | #7F56D9 (alias bg-brand-solid) | #FFFFFF00 (Base/transparent) |  |
| `--uui-toggle-slim-border-pressed-hover` | `toggle-slim-border_pressed-hover` | #6941C6 (alias bg-brand-solid_hover) | #FFFFFF00 (Base/transparent) |  |
| `--uui-tooltip-supporting-text` | `tooltip-supporting-text` | #D4D4D4 (Neutral/300) | #D4D4D4 (Neutral/300) |  |
| `--uui-text-editor-icon-fg` | `text-editor-icon-fg` | #A3A3A3 (Neutral/400) | #A3A3A3 (Neutral/400) |  |
| `--uui-text-editor-icon-fg-active` | `text-editor-icon-fg_active` | #737373 (Neutral/500) | #FFFFFF (Base/white) |  |

### 2.5 Radius (`2. Radius`, raw values)

| CSS token | Figma name | Scope | Alias target | Value |
|---|---|---|---|---|
| `--uui-radius-none` | `radius-none` | CORNER_RADIUS | raw | 0px |
| `--uui-radius-xxs` | `radius-xxs` | CORNER_RADIUS | raw | 2px |
| `--uui-radius-xs` | `radius-xs` | CORNER_RADIUS | raw | 4px |
| `--uui-radius-sm` | `radius-sm` | CORNER_RADIUS | raw | 6px |
| `--uui-radius-md` | `radius-md` | CORNER_RADIUS | raw | 8px |
| `--uui-radius-lg` | `radius-lg` | CORNER_RADIUS | raw | 10px |
| `--uui-radius-xl` | `radius-xl` | CORNER_RADIUS | raw | 12px |
| `--uui-radius-2xl` | `radius-2xl` | CORNER_RADIUS | raw | 16px |
| `--uui-radius-3xl` | `radius-3xl` | CORNER_RADIUS | raw | 20px |
| `--uui-radius-4xl` | `radius-4xl` | CORNER_RADIUS | raw | 24px |
| `--uui-radius-full` | `radius-full` | CORNER_RADIUS | raw | 9999px |

### 2.6 Spacing (`3. Spacing`, aliases of primitives)

| CSS token | Figma name | Scope | Alias target | Value |
|---|---|---|---|---|
| `--uui-spacing-none` | `spacing-none` | GAP | Spacing/0 (0px) | 0px |
| `--uui-spacing-xxs` | `spacing-xxs` | GAP | Spacing/0․5 (2px) | 2px |
| `--uui-spacing-xs` | `spacing-xs` | GAP | Spacing/1 (4px) | 4px |
| `--uui-spacing-sm` | `spacing-sm` | GAP | Spacing/1․5 (6px) | 6px |
| `--uui-spacing-md` | `spacing-md` | GAP | Spacing/2 (8px) | 8px |
| `--uui-spacing-lg` | `spacing-lg` | GAP | Spacing/3 (12px) | 12px |
| `--uui-spacing-xl` | `spacing-xl` | GAP | Spacing/4 (16px) | 16px |
| `--uui-spacing-2xl` | `spacing-2xl` | GAP | Spacing/5 (20px) | 20px |
| `--uui-spacing-3xl` | `spacing-3xl` | GAP | Spacing/6 (24px) | 24px |
| `--uui-spacing-4xl` | `spacing-4xl` | GAP | Spacing/8 (32px) | 32px |
| `--uui-spacing-5xl` | `spacing-5xl` | GAP | Spacing/10 (40px) | 40px |
| `--uui-spacing-6xl` | `spacing-6xl` | GAP | Spacing/12 (48px) | 48px |
| `--uui-spacing-7xl` | `spacing-7xl` | GAP | Spacing/16 (64px) | 64px |
| `--uui-spacing-8xl` | `spacing-8xl` | GAP | Spacing/20 (80px) | 80px |
| `--uui-spacing-9xl` | `spacing-9xl` | GAP | Spacing/24 (96px) | 96px |
| `--uui-spacing-10xl` | `spacing-10xl` | GAP | Spacing/32 (128px) | 128px |
| `--uui-spacing-11xl` | `spacing-11xl` | GAP | Spacing/40 (160px) | 160px |

### 2.7 Widths (`4. Widths`) and Containers (`5. Containers`)

| CSS token | Figma name | Scope | Alias target | Value |
|---|---|---|---|---|
| `--uui-width-xxs` | `width-xxs` | WIDTH_HEIGHT | Spacing/80 (320px) | 320px |
| `--uui-width-xs` | `width-xs` | WIDTH_HEIGHT | Spacing/96 (384px) | 384px |
| `--uui-width-sm` | `width-sm` | WIDTH_HEIGHT | Spacing/120 (480px) | 480px |
| `--uui-width-md` | `width-md` | WIDTH_HEIGHT | Spacing/140 (560px) | 560px |
| `--uui-width-lg` | `width-lg` | WIDTH_HEIGHT | Spacing/160 (640px) | 640px |
| `--uui-width-xl` | `width-xl` | WIDTH_HEIGHT | Spacing/192 (768px) | 768px |
| `--uui-width-2xl` | `width-2xl` | WIDTH_HEIGHT | Spacing/256 (1,024px) | 1024px |
| `--uui-width-3xl` | `width-3xl` | WIDTH_HEIGHT | Spacing/320 (1,280px) | 1280px |
| `--uui-width-4xl` | `width-4xl` | WIDTH_HEIGHT | Spacing/360 (1,440px) | 1440px |
| `--uui-width-5xl` | `width-5xl` | WIDTH_HEIGHT | Spacing/400 (1,600px) | 1600px |
| `--uui-width-6xl` | `width-6xl` | WIDTH_HEIGHT | Spacing/480 (1,920px) | 1920px |
| `--uui-paragraph-max-width` | `paragraph-max-width` | ALL | Spacing/180 (720px) | 720px |

| CSS token | Figma name | Scope | Alias target | Value |
|---|---|---|---|---|
| `--uui-container-padding-mobile` | `container-padding-mobile` | GAP | Spacing/4 (16px) | 16px |
| `--uui-container-padding-desktop` | `container-padding-desktop` | GAP | Spacing/8 (32px) | 32px |
| `--uui-container-max-width-desktop` | `container-max-width-desktop` | WIDTH_HEIGHT | Spacing/320 (1,280px) | 1280px |

### 2.8 Typography variables (`6. Typography`)

| CSS token | Figma name | Scope | Value |
|---|---|---|---|
| `--uui-font-family-display` | `Font family/font-family-display` | FONT_FAMILY | Inter |
| `--uui-font-family-body` | `Font family/font-family-body` | FONT_FAMILY | Inter |
| `--uui-font-weight-regular` | `Font weight/regular` | FONT_STYLE | Regular |
| `--uui-font-weight-regular-italic` | `Font weight/regular-italic` | FONT_STYLE | Regular italic |
| `--uui-font-weight-medium` | `Font weight/medium` | FONT_STYLE | Medium |
| `--uui-font-weight-medium-italic` | `Font weight/medium-italic` | FONT_STYLE | Medium italic |
| `--uui-font-weight-semibold` | `Font weight/semibold` | FONT_STYLE | Semibold |
| `--uui-font-weight-semibold-italic` | `Font weight/semibold-italic` | FONT_STYLE | Semibold italic |
| `--uui-font-weight-bold` | `Font weight/bold` | FONT_STYLE | Bold |
| `--uui-font-weight-bold-italic` | `Font weight/bold-italic` | FONT_STYLE | Bold italic |
| `--uui-font-size-text-xs` | `Font size/text-xs` | FONT_SIZE | 12px |
| `--uui-line-height-text-xs` | `Line height/text-xs` | LINE_HEIGHT | 18px |
| `--uui-line-height-text-sm` | `Line height/text-sm` | LINE_HEIGHT | 20px |
| `--uui-line-height-text-md` | `Line height/text-md` | LINE_HEIGHT | 24px |
| `--uui-line-height-text-lg` | `Line height/text-lg` | LINE_HEIGHT | 28px |
| `--uui-line-height-text-xl` | `Line height/text-xl` | LINE_HEIGHT | 30px |
| `--uui-line-height-display-xs` | `Line height/display-xs` | LINE_HEIGHT | 32px |
| `--uui-line-height-display-sm` | `Line height/display-sm` | LINE_HEIGHT | 38px |
| `--uui-line-height-display-md` | `Line height/display-md` | LINE_HEIGHT | 44px |
| `--uui-line-height-display-lg` | `Line height/display-lg` | LINE_HEIGHT | 60px |
| `--uui-line-height-display-xl` | `Line height/display-xl` | LINE_HEIGHT | 72px |
| `--uui-line-height-display-2xl` | `Line height/display-2xl` | LINE_HEIGHT | 90px |
| `--uui-font-size-text-sm` | `Font size/text-sm` | FONT_SIZE | 14px |
| `--uui-font-size-text-md` | `Font size/text-md` | FONT_SIZE | 16px |
| `--uui-font-size-text-lg` | `Font size/text-lg` | FONT_SIZE | 18px |
| `--uui-font-size-text-xl` | `Font size/text-xl` | FONT_SIZE | 20px |
| `--uui-font-size-display-xs` | `Font size/display-xs` | FONT_SIZE | 24px |
| `--uui-font-size-display-sm` | `Font size/display-sm` | FONT_SIZE | 30px |
| `--uui-font-size-display-md` | `Font size/display-md` | FONT_SIZE | 36px |
| `--uui-font-size-display-lg` | `Font size/display-lg` | FONT_SIZE | 48px |
| `--uui-font-size-display-xl` | `Font size/display-xl` | FONT_SIZE | 60px |
| `--uui-font-size-display-2xl` | `Font size/display-2xl` | FONT_SIZE | 72px |

---

## 3. Typography

Family: **Inter** for both `font-family-display` and `font-family-body` (variable-bound; text styles report no explicit fontName because it comes from the variable). Weights (Figma style names): Regular, Medium, Semibold (Figma font style string "Semi Bold" in the family; variable string "Semibold"), Bold; each also exists as an italic variable. Numeric CSS weights 400/500/600/700 are the standard mapping of those names (inferred).

### 3.1 Text styles (44 = 11 sizes x 4 weights)

Style names are `<Size> / <Weight>` in Figma (for example "Text md/Semibold" appears in node reads). textCase original, no decoration. fontSize, lineHeight and paragraphSpacing are variable-bound (paragraph spacing is bound to the same Font size variable, so it equals the font size in px; unused in web CSS). Line heights are fixed px; letter spacing is in %.

| Text style (x Regular / Medium / Semibold / Bold) | Size px | Line height px | Letter spacing | Family variable |
|---|---|---|---|---|
| Display 2xl | 72 | 90 | -2% | font-family-display |
| Display xl | 60 | 72 | -2% | font-family-display |
| Display lg | 48 | 60 | -2% | font-family-display |
| Display md | 36 | 44 | -2% | font-family-display |
| Display sm | 30 | 38 | 0% | font-family-display |
| Display xs | 24 | 32 | 0% | font-family-display |
| Text xl | 20 | 30 | 0% | font-family-body |
| Text lg | 18 | 28 | 0% | font-family-body |
| Text md | 16 | 24 | 0% | font-family-body |
| Text sm | 14 | 20 | 0% | font-family-body |
| Text xs | 12 | 18 | 0% | font-family-body |

Rem equivalents (documented in Figma, base 16px): 72px = 4.5rem, 90px = 5.625rem, 16px = 1rem. Use rem for fluid scaling only if the root font size stays 16px.

### 3.2 Hierarchy and usage

| Role | Style | Colour token | Where read |
|---|---|---|---|
| Hero / marketing H1 | Display 2xl or xl, Semibold | `text-primary` | inferred, not read from nodes |
| Page title | Display md or sm, Semibold | `text-primary` | Metric number uses Display sm/Semibold; progress circle number Display md/Semibold |
| Section heading | Display xs / Text xl, Semibold | `text-primary` or `text-secondary` | inferred, not read from nodes |
| Card/panel title, modal title, alert title | Text md or sm, Semibold | `text-primary` / `text-secondary` | Alert title Text sm/Semibold `text-secondary` read; other titles inferred |
| Body paragraph | Text md Regular | `text-tertiary` | Vendor guidance: supporting/paragraph text |
| Supporting text, hint, table body | Text sm Regular | `text-tertiary` | Input hint, table supporting text |
| Label | Text sm Medium | `text-secondary` | Input label, checkbox label is Text md/Medium |
| Button label | Text sm Semibold (xs/sm/md), Text md Semibold (lg/xl) | per hierarchy | Button |
| Caption, badge, shortcut | Text xs Medium | badge colours / `text-quaternary` | Badge sm, shortcut in menus |
| Table header | Text xs Semibold | `text-quaternary` | Table header cell |
| Nav item | Text sm Semibold | `text-secondary` | Sidebar and header navigation |
| Placeholder | Text md Regular (input), Text sm Regular (search) | `text-placeholder` | Input, sidebar search |

Line length: `paragraph-max-width` = 720px for long text (the file states paragraph lines are optimised for readability). The Designer role target of 45 to 75 characters per line applies on top.

---

## 4. Colour system

### 4.1 Semantic roles (summary)

| Family | Tokens | Meaning |
|---|---|---|
| `text-*` | primary, secondary, tertiary, quaternary (+ `_hover`, `_on-brand`), white, placeholder, brand-primary/secondary/tertiary, error-primary, warning-primary, success-primary | Strong to subtle text; `_on-brand` variants for text sitting on brand sections |
| `border-*` | primary, secondary (+ `_alt`), tertiary, brand (+ `_alt`), error (+ `_subtle`) | primary = high contrast control edges; secondary = default structure; tertiary = subtlest |
| `fg-*` | primary, secondary, tertiary, quaternary, white, brand-primary/secondary, error/warning/success primary and secondary | Icon and glyph colour (`fg-quaternary` for low-contrast icons in buttons, help and input icons) |
| `bg-*` | primary, secondary, tertiary, quaternary, overlay, primary-solid, secondary-solid, brand-primary/secondary/solid/section, error/warning/success primary/secondary/solid | Surfaces and fills: primary/secondary page and panels, tertiary toggles and featured icons, quaternary sliders and progress tracks |
| `utility-*` | 15 hues | Badges, tags, chips, charts |
| status | error Red, warning Yellow (not Orange), success Green | `bg-warning-*` and `fg-warning-*` use the Yellow palette |

### 4.2 Dark-mode mapping

Dark mode is a second mode of the same variables. Key mappings (all read): `bg-primary` white to Neutral/950; `bg-secondary` Neutral/50 to 900; `bg-tertiary` 100 to 800; `bg-quaternary` 200 to 700; `bg-overlay` 950 to 800; `bg-primary-solid` Neutral/950 to `bg-tertiary`; `bg-brand-primary` Brand/50 to Brand/500; `bg-brand-secondary` Brand/100 to Brand/600; `bg-brand-solid` Brand/600 both (hover Brand/700 light, Brand/500 dark); `bg-brand-section` Brand/800 to `bg-secondary`; text-primary Neutral/900 to 50; secondary 700 to 300; tertiary 600 to 400; quaternary 500 to 400; placeholder 500 both; border-primary 300 to 700; border-secondary 200 to 800; border-brand Brand/500 to 400; status text 600 to 400 (Red, Yellow, Green); fg-primary Neutral/900 to white; fg-quaternary 400 to 500; fg-brand-primary Brand/600 to 500. The `_alt` tokens collapse into the neighbouring surface in dark mode (`bg-primary_alt` to `bg-secondary`, `bg-secondary_alt` to `bg-primary`).

### 4.3 Contrast (computed, WCAG 2.x relative luminance; AA = 4.5:1 text, 3:1 large text and UI)

Method: sRGB relative luminance of the resolved hex values from section 2; ratio = (L1 + 0.05) / (L2 + 0.05). Alpha values were composited over the stated background. Script: reproducible from tokens.json.

**Light mode, text and button pairs**

| Foreground | Background | Ratio | WCAG 2.2 | Where used |
|---|---|---|---|---|
| `text-primary` #171717 | `bg-primary` #FFFFFF | 17.93:1 | AAA | Primary text / page background |
| `text-primary` #171717 | `bg-secondary` #FAFAFA | 17.18:1 | AAA | Primary text / secondary surface |
| `text-secondary` #404040 | `bg-primary` #FFFFFF | 10.37:1 | AAA | Labels, secondary-button text |
| `text-secondary-hover` #262626 | `bg-primary-hover` #FAFAFA | 14.50:1 | AAA | Secondary button hover |
| `text-tertiary` #525252 | `bg-primary` #FFFFFF | 7.81:1 | AAA | Supporting text, tertiary-button text |
| `text-tertiary` #525252 | `bg-secondary` #FAFAFA | 7.49:1 | AAA | Supporting text on secondary surface |
| `text-tertiary-hover` #404040 | `bg-primary-hover` #FAFAFA | 9.93:1 | AAA | Tertiary button hover |
| `text-quaternary` #737373 | `bg-primary` #FFFFFF | 4.74:1 | AA | Subtle text, inactive tab, table header |
| `text-quaternary` #737373 | `bg-secondary` #FAFAFA | 4.54:1 | AA | Table header label on header row fill |
| `text-placeholder` #737373 | `bg-primary` #FFFFFF | 4.74:1 | AA | Input placeholder |
| `text-brand-secondary` #6941C6 | `bg-primary` #FFFFFF | 6.62:1 | AA | Link color button, active tab |
| `text-brand-secondary` #6941C6 | `bg-brand-primary-alt` #F9F5FF | 6.16:1 | AA | Active tab (Button brand) on tinted fill |
| `text-brand-tertiary` #7F56D9 | `bg-primary` #FFFFFF | 4.96:1 | AA | Required asterisk |
| `text-error-primary` #DC2626 | `bg-primary` #FFFFFF | 4.83:1 | AA | Error message |
| `text-warning-primary` #CA8A04 | `bg-primary` #FFFFFF | 2.94:1 | FAIL | Warning text |
| `text-success-primary` #16A34A | `bg-primary` #FFFFFF | 3.30:1 | AA large/UI only (>=3) | Success text / positive trend |
| `text-white` #FFFFFF | `bg-brand-solid` #7F56D9 | 4.96:1 | AA | PRIMARY BUTTON default |
| `text-white` #FFFFFF | `bg-brand-solid-hover` #6941C6 | 6.62:1 | AA | PRIMARY BUTTON hover |
| `text-white` #FFFFFF | `bg-error-solid` #DC2626 | 4.83:1 | AA | Destructive primary button |
| `text-white` #FFFFFF | `bg-error-solid-hover` #B91C1C | 6.47:1 | AA | Destructive primary hover |
| `text-white` #FFFFFF | `bg-primary-solid` #0A0A0A | 19.80:1 | AAA | Tooltip title |
| `tooltip-supporting-text` #D4D4D4 | `bg-primary-solid` #0A0A0A | 13.36:1 | AAA | Tooltip supporting text |
| `text-primary-on-brand` #FFFFFF | `bg-brand-section` #53389E | 8.65:1 | AAA | Text on brand section |
| `text-secondary-on-brand` #E9D7FE | `bg-brand-section` #53389E | 6.43:1 | AA | Text on brand section (secondary) |
| `text-tertiary-on-brand` #E9D7FE | `bg-brand-section` #53389E | 6.43:1 | AA | Text on brand section (tertiary) |
| `text-quaternary-on-brand` #D6BBFB | `bg-brand-section` #53389E | 5.09:1 | AA | Text on brand section (quaternary) |
| `text-error-primary` #DC2626 | `bg-error-primary` #FEF2F2 | 4.41:1 | AA large/UI only (>=3) | Error text on error tint |
| `utility-neutral-700` #404040 | `utility-neutral-50` #FAFAFA | 9.93:1 | AAA | Badge Gray (pill) |
| `utility-brand-700` #6941C6 | `utility-brand-50` #F9F5FF | 6.16:1 | AA | Badge Brand |
| `utility-red-700` #B91C1C | `utility-red-50` #FEF2F2 | 5.91:1 | AA | Badge Error |
| `utility-yellow-700` #A16207 | `utility-yellow-50` #FEFCE8 | 4.76:1 | AA | Badge Warning |
| `utility-green-700` #15803D | `utility-green-50` #F0FDF4 | 4.79:1 | AA | Badge Success |

**Light mode, non-text (UI components, 3:1 target)**

| Foreground | Background | Ratio | WCAG 2.2 | Where used |
|---|---|---|---|---|
| `border-primary` #D4D4D4 | `bg-primary` #FFFFFF | 1.48:1 | below 3 | Input / button / checkbox border (target 3:1) |
| `border-secondary` #E5E5E5 | `bg-primary` #FFFFFF | 1.26:1 | below 3 | Card / table / divider border (decorative) |
| `border-brand` #9E77ED | `bg-primary` #FFFFFF | 3.33:1 | pass >=3 | Focused input border |
| `border-error` #EF4444 | `bg-primary` #FFFFFF | 3.76:1 | pass >=3 | Error input border |
| `focus-ring` #9E77ED | `bg-primary` #FFFFFF | 3.33:1 | pass >=3 | Focus ring |
| `fg-quaternary` #A3A3A3 | `bg-primary` #FFFFFF | 2.52:1 | below 3 | Icon in input/button (400) |
| `fg-brand-primary` #7F56D9 | `bg-primary` #FFFFFF | 4.96:1 | pass >=3 | Brand icon / progress fill / selected check |
| `bg-brand-solid` #7F56D9 | `bg-primary` #FFFFFF | 4.96:1 | pass >=3 | Checked checkbox / toggle on / primary button vs page |
| `bg-tertiary` #F5F5F5 | `bg-primary` #FFFFFF | 1.09:1 | below 3 | Toggle off track |
| `bg-quaternary` #E5E5E5 | `bg-primary` #FFFFFF | 1.26:1 | below 3 | Progress track / slider rail |

**Dark mode, text and button pairs**

| Foreground | Background | Ratio | WCAG 2.2 | Where used |
|---|---|---|---|---|
| `text-primary` #FAFAFA | `bg-primary` #0A0A0A | 18.97:1 | AAA | Primary text / page background |
| `text-primary` #FAFAFA | `bg-secondary` #171717 | 17.18:1 | AAA | Primary text / secondary surface |
| `text-secondary` #D4D4D4 | `bg-primary` #0A0A0A | 13.36:1 | AAA | Labels, secondary-button text |
| `text-secondary-hover` #E5E5E5 | `bg-primary-hover` #171717 | 14.23:1 | AAA | Secondary button hover |
| `text-tertiary` #A3A3A3 | `bg-primary` #0A0A0A | 7.85:1 | AAA | Supporting text, tertiary-button text |
| `text-tertiary` #A3A3A3 | `bg-secondary` #171717 | 7.11:1 | AAA | Supporting text on secondary surface |
| `text-tertiary-hover` #D4D4D4 | `bg-primary-hover` #171717 | 12.09:1 | AAA | Tertiary button hover |
| `text-quaternary` #A3A3A3 | `bg-primary` #0A0A0A | 7.85:1 | AAA | Subtle text, inactive tab, table header |
| `text-quaternary` #A3A3A3 | `bg-secondary` #171717 | 7.11:1 | AAA | Table header label on header row fill |
| `text-placeholder` #737373 | `bg-primary` #0A0A0A | 4.18:1 | AA large/UI only (>=3) | Input placeholder |
| `text-brand-secondary` #D4D4D4 | `bg-primary` #0A0A0A | 13.36:1 | AAA | Link color button, active tab |
| `text-brand-secondary` #D4D4D4 | `bg-brand-primary-alt` #171717 | 12.09:1 | AAA | Active tab (Button brand) on tinted fill |
| `text-brand-tertiary` #A3A3A3 | `bg-primary` #0A0A0A | 7.85:1 | AAA | Required asterisk |
| `text-error-primary` #F87171 | `bg-primary` #0A0A0A | 7.16:1 | AAA | Error message |
| `text-warning-primary` #FACC15 | `bg-primary` #0A0A0A | 12.93:1 | AAA | Warning text |
| `text-success-primary` #4ADE80 | `bg-primary` #0A0A0A | 11.36:1 | AAA | Success text / positive trend |
| `text-white` #FFFFFF | `bg-brand-solid` #7F56D9 | 4.96:1 | AA | PRIMARY BUTTON default |
| `text-white` #FFFFFF | `bg-brand-solid-hover` #9E77ED | 3.33:1 | AA large/UI only (>=3) | PRIMARY BUTTON hover |
| `text-white` #FFFFFF | `bg-error-solid` #DC2626 | 4.83:1 | AA | Destructive primary button |
| `text-white` #FFFFFF | `bg-error-solid-hover` #EF4444 | 3.76:1 | AA large/UI only (>=3) | Destructive primary hover |
| `text-white` #FFFFFF | `bg-primary-solid` #262626 | 15.13:1 | AAA | Tooltip title |
| `tooltip-supporting-text` #D4D4D4 | `bg-primary-solid` #262626 | 10.21:1 | AAA | Tooltip supporting text |
| `text-primary-on-brand` #FAFAFA | `bg-brand-section` #171717 | 17.18:1 | AAA | Text on brand section |
| `text-secondary-on-brand` #D4D4D4 | `bg-brand-section` #171717 | 12.09:1 | AAA | Text on brand section (secondary) |
| `text-tertiary-on-brand` #A3A3A3 | `bg-brand-section` #171717 | 7.11:1 | AAA | Text on brand section (tertiary) |
| `text-quaternary-on-brand` #A3A3A3 | `bg-brand-section` #171717 | 7.11:1 | AAA | Text on brand section (quaternary) |
| `text-error-primary` #F87171 | `bg-error-primary` #450A0A | 5.84:1 | AA | Error text on error tint |
| `utility-neutral-700` #D4D4D4 | `utility-neutral-50` #171717 | 12.09:1 | AAA | Badge Gray (pill) |
| `utility-brand-700` #D6BBFB | `utility-brand-50` #2C1C5F | 8.59:1 | AAA | Badge Brand |
| `utility-red-700` #FCA5A5 | `utility-red-50` #450A0A | 8.51:1 | AAA | Badge Error |
| `utility-yellow-700` #FDE047 | `utility-yellow-50` #422006 | 11.06:1 | AAA | Badge Warning |
| `utility-green-700` #86EFAC | `utility-green-50` #052E16 | 10.62:1 | AAA | Badge Success |

**Dark mode, non-text**

| Foreground | Background | Ratio | WCAG 2.2 | Where used |
|---|---|---|---|---|
| `border-primary` #404040 | `bg-primary` #0A0A0A | 1.91:1 | below 3 | Input / button / checkbox border (target 3:1) |
| `border-secondary` #262626 | `bg-primary` #0A0A0A | 1.31:1 | below 3 | Card / table / divider border (decorative) |
| `border-brand` #B692F6 | `bg-primary` #0A0A0A | 7.95:1 | pass >=3 | Focused input border |
| `border-error` #F87171 | `bg-primary` #0A0A0A | 7.16:1 | pass >=3 | Error input border |
| `focus-ring` #9E77ED | `bg-primary` #0A0A0A | 5.95:1 | pass >=3 | Focus ring |
| `fg-quaternary` #737373 | `bg-primary` #0A0A0A | 4.18:1 | pass >=3 | Icon in input/button (400) |
| `fg-brand-primary` #9E77ED | `bg-primary` #0A0A0A | 5.95:1 | pass >=3 | Brand icon / progress fill / selected check |
| `bg-brand-solid` #7F56D9 | `bg-primary` #0A0A0A | 3.99:1 | pass >=3 | Checked checkbox / toggle on / primary button vs page |
| `bg-tertiary` #262626 | `bg-primary` #0A0A0A | 1.31:1 | below 3 | Toggle off track |
| `bg-quaternary` #404040 | `bg-primary` #0A0A0A | 1.91:1 | below 3 | Progress track / slider rail |

**Disabled (node opacity 0.5)**: WCAG exempts disabled controls, shown for information.

| Case (node opacity 0.5 over bg-primary) | Light | Dark |
|---|---|---|
| Primary button disabled: white text on 50% brand fill (effective fill / text) | 2.06:1 (#BFAAEC / #FFFFFF) | 2.94:1 (#443072 / #848484) |
| Secondary button disabled: text-secondary at 50% on bg-primary (effective text #A0A0A0 light / #6F6F6F dark) | 2.61:1 | 3.94:1 |

**Findings (pairs below target, taken from the table values above):**

- light mode, text: `text-warning-primary` on `bg-primary` = 2.94:1
- light mode, text: `text-success-primary` on `bg-primary` = 3.30:1
- light mode, text: `text-error-primary` on `bg-error-primary` = 4.41:1
- light mode, UI/non-text: `border-primary` on `bg-primary` = 1.48:1
- light mode, UI/non-text: `border-secondary` on `bg-primary` = 1.26:1
- light mode, UI/non-text: `fg-quaternary` on `bg-primary` = 2.52:1
- light mode, UI/non-text: `bg-tertiary` on `bg-primary` = 1.09:1
- light mode, UI/non-text: `bg-quaternary` on `bg-primary` = 1.26:1
- dark mode, text: `text-placeholder` on `bg-primary` = 4.18:1
- dark mode, text: `text-white` on `bg-brand-solid-hover` = 3.33:1
- dark mode, text: `text-white` on `bg-error-solid-hover` = 3.76:1
- dark mode, UI/non-text: `border-primary` on `bg-primary` = 1.91:1
- dark mode, UI/non-text: `border-secondary` on `bg-primary` = 1.31:1
- dark mode, UI/non-text: `bg-tertiary` on `bg-primary` = 1.31:1
- dark mode, UI/non-text: `bg-quaternary` on `bg-primary` = 1.91:1

What to do (decisions for builders, ASSUMPTIONS are marked): the primary-button label (white on `bg-brand-solid`) passes AA at 4.96:1 in light and dark. `text-warning-primary` on white (2.94:1) and `text-success-primary` on white (3.30:1) fail 4.5:1 for normal text: use them only with an icon, in 18px+ semibold or bold text (3:1 large text), or place the message on the matching tinted `bg-warning-primary`/`bg-success-primary` surface and verify; for warning copy prefer `utility-yellow-700` (#A16207, 4.76:1 on `utility-yellow-50`) as the Badge does. `border-primary` (1.48:1) and `fg-quaternary` (2.52:1) are below 3:1: the input boundary and icon are decorative-weight in the kit; pair every input with a visible label and never rely on the border or icon alone. Dark mode hover of the primary button (white on Brand/500 #9E77ED = 3.33:1) is below 4.5:1; keep the label Semibold 14px+ and note it in review (Figma value, not changed).

---

## 5. Spacing, sizing, radius, borders, breakpoints, effects

### 5.1 Spacing, radius, widths, containers

Tables are in sections 2.5 to 2.7 (identical values in tokens.css). Rhythm observed in components (read): gaps 2 (tight icon groups, nav item rows in the header), 4 (icon to text in buttons), 6 (label to field, lg button gap), 8 (default control gap), 12 (default inline gap, checkbox to label), 16 (card/section inner gap, alert padding), 20 (card padding in metrics and sidebar header), 24 (modal and table cell horizontal padding), 32 (container padding desktop, vertical stack gap in empty state).

### 5.2 Grid and breakpoints

Figma has **no breakpoint variables**. Layout grid styles (8) and the documentation give:

| Style | Columns | Gutter | Margin/offset | Frame width (docs) | Content width |
|---|---|---|---|---|---|
| Grid desktop | 12, stretch | 32 | offset 112 (read) | Desktop 1,280 (docs label) | 1,216 (docs label) |
| Grid tablet | 6, stretch | 32 | 32 | Tablet 768 | 704 |
| Grid mobile | 4, stretch | 16 | 16 | iPhone 375 | 343 |
| 12 / 6 / 5 / 3 / 2 columns (auto) | 12, 6, 5, 3, 2 | 32 | none | n/a | n/a |

Inconsistency to know: the desktop style offset 112 equals (1440 - 1216) / 2, so the style targets a 1440-wide frame, while the documentation labels the desktop frame 1,280 and the header navigation container is 1280 wide with 32px side padding inside a 1440 frame (read: header 1440x64, container 1280, padding 0/32). Treat **1280 as the max content container** (`container-max-width-desktop`) and 1216 as its content width after 32px padding.

Frame widths used by the kit (read): Mobile 375, Tablet 768, Desktop 1440 (modal desktop frame 1440x960; header 1440). Component `Breakpoint` variant has only two values: **Desktop** and **Mobile**.

CSS breakpoints for the build (**inferred**, ASSUMPTION): mobile-first; tablet at `min-width: 768px`; desktop at `min-width: 1280px`; verify at 375, 768, 1280, 1920 per the team charter. Widths 1440 (`width-4xl`), 1600, 1920 exist as width tokens.

### 5.3 Borders

No border-width variables. Read values: 1px is the default stroke (inputs, buttons, cards, tables, tags); 2px for focused inputs/selects (`border-brand`), the primary-button gradient stroke, check and minus glyph strokes, slider handle border; 1.5px for the avatar online-status ring; 0.5px for the toggle track stroke and the avatar wrapper stroke; 0.75px for the bordered-avatar outer ring; 1.5 to 1.67 px for icon strokes at 16 to 20px size.

### 5.4 Effects (26 effect styles)

CSS tokens are `--uui-effect-*` in tokens.css (largest layer first). Backdrop blurs: sm 8, md 16, lg 24, xl 40 px (`--uui-backdrop-blur-*`; Modal overlay uses md).

| Effect style | Layers (type x y blur spread colour $variable) | CSS token |
|---|---|---|
| `Shadows/shadow-xs` | DROP 0 1 2 0 #0000000D $shadow-xs | `--uui-effect-shadow-xs` |
| `Shadows/shadow-xs-skeuomorphic` | DROP 0 1 2 0 #0000000D $shadow-xs<br>INNER 0 -2 0 0 #0000000D $shadow-skeumorphic-inner<br>INNER 0 0 0 1 #0000002E $shadow-skeumorphic-inner-border | `--uui-effect-shadow-xs-skeuomorphic` |
| `Shadows/shadow-sm` | DROP 0 1 2 -1 #0000001A $shadow-sm_02<br>DROP 0 1 3 0 #0000001A $shadow-sm_01 | `--uui-effect-shadow-sm` |
| `Shadows/shadow-md` | DROP 0 2 4 -2 #0000000F $shadow-md_02<br>DROP 0 4 6 -1 #0000001A $shadow-md_01 | `--uui-effect-shadow-md` |
| `Shadows/shadow-lg` | DROP 0 2 2 -1 #0000000A $shadow-lg_03<br>DROP 0 4 6 -2 #00000008 $shadow-lg_02<br>DROP 0 12 16 -4 #00000014 $shadow-lg_01 | `--uui-effect-shadow-lg` |
| `Shadows/shadow-xl` | DROP 0 3 3 -1.5 #0000000A $shadow-xl_03<br>DROP 0 8 8 -4 #00000008 $shadow-xl_02<br>DROP 0 20 24 -4 #00000014 $shadow-xl_01 | `--uui-effect-shadow-xl` |
| `Shadows/shadow-2xl` | DROP 0 4 4 -2 #0000000A $shadow-2xl_02<br>DROP 0 24 48 -12 #0000002E $shadow-2xl_01 | `--uui-effect-shadow-2xl` |
| `Shadows/shadow-3xl` | DROP 0 5 5 -2.5 #0000000A $shadow-3xl_02<br>DROP 0 32 64 -12 #00000024 $shadow-3xl_01 | `--uui-effect-shadow-3xl` |
| `Shadows/Portfolio mockups/shadow-main-centre-md` | DROP 0 75 150 0 #0A0A0A24 $shadow-main-centre-md | `--uui-effect-shadow-main-centre-md` |
| `Shadows/Portfolio mockups/shadow-main-centre-lg` | DROP 0 100 200 0 #0A0A0A2E $shadow-main-centre-lg | `--uui-effect-shadow-main-centre-lg` |
| `Shadows/Portfolio mockups/shadow-overlay-right-lg` | DROP -40 40 72 0 #0A0A0A1F $shadow-overlay-lg | `--uui-effect-shadow-overlay-right-lg` |
| `Shadows/Portfolio mockups/shadow-overlay-left-lg` | DROP 100 100 150 0 #0A0A0A1F $shadow-overlay-lg | `--uui-effect-shadow-overlay-left-lg` |
| `Shadows/Portfolio mockups/shadow-grid-md` | DROP 32 32 64 0 #0A0A0A14 $shadow-grid-md | `--uui-effect-shadow-grid-md` |
| `Focus rings/focus-ring` | DROP 0 0 0 4 #9E77ED $focus-ring<br>DROP 0 0 0 2 #FFFFFF $bg-primary | `--uui-effect-focus-ring` |
| `Focus rings/focus-ring-shadow-xs` | DROP 0 0 0 4 #9E77ED $focus-ring<br>DROP 0 0 0 2 #FFFFFF $bg-primary<br>DROP 0 1 2 0 #0000000D $shadow-xs | `--uui-effect-focus-ring-shadow-xs` |
| `Focus rings/focus-ring-shadow-xs-skeuomorphic` | DROP 0 0 0 4 #9E77ED $focus-ring<br>DROP 0 0 0 2 #FFFFFF $bg-primary<br>DROP 0 1 2 0 #0000000D $shadow-xs<br>INNER 0 -2 0 0 #0000000D $shadow-skeumorphic-inner<br>INNER 0 0 0 1 #0000002E $shadow-skeumorphic-inner-border | `--uui-effect-focus-ring-shadow-xs-skeuomorphic` |
| `Focus rings/focus-ring-shadow-sm` | DROP 0 0 0 4 #9E77ED $focus-ring<br>DROP 0 0 0 2 #FFFFFF $bg-primary<br>DROP 0 1 2 0 #0000001A $shadow-sm_02<br>DROP 0 1 3 0 #0000001A $shadow-sm_01 | `--uui-effect-focus-ring-shadow-sm` |
| `Focus rings/focus-ring-error` | DROP 0 0 0 4 #EF4444 $focus-ring-error<br>DROP 0 0 0 2 #FFFFFF $bg-primary | `--uui-effect-focus-ring-error` |
| `Focus rings/focus-ring-error-shadow-xs` | DROP 0 0 0 4 #EF4444 $focus-ring-error<br>DROP 0 0 0 2 #FFFFFF $bg-primary<br>DROP 0 1 2 0 #0000000D $shadow-xs | `--uui-effect-focus-ring-error-shadow-xs` |
| `Focus rings/focus-ring-error-shadow-xs-skeuomorphic` | DROP 0 0 0 4 #EF4444 $focus-ring-error<br>DROP 0 0 0 2 #FFFFFF $bg-primary<br>DROP 0 1 2 0 #0000000D $shadow-xs<br>INNER 0 -2 0 0 #0000000D $shadow-skeumorphic-inner<br>INNER 0 0 0 1 #0000002E $shadow-skeumorphic-inner-border | `--uui-effect-focus-ring-error-shadow-xs-skeuomorphic` |
| `Shadows/Avatars/Avatar inner shadow` | INNER 0 0 0 0.5 #00000029 (literal)<br>INNER 0 0 0 1 #FFFFFF3D (literal) | `--uui-effect-avatar-inner-shadow` |
| `Shadows/Avatars/Avatar icon` | INNER 0 0 0 0.5 #00000029 (literal)<br>INNER 0 0 0 1 #FFFFFF3D (literal)<br>DROP 0 0 0 1 #FFFFFF $bg-primary | `--uui-effect-avatar-icon` |

### 5.5 Values that exist only as hard-coded numbers (no token in Figma)

| Value | Where read | Use in code |
|---|---|---|
| Opacity 0.5 | Disabled state of button, checkbox, radio, toggle, input frame, select item | `opacity: 0.5` on the control |
| Opacity 0.7 + backdrop blur md 16px | Modal overlay (`bg-overlay`) | overlay `opacity: .7` |
| Opacity 0.6 | Icon inside primary button (all states) | icon `opacity: .6` |
| Opacity 0.15 | Scrollbar thumb (`alpha-black-100`, 6px wide, radius full) | scrollbar thumb |
| Opacity 0.3 and 0.1 | Featured icon outline rings | featured icon (outline) |
| Icon sizes | 16 (chevrons, help, xs buttons, checkbox sm, tag close), 20 (default button/input/nav icon), 14 (checkbox md check), 24 (slider handle), Featured icon holder 40 (modal, alert), 48 (Size lg), 56 (Size xl) | per component |
| Heights | Control heights in section "Quick reference" | per component |

### 5.6 Motion and z-index

**None exist in the file.** There are no duration/easing variables or styles and no z-index tokens (the 7 variable collections and the style lists were read in full); prototype reactions on nodes were not inspected. See section 8. Build guidance (ASSUMPTION, not from Figma): UI feedback under 300 ms, ease-out for entering, honour `prefers-reduced-motion`; stacking order: header and sidebar above content, dropdown/tooltip above those, modal overlay and modal on top.

---

## 6. Components

220 component sets, listed with node IDs, variant counts and property definitions in **components.md** (also `design/component-inventory.json`). Anatomy, exact dimensions, padding, radius and token bindings of the fundamental ones: Button, Button group, Input (incl. textarea), Select, Dropdown menu, Checkbox, Radio, Toggle, Badge, Tag, Avatar, Tabs, Sidebar navigation, Header navigation, Card pattern (metric item, table wrapper), Modal, Tooltip, Table, Pagination, Alert, Notification, Empty state, Progress bar, Slider, Form field (input anatomy).

Property naming convention of the component sets: `Size` (xs/sm/md/lg/xl, usually sm/md/lg), `Hierarchy` or `Type` or `Color`, `State` (Default, Hover, Focused/Focus, Disabled, Loading, Open), `Current` (selected nav/tab), `Breakpoint` (Desktop/Mobile), `Theme` (Light/Dark, marketing sections), booleans for optional parts (Icon leading, Icon trailing, Supporting text, X close button, Actions), instance swaps for icons (property name begins with a swap glyph). Variant names read as `Prop=Value, Prop=Value`.

---

## 7. Patterns and layout rules

- **App shell** (Application navigation page): Sidebar navigation desktop 280 x 960, fill `bg-primary`, `border-secondary` edge (stroke weight per side not read); header block 280x120 pad 20 gap 20; nav list pad 0/16; nav item 272x38 (36px content + 1px outer padding) pad 8 gap 12 r6; footer pad 0/16/20/16 gap 12 with a featured card (r12, pad 16, `bg-secondary`) and an account card (248x64, r12, pad 12, `bg-primary_alt`, 1px `border-secondary`). Header navigation desktop 1440x64 with a 1280 container (pad 0/32), logo 104x24, nav items gap 2, actions right; mobile 375x56 with the 36x36 menu button.
- **Page content**: header block, then metric cards (388x106 at desktop width in the sample), then table/card panels (r12, 1px `border-secondary`, `shadow-xs`, `bg-primary`). Panel header uses the Card header component with a 1px bottom divider (`border-secondary`).
- **Forms**: field = label (Text sm/Medium `text-secondary`) + input + hint (Text sm `text-tertiary`) in a vertical stack gap 6; error replaces the hint with an error message (Text sm `text-error-primary`) and an alert-circle icon; asterisk `text-brand-tertiary`. Form sections use gap 12 to 16 (inferred from component gaps).
- **Modals**: centered 400 panel, header icon top-left, close button top-right, two buttons at the bottom (stacked on mobile).
- **Tables**: header row 44 (`bg-secondary`), body rows 72 (md) or 64 (sm), cell padding 16/24 (md), bottom 1px `border-secondary` per row.
- **Auto layout everywhere**: all component frames are auto-layout with `itemSpacing` and padding bound to spacing variables in most cases (not all: see section 8). Build with flex/grid and the same gaps.
- **Naming**: components `Group/Component` (for example `Buttons/Button`); variant name `Prop=Value, ...`; internal base parts start with `_` (for example `_Nav item base`, `_Button group base`, `_Dropdown menu list item`); frames inside components use semantic names (`Content`, `Text and icon`, `Text padding`, `Actions`, `Header`, `Footer`). Pages in Figma are grouped by cover pages and `↳` sub-pages.
- **Icons**: Untitled UI line icons (1,173 loose components on the Icons page and the Misc icons page), stroke glyph colour from `fg-*` tokens, 20x20 default, 16x16 for chevrons and compact controls; icon-only buttons are square with equal padding.
- **Featured icons**: square rounded icon holders (Modern gray: `bg-primary` fill, 1px `border-primary`, `shadow-xs-skeuomorphic`; sizes 40/48/56 with radius 8/10/12; also Light, Dark, Outline variants with `featured-icon-light-fg-*` colours).
- **Marketing sections** carry a `Theme` (Light/Dark) and `Breakpoint` (Desktop/Mobile) variant; see the marketing inventory in components.md.
- **Examples as templates**: build full pages by copying composition from APPLICATION EXAMPLES (dashboards, settings, informational pages) and MARKETING WEBSITE EXAMPLES (landing, pricing, blog, contact, FAQ, team, legal, auth, 404).

---

## 8. Gaps and risks

| # | Gap or inconsistency | Impact | Handling |
|---|---|---|---|
| 1 | No motion tokens (duration, easing); prototype reactions not inspected | Motion must be invented | Use the Designer role defaults (under 300 ms, reduced-motion variant); mark ASSUMPTION; add to design annotations in project work |
| 2 | No z-index/elevation-order tokens | Stacking undefined | Use the order in section 5.6 |
| 3 | No breakpoint variables; desktop grid style (offset 112) targets 1440 while docs say 1,280 | Breakpoint ambiguity | Container max 1280, frames 375/768/1440; CSS breakpoints inferred (5.2) |
| 4 | No opacity tokens; disabled = node opacity 0.5; overlay 0.7; icon 0.6 | Hard-coded values | Section 5.5 |
| 5 | No border-width tokens (0.5, 0.75, 1, 1.5, 1.67, 2 hard-coded) | Hard-coded | Section 5.3 |
| 6 | Radius variables are raw floats (no primitives) while spacing aliases primitives | Layering inconsistency | Treat as is; tokens.css mirrors it |
| 7 | Spacing alias names are t-shirt (`spacing-md` = 8) but primitive names are numeric (`Spacing/2`); `spacing-xs` is 4, not 2 (`spacing-xxs` is 2) | Easy mix-ups | Use the table in 2.6 |
| 8 | Not all component paddings/gaps are variable-bound: Button md padding 10/14 is hard-coded, lg vertical 10 is off the 4px grid, input lg padding 10/14 | Off-scale numbers | Reproduce exactly, listed in components.md |
| 9 | Disabled checkbox-checked uses a 16px check icon vs 14px in other states | Visual jump | Use 14px; note in review |
| 10 | Hover on checkbox (checked and unchecked) looks identical to Default (read: same fill and stroke) | No hover feedback | Optional: add `bg-primary_hover` ring only with Designer approval |
| 11 | Typo in source variable names: `shadow-skeumorphic-inner`, `shadow-skeumorphic-inner-border` | Traceability | Kept in tokens.css; effect style is spelled "skeuomorphic" |
| 12 | Primitive `Gray` palette lists 50 out of order in the file | None for use | Ignore |
| 13 | Dark mode removes all drop shadows (colours transparent) | Elevation lost on dark | Depend on borders and surface steps |
| 14 | Contrast shortfalls: warning/success text on white, `border-primary` and `fg-quaternary` below 3:1, dark primary-button hover 3.33:1 | Accessibility (WCAG 2.2 AA is the project target) | See 4.3 for handling |
| 15 | Font family variable has only "Inter"; no fallback stack, no variable font weights numbers | Builders must map | tokens.css notes the mapping |
| 16 | Documentation frames ("Notes and documentation (you can delete this)", Design system headers) on every page; examples flagged "move to a separate file" | Noise in the file | Ignore when reading |
| 17 | No generic `Card` component set | Cards are built per pattern | Use the card pattern in components.md |
| 18 | Letter spacing in % and line height in px (variables cannot hold rem/em) | Conversion | tokens.css uses -0.02em and px |
| 19 | Variant names mix `Focus` and `Focused`, `Hover/active`, `Hover/selected`, `Hover` | Inconsistent state vocabulary | Map to CSS `:focus-visible`, `:hover`, `[aria-current]`/`[aria-selected]` |
| 20 | Primitives collection hidden from publishing | Library consumers cannot see primitives | Internal only |

---

## Not verified

These items were not (fully) read or could not be read, with the reason:

- Component anatomy and exact token bindings were captured for the components listed in components.md section A. For the other component sets (the remaining of 220) only name, node ID, variant count and property definitions were read (inventory). Examples: Calendars, Charts, Code snippets, Color pickers, Command menus, Date pickers, File upload, Filters, Messaging, Slideouts, Tree views, Text editors, Video players, Social buttons, all marketing sections, Breadcrumbs, Loading indicators, Card headers, Page headers, Section headers/footers.
- Hover and Focused variants were read for Button and Nav item; other components' hover/focus details were read for the cases listed in components.md only. Checkbox and Toggle Hover looked identical to Default (read).
- Variable bindings of corner radius per component were not extracted (reads listed fill, stroke, padding and spacing bindings; radius values are read as numbers and matched to the radius scale by value).
- Destructive button colours (set `Buttons/Button destructive`, id `6218:85578`), Button utility and Button close X: variant lists read, fills/strokes not read. The destructive tokens `bg-error-solid`, `bg-error-solid_hover` exist in the Background group.
- Mobile/Tablet behaviours of components: only the Desktop/Mobile variants listed were read; there is no Tablet component variant (read from variant options).
- Text style font name: reported by the Plugin API as undefined because the family is variable-bound; family confirmed through variables (Inter) and screenshots.
- Paint styles (927) were counted, not itemised: they mirror the primitive palettes plus gradients and mockup fills.
- The `rem` conversions are as documented in the file's Typography page (images read), not computed here.
- WebFetch/curl download of screenshot images from www.figma.com is blocked by the sandbox proxy (HTTP 403); screenshots were viewed through the get_screenshot base64 response instead (Buttons, Typography, Color variables, Spacing, Shadows, Inputs).
- Prototype interactions/animations were not inspected (no motion data found in read components); there may be prototype links on example pages.

## Verification log

Self-check on 2026-10-21 after writing: values re-read from the live Figma file through read-only `use_figma` scripts and compared with this document and tokens.json. Result: 16 of 16 match, 0 mismatches.

| # | Value in this doc | Re-read from Figma | Match |
|---|---|---|---|
| 1 | `fg-error-primary` Light #DC2626 (Red/600), Dark #EF4444 (Red/500) | alias Colors/Red/600 => #DC2626; alias Colors/Red/500 => #EF4444 | yes |
| 2 | `utility-neutral-100` Light #F5F5F5 (Neutral/100), Dark #262626 (Neutral/800) | same | yes |
| 3 | `bg-secondary_hover` Light #F5F5F5, Dark #262626 | same | yes |
| 4 | `Colors/Neutral (alpha)/900` #FFFFFF0D | #FFFFFF0D | yes |
| 5 | `alpha-black-80` Light #000000CC, Dark #FFFFFFCC (raw) | same | yes |
| 6 | `utility-brand-500_alt` Light Brand/500 #9E77ED, Dark alias utility-neutral-500 #737373 | same | yes |
| 7 | `radius-lg` 10 | 10 | yes |
| 8 | `Font size/display-lg` 48 | 48 | yes |
| 9 | `spacing-8xl` = Spacing/20 (80px) | alias Spacing/20 (80px) => 80 | yes |
| 10 | `Line height/text-xl` 30 | 30 | yes |
| 11 | Empty state md `1182:412` 512x216 | 512x216 | yes |
| 12 | Pagination desktop `226:519` 1216x56, pad-top 20, gap 12 | 1216x56, gap12, pad 20/0/0/0 | yes |
| 13 | Sidebar simple desktop `1161:8593` 280x960 | 280x960 | yes |
| 14 | Header navigation simple desktop `1208:104342` 1440x64 | 1440x64 | yes |
| 15 | Nav item hover `1152:89337` 272x38, pad 1/0/1/0 | 272x38, pad 1/0/1/0 | yes |
| 16 | Slider `1086:609` 320x24 | 320x24 | yes |

Also machine-checked: tokens.css has balanced braces, every `var(--uui-*)` reference resolves to a defined property, the dark block redeclares all 273 colour tokens, and tokens.json holds 7 collections with 691 variables (343 + 273 + 11 + 17 + 12 + 3 + 32).

Corrections made during the audit: a mistyped Tree view node ID was fixed (now `12451:566966` in the inventory); the Figma `Font family` tokens were first emitted with a doubled prefix and were corrected to `--uui-font-family-display` / `--uui-font-family-body`.

