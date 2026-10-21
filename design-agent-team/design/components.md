# Components: Untitled UI v8.0 ("Untitled UI v8.0 - Vibe Projects")

Companion of `design/design-system.md` (read its GOLDEN RULES first). Figma file: https://www.figma.com/design/oXH08VsT8HScKPV82FIZHC/Untitled-UI--v8.0--Vibe-Projects, fileKey `oXH08VsT8HScKPV82FIZHC`. Audit date 2026-10-21, read-only.

**Contents:** A. Anatomy of the fundamental components (exact values read from variant nodes) / B. Full inventory of all 220 component sets (62 base, 110 application, 48 marketing) with node IDs, variant counts, and properties.

Notation: `$token` = bound Figma variable (CSS `--uui-<token with _ as ->`). `pad T/R/B/L` = padding top/right/bottom/left in px. `gap` = auto-layout item spacing. `r` = corner radius. Node IDs are variant or set IDs from the file. Text styles are written `Text sm/Semibold` (size/weight). When a padding says "(hard-coded)" the Figma node has the number without a variable binding. Hover/Focus/Disabled differences are listed after each default.

---

## A. Fundamental components

### A.1 Button (`Buttons/Button`, set `3287:427074`, 200 variants)

Properties: `Size` xs, sm, md, lg, xl; `Hierarchy` Primary, Secondary, Tertiary, Link color, Link gray; `State` Default, Hover, Focused, Disabled, Loading; `Icon only` False/True; booleans `Icon leading`, `Icon trailing`, `Loading text`; instance swaps for leading/trailing icon. Sibling sets: `Buttons/Button destructive` `6218:85578` (Hierarchy Primary, Secondary, Tertiary, Link; 175 variants), `Buttons/Button utility` `8003:526508`, `Buttons/Button close X` `2763:420129`, `Buttons/Button loading icon` `8993:429278`, `Buttons/Social button` `1256:130788`, `Buttons/Social button group` `1256:132638`, `Mobile app store badge` `1303:2162`.

| Size | Height | Padding T/R/B/L | Gap | Label style | Icon | Icon-only box |
|---|---|---|---|---|---|---|
| xs | 32 | 6/10/6/10 (vertical `spacing-sm`; horizontal 10 hard-coded) | 4 | Text sm/Semibold | 16 | 32x32, pad 8 |
| sm | 36 | 8/12/8/12 (`spacing-md`, `spacing-lg`) | 4 (`spacing-xs`) | Text sm/Semibold | 20 | 36x36, pad 8 (`spacing-md`) |
| md | 40 | 10/14/10/14 (hard-coded) | 4 (`spacing-xs`) | Text sm/Semibold | 20 | 40x40, pad 10 |
| lg | 44 | 10/16/10/16 (L/R `spacing-xl`; vertical hard-coded) | 6 (`spacing-sm`) | Text md/Semibold | 20 | 44 (not individually read) |
| xl | 48 | 12/18/12/18 | 6 | Text md/Semibold | 20 | 48x48, pad 14 |

All sizes: radius 8 (`radius-md`), "Text padding" frame inside with pad 0/2/0/2 (`spacing-xxs`). Vendor note read from the Buttons page: lg uses 10px vertical padding (off the 4px grid) and the left padding is reduced from 16 to 14 for icon optical balance when an icon leads; the default lg variant read as 10/16/10/16.

| Hierarchy | Fill | Stroke | Effect | Label | Icon | Hover | Focused | Disabled |
|---|---|---|---|---|---|---|---|---|
| Primary | `$bg-brand-solid` | linear gradient 2px (skeuomorphic) | `Shadows/shadow-xs-skeuomorphic` | `$text-white` | `$fg-white` at opacity 0.6 | fill `$bg-brand-solid_hover` | effect `Focus rings/focus-ring-shadow-xs-skeuomorphic` | node opacity 0.5, other props unchanged |
| Secondary | `$bg-primary` | 1px `$border-primary` | `Shadows/shadow-xs-skeuomorphic` (disabled variant: `shadow-xs`) | `$text-secondary` | `$fg-quaternary` | fill `$bg-primary_hover`, label `$text-secondary_hover`, icon `$fg-quaternary_hover` | effect `focus-ring-shadow-xs-skeuomorphic` | node opacity 0.5 |
| Tertiary | none | none | none | `$text-tertiary` | `$fg-quaternary` | fill `$bg-primary_hover`, label `$text-tertiary_hover` | (not read) | node opacity 0.5 |
| Link color | none | none | none | `$text-brand-secondary` | `$fg-brand-secondary_alt` | (not read) | (not read) | node opacity 0.5 |
| Link gray | none | none | none | `$text-tertiary` | `$fg-quaternary` | (not read) | (not read) | node opacity 0.5 |

Link sizes: height 20 at md, no padding; sm link used in pagination: 83x20 with gap 4 (`spacing-xs`). Loading: label "Submitting..." with `Buttons/Button loading icon`, fill like hover for Primary. Primary default node IDs: md Primary Disabled `3287:427327`, Secondary Disabled `3287:427351`, Primary Focused `3287:427355`. Contrast: primary label 4.96:1 (hover 6.62:1) in light; see design-system.md section 4.3.

### A.2 Button group (`Button group` `1046:10171`, base `_Button group base` `1046:9312`)

`Size` sm/md; `Icon` False/Leading/Only; base `Current` False/True, `Icon` False/Leading/Only/Dot, `State` Default/Hover/Focused/Disabled. md item: 62x40 (hug), pad 8/16/8/16 (`spacing-md`, `spacing-xl`), gap 6 (`spacing-sm`), fill `$bg-primary`, stroke `$border-primary` 1px, label Text sm/Semibold `$text-secondary`. Current item: fill `$bg-primary_hover`, label `$text-secondary_hover`; Hover item: fill `$bg-primary_hover`, same label. Group container: r 8, stroke `$border-primary` 1px, effect `shadow-xs-skeuomorphic`, items separated by their strokes.

### A.3 Input field / Form field (`Input field` set `1090:57817`; screenshot read of the Inputs page)

Properties: `Size` sm/md/lg; `Type` Default, Leading dropdown, Trailing dropdown, Leading text, Payment input, Tags (inner/outer), Trailing button, Password, Date and time, Number counter (horizontal/vertical), OTP, File upload (14 options); `Destructive` False/True; `State` Placeholder, Filled, Focused, Disabled.

md Default (field = label + box + hint): outer 320x92, vertical, gap 6 (`spacing-sm`).
- **Label row**: label Text sm/Medium `$text-secondary`; required asterisk `$text-brand-tertiary` (error variant: `$text-error-primary`).
- **Input box** 320x40, horizontal, gap 8 (`spacing-md`), pad 8/12 (`spacing-md`/`spacing-lg`), r 8, fill `$bg-primary`, stroke 1px `$border-primary`, effect `Shadows/shadow-xs`. Text Text md/Regular (`$text-primary` when filled, `$text-placeholder` for placeholder). Leading icon 20, help icon 16 (`$fg-quaternary`).
- **Hint**: Text sm/Regular `$text-tertiary`.
- sm: box height 36, hint Text xs; lg: box height 44, pad 10/14 (hard-coded).
- **Focused**: stroke `$border-brand` 2px (effects listed only `shadow-xs` in the read; the visible ring in the Inputs screenshot is the 2px brand stroke).
- **Disabled**: the input frame at opacity 0.5.
- **Destructive**: stroke `$border-error_subtle` 1px (default error), focused error uses `focus-ring-error`; error icon `alert-circle`; message Text sm/Regular `$text-error-primary` replaces the hint.
- **Textarea** (md): box 320x128, pad 12/14 (`spacing-lg` top/bottom), same tokens.

Accessibility: label always visible and tied to the input; hint/error linked by `aria-describedby`; do not rely on the 1.48:1 border alone.

### A.4 Select (`Select` set `3281:377673`)

`Size` sm/md/lg; `Type` Default, Icon leading, Avatar leading, Dot leading, Search, Tags; `State` Placeholder, Default, Focused, Open, Disabled. Closed box = Input box tokens (40 tall at md) with a `chevron-down` 16 (`$fg-quaternary`, stroke 1.5). Open: stroke `$border-brand` 2px; menu frame 320 wide, pad 4/0 (`spacing-xs`), r 8, fill `$bg-primary`, stroke 1px `$border-secondary_alt`, effect `Shadows/shadow-lg`. Menu item 320x42: outer pad 1/6, content pad 8 r 6 gap 8; title Text md/Medium `$text-primary`, supporting Text md/Regular `$text-tertiary`; hover/selected content fill `$bg-primary_hover`; selected shows `check` 16 `$fg-brand-primary` (content pad right 10); disabled item opacity 0.5. Scrollbar: 6 wide, r full, fill `$alpha-black-100` at opacity 0.15.

### A.5 Dropdown menu (`Dropdown menu` set `3281:383083`, 28 variants; item set `_Dropdown menu list item` `11546:537565`)

Properties: `Type` Button simple, Button advanced, Button link, Icon simple, Icon advanced, Search simple, Search advanced, Integrations, Account button, Account avatar, Account card xs/sm/md, Account breadcrumb; `Open` False/True; booleans `Scrollbar`, `Chevron dropdown`. Trigger "Button simple": 100x36, pad 8/12 (`spacing-md`/`spacing-lg`), gap 4, r 8, fill `$bg-primary`, stroke 1px `$border-primary`, label Text sm/Semibold `$text-secondary`, chevron 16 (open state uses `focus-ring-shadow-xs-skeuomorphic`).
Menu: 216 wide, r 8, fill `$bg-primary`, stroke 1px `$border-secondary_alt`, effect `shadow-lg`; inner pad 4/0 (`spacing-xs`). Item: outer 216x38 pad 1/6 (`spacing-sm`), content 204x36 pad 8/6/8/10 r 6, gap 4; icon 16 + text gap 8; text Text sm/Semibold `$text-secondary`; shortcut Text xs/Medium `$text-quaternary`; chevron-right 16 `$fg-quaternary`. Divider item: 216x9, pad 4/0, 1px line `$border-secondary`. Item `State`: Default, Hover/active, Open, Disabled (`Inset icon` True/Default, `Divider` True/False). Hover fill token for items was read on Select menu items (`$bg-primary_hover`); the dropdown item's hover fill itself was not read.

### A.6 Checkbox and Radio (`Checkbox` set `1097:63652`, base `_Checkbox base` `1097:63886`)

Properties: `Type` Checkbox/Radio; `Size` sm/md; `Checked`, `Indeterminate`, `State` Default/Hover/Focused/Disabled; full component adds `Text`, boolean `Supporting text`.
- **Box md** 20x20, r 6 (`radius-sm`); sm 16x16, r 4 (`radius-xs`). Unchecked: no fill, stroke 1px `$border-primary`. Checked: fill `$bg-brand-solid`, check icon 14 box (stroke `$fg-white` 2); Indeterminate: `minus` 14 box same stroke. Hover: identical to Default (read, checked and unchecked). Focused: effect `Focus rings/focus-ring`. Disabled: opacity 0.5 (the check icon is 16 in this state, 14 elsewhere: inconsistency).
- **Radio** md 20x20 r full; checked fill `$bg-brand-solid` with inner dot 8x8 `$fg-white` (sm: 16x16, dot 6).
- **With label** (`Checkbox` set): horizontal gap 12 (`spacing-lg`), input wrapper top pad 2, label Text md/Medium `$text-secondary`, supporting Text md/Regular `$text-tertiary`.

### A.7 Toggle (`Toggle base` set `122:3294`, full `1102:4208`)

`Type` Default/Slim; `Pressed`; `Size` sm/md; `State` Default/Hover/Focus/Disabled. md Default: 44x24, pad 2 (`spacing-xxs`), r full; off: fill `$bg-tertiary`, stroke 0.5 `$border-secondary`; on: fill `$bg-brand-solid` (hover `$bg-brand-solid_hover`); knob 20x20 fill `$fg-white`, effect `shadow-sm`. sm: 36x20, knob 16. Slim: 40x20 with a border frame stroke `$border-secondary`, knob 20 with stroke `$toggle-border` (pressed `$toggle-slim-border_pressed`, hover `$toggle-slim-border_pressed-hover`), effect `shadow-xs`. Focus: `focus-ring`. Disabled: opacity 0.5. With label: gap 12, same text styles as checkbox.

### A.8 Badge (`Badge` set `1046:3819`, 666 variants; `Badge group` `1046:8088`; `_Badge close X` `4824:404158`)

`Size` sm/md/lg; `Type` Pill color, Badge color, Badge modern; `Icon` False, Dot, Country, X close, Avatar, Icon trailing, Icon leading, Only; `Color` Gray, Brand, Error, Warning, Success, Slate, Sky, Blue, Indigo, Purple, Pink, Orange.
- **Pill color**: r full; fill `$utility-<hue>-50`, stroke 1px `$utility-<hue>-200`, text `$utility-<hue>-700`. Hues: Gray = utility-neutral, Error = utility-red, Warning = utility-yellow, Success = utility-green. md: height 24, pad 2/10, Text sm/Medium; sm: 22, pad 2/8 (`spacing-xxs`, `spacing-md`), Text xs/Medium; lg: 28, pad 4/12, Text sm/Medium.
- **Badge color**: r 6, pad 2/8.
- **Badge modern**: r 6, fill `$bg-primary`, stroke `$border-primary`, effect `shadow-xs`, text `$text-secondary`.
- Dot icon: gap 6, dot 8x8 (inner 6) `$utility-green-500` (Success).
- Contrast: Gray 9.93:1, Brand 6.16:1, Error 5.91:1, Warning 4.76:1, Success 4.79:1 (light).

### A.9 Tag (`Tag` set `3307:417515`)

`Size` sm/md/lg; `Icon` False/Country/Avatar/Dot; `Action` X close/Text only/Count; `Checkbox`. md: height 24, pad 2/4/2/9, r 6, fill `$bg-primary`, stroke 1px `$border-primary`, Text sm/Medium `$text-secondary`; sm: 24 tall pad 3/4/3/8 Text xs/Medium; lg: 28 tall pad 4/4/4/10. Close button 16 (sm 14, lg 20) r 3; count chip fill `$bg-tertiary`, r 3.

### A.10 Avatar (`Avatar` set `11008:45389`, 36 variants; `Avatar label group` `82:2793`; `Avatar group` `1274:812`; `Avatar profile photo` `1217:108477`; `Status icon` `11008:45024`)

`Size` xs 24, sm 32, md 40, lg 48, xl 56, 2xl 64; `Border` False/True; `Placeholder icon`, `Placeholder text`, boolean `Status icon`. All r full; wrapper stroke 0.5 `#00000029` (literal, `Avatar inner shadow` effect). Status icon sizes 10/12/14/16/18/20; online status fill `$fg-success-secondary`, stroke `$bg-primary` 1.5. Placeholder text avatar: fill `$bg-tertiary`, stroke `$border-secondary`, Text md/Semibold `$text-quaternary`. Border=True adds an outer wrapper pad 1, fill `$bg-primary`, stroke 0.75 `$border-secondary_alt`, effect `shadow-xs`. Label group md 189x40, gap 8: name Text sm/Semibold `$text-primary`, supporting Text sm/Regular `$text-tertiary`.

### A.11 Tabs (`_Tab button base` set `43:2412`; page `43:0`)

`Type` Button brand, Button gray, Underline, Line (vertical), Button white, Button minimal; `Size` sm/md; `State` Default/Hover/Focus; `Current` True/False.
- **Underline md**: 156x36, gap 6, bottom pad 12 (`spacing-lg`); current: bottom stroke `$fg-brand-primary_alt`, text `$text-brand-secondary` Text md/Semibold; inactive text `$text-quaternary`, icon `$fg-quaternary`; hover = current colours. sm height 32, Text sm/Semibold, gap 4. Tab row gap 12; container has a bottom stroke `$border-secondary`, container gap 8 (vertical).
- **Button brand** md: 44 tall, pad 8/10, r 6, current fill `$bg-brand-primary_alt`. **Button gray**: current fill `$bg-primary_hover`. **Button white**: current fill `$bg-primary_alt` + `shadow-sm`. **Button minimal**: r 8, stroke `$border-primary`, `shadow-xs`. Button-type containers gap 4. Pill badges (Pill color, sm) may sit inside a tab.

### A.12 Sidebar navigation (`Sidebar navigation` set `1158:90768`, variant example `1161:8593`; `_Nav item base` set `1152:89220`)

Sidebar `Type` Simple, Dual-tier, Slim, Sections dividers, Sections subheadings; `Open`; `Breakpoint` Desktop/Mobile.
- Simple desktop: 280x960 horizontal, fill `$bg-primary`, stroke `$border-secondary` (side weights not read). Header 280x120 vertical, pad 20 (`spacing-2xl`), gap 20. Navigation pad 0/16 (`spacing-xl`). Footer pad 0/16/20/16, gap 12 (`spacing-lg`): featured card 248x156 (r 12, pad 16, gap 16, fill `$bg-secondary`), account card 248x64 (r 12, pad 12, gap 16, fill `$bg-primary_alt`, 1px `$border-secondary`).
- **Nav item** 272x38 = outer pad 1/0 + content 36 tall: pad 8 (`spacing-md`), gap 12 (`spacing-lg`), r 6, fill `$bg-primary`; Text sm/Semibold `$text-secondary`; icon 20; chevron 16 (`$fg-quaternary`, stroke 1.67); optional Badge (Pill color Gray sm, text `$utility-neutral-700` Text xs/Medium). Hover: fill `$bg-primary_hover`. Current: fill `$bg-secondary`. Focused: `focus-ring` effect. Search field in sidebar: placeholder Text sm/Regular `$text-placeholder`, shortcut "⌘K" Text xs/Medium `$text-quaternary`.

### A.13 Header navigation (`Header navigation` set `1207:1678`, 12 variants; marketing sets in B.3)

`Type` Simple, Dual-tier, Tabs, Centered; `Breakpoint` Desktop/Mobile; `Mobile open`; booleans `Notification counter`, `Desktop open`. Simple desktop: 1440x64, fill `$bg-primary`, stroke `$border-secondary`; container 1280 wide (`container-max-width-desktop`), pad 0/32 (`container-padding-desktop`); logo 104x24; nav items gap 2 (`spacing-xxs`) Text sm/Semibold `$text-secondary` (the current item "Dashboard" in the sample uses `$text-secondary_hover`); actions gap 12 with an account dropdown 105x36. Mobile: 375x56, pad 12/12/12/16 (`container-padding-mobile` left), logo + `_Nav menu button` 36x36 (pad 8, r 8, fill `$bg-primary`).

### A.14 Card pattern (no generic Card component set exists)

Cards are frames with: r 12 (`radius-xl`), fill `$bg-primary`, stroke 1px `$border-secondary`, effect `Shadows/shadow-xs`, padding 20 (`spacing-2xl`) on desktop and 16 (`spacing-xl`) on mobile (Metric item). Variants: `Metrics/Metric item` (set `1560:266217`): desktop 388x106, vertical gap 8 (`spacing-md`), heading Text sm/Medium `$text-tertiary`, number Display sm/Semibold `$text-primary`, change chip (`_Change` r 6, pad 2/8/2/6, stroke `$border-primary`, `shadow-xs`, text Text sm/Medium `$text-secondary`, trend text `$text-success-primary`, arrow `$fg-success-secondary` 2px), actions menu icon `dots-vertical` 20 (`$fg-quaternary`). Mobile 343 wide with a 52px action row (top border `$border-secondary`, pad 16). Card header component set exists (`Card headers`, page `223:8525`), anatomy not read.

### A.15 Modal (`Modals` set `4057:415205`, 51 `Type` options x `Breakpoint` Desktop/Mobile)

Types include Stacked left aligned, Horizontal, Warning/Destructive stacked/horizontal, Log in, Sign up, Checkboxes, New message and others (51). Desktop frame 1440x960, pad 32 (`container-padding-desktop`); overlay `$bg-overlay` at opacity 0.7 with `backdrop-blur-md` (16). Panel 400 wide, vertical, r 16 (`radius-2xl`), fill `$bg-primary`, effect `shadow-xl`. Header content pad 24/24/0/24 (`spacing-3xl`), gap 16; Featured icon 40x40 r 8 (Modern gray: fill `$bg-primary`, stroke `$border-primary`, `shadow-xs-skeuomorphic`); close button 36x36 pad 8 r 8 at top right. Content pad 0/24/24/24, gap 12; actions pad-top 32 with two md buttons. Mobile: frame 375x812 pad 16/16/64/16; panel 343 wide; header pad 20/16/0/16; actions stacked vertically, gap 12. Title/supporting text styles were not read.

### A.16 Tooltip (`Tooltip` set `1052:489`)

Content pad 8/12 (`spacing-md`/`spacing-lg`), r 8, fill `$bg-primary-solid`, title Text xs/Semibold `$text-white`; with supporting text: pad 12, width 320, supporting Text xs/Medium `$tooltip-supporting-text` (Neutral/300 both modes). Effect `Shadows/shadow-lg`. Arrow: 12x12 shape r 1 in a 16x6 frame. Contrast 19.80:1 title, 13.36:1 supporting (light).

### A.17 Table (`Table cell` set `1222:107305`, 60 variants; wrapper from the Tables page `214:0`; `Table cell lead action` `9400:570197` Toggle/Radio/Checkbox)

- **Cell md**: 72 tall, pad 16/24 (`spacing-xl`/`spacing-3xl`), gap 12, bottom stroke 1px `$border-secondary`; text Text sm/Medium `$text-primary`, supporting Text sm/Regular `$text-tertiary`. **sm**: 64 tall, pad 16/20.
- **Header cell md**: 44 tall, pad 12/24, fill `$bg-secondary` (standalone: `$bg-primary`), bottom stroke `$border-secondary`; label Text xs/Semibold `$text-quaternary` with a 12px sort arrow.
- **Hover/selected cell** (read on the Action dropdown icon cell, `1224:5295`): fill `$bg-secondary` (+ bottom stroke `$border-secondary`); Type options include Text, Badge, Badges multiple, Select dropdown, Avatar, Avatar group, File type icon, Payment method, Trend positive/negative, Progress bar, Action buttons, Action dropdown icon (`State` Default, Hover/selected).
- **Wrapper**: r 12, fill `$bg-primary`, stroke 1px `$border-secondary`, effect `shadow-xs`; Card header on top (1px divider `$border-secondary`), filters bar pad 12/24, pagination at the bottom.

### A.18 Pagination (`Pagination` set `1115:68622`; number base `_Pagination number base` `1114:68174`; page `225:7288`)

`Type` Page default (other types: see B.2), `Shape` Square/Circle, `Breakpoint` Desktop/Mobile. Desktop "Page default": 1216x56, pad-top 20 (`spacing-2xl`), top stroke `$border-secondary`, gap 12; Previous/Next are `Buttons/Button` Link gray sm (83x20 / 56x20, gap 4, arrow 20, label Text sm/Semibold `$text-tertiary`); numbers row gap 2 (`spacing-xxs`); number 36x36, r 8 (Circle r full), inner pad 8, Text sm/Medium: Default `$text-quaternary`; Hover/active fill `$bg-primary_hover` and text `$text-secondary`; Focused fill `$bg-primary_hover`, text `$text-quaternary`. Mobile: 343x52, pad-top 16 (`spacing-xl`); two icon-only Secondary sm buttons (36x36) around "Page 1 of 10" (Text sm/Medium `$text-secondary`).

### A.19 Alert (`Alert` set `1130:81134`, 24 variants) and Notification (`Notification` set `1135:618`, 18 variants)

Alert: `Color` Default, Gray, Error, Warning, Success, Brand; `Size` Floating/Full-width; `Breakpoint`; booleans `X close button`, `Actions`, `Supporting text`. Floating desktop: pad 16 (`spacing-xl`), gap 16, r 12, fill `$bg-primary_alt`, stroke 1px `$border-primary`, effect `shadow-xs`; Featured icon 40x40 Modern (or Featured icon outline 20 with two rings at opacity 0.3/0.1, stroke `$fg-error-primary` etc.); title Text sm/Semibold `$text-secondary`; supporting Text sm/Regular `$text-tertiary`; actions Link gray + Link color sm buttons, gap 12; close button 36x36. Mobile is vertical (343 wide, gap 16). Full-width: 1440x60, pad 12/32 inside `container-max-width-desktop`.
Notification: panel 400 wide, pad 16, gap 16, r 12, fill `$bg-primary_alt`, stroke `$border-secondary_alt`, effect `shadow-lg`; `Type` Primary icon, Image, Avatar, Gray icon, Error icon, Warning icon, Success icon, No icon, Progress indicator.

### A.20 Empty state (`Empty state` set `1182:317`, page `1172:31`)

`Icon` Featured icon (and others), `Size` sm/md/lg. Width 512, text width 352, centred. 
| Size | Node | Height | Stack gap | Content gap | Icon holder | Text gap | Buttons |
|---|---|---|---|---|---|---|---|
| sm | `1182:178` | 192 | 24 (`spacing-3xl`) | 16 (`spacing-xl`) | 48, r 10 | 4 (`spacing-xs`) | Secondary sm + Primary sm, gap 12 |
| md | `1182:412` | 216 | 32 (`spacing-4xl`) | 20 (`spacing-2xl`) | 48, r 10 | 8 (`spacing-md`) | Secondary md + Primary md |
| lg | `1182:473` | 238 | 32 | 20 | 56, r 12 | 8 | Secondary lg + Primary lg |
Icon holder (Featured icon Modern Gray): fill `$bg-primary`, stroke 1px `$border-primary`, `shadow-xs-skeuomorphic`. Title/supporting text styles were not read.

### A.21 Progress (`Progress bar` set `1085:57382`; circle `1084:2717`; page `1154:89940`)

Bar 320x8: track r full `$bg-quaternary`, fill r full `$fg-brand-primary`. `Label` False (gap 12), Right (percentage Text sm/Medium `$text-secondary`, bar 278 wide), Top floating (tooltip with `shadow-lg`, gap 8). Circle md: 240x240, ring 216 with stroke 24 (`$bg-quaternary` track, `$fg-brand-primary` line), centre number Display md/Semibold `$text-primary`, label Text sm/Medium `$text-tertiary`.

### A.22 Slider (`Slider` set `1086:534`, page `1086:1423`)

320x24; rail 8 tall r full `$bg-quaternary`; progress `$fg-brand-primary`; handle `_Control handle` (`3287:442783`) 24x24 r full, fill `$slider-handle-bg`, stroke 2px `$slider-handle-border`, effect `shadow-md`; Focused handle effect `focus-ring-shadow-sm`; `Label` and `Left/Right control` props.

---

## A.23 Fundamental components list not anatomised (inventory only)

Breadcrumbs, Card headers, Page headers, Section headers/footers, Loading indicators, Command menus, Date pickers, Calendars, Charts, File upload, Filters, Messaging, Slideout menus, Tree views, Text editors, Video players, Social buttons, and all marketing sections. Read B for their variant properties and node IDs. Before building any of these, the Designer must read the node (get_design_context on the node ID) and extend this file.

---

## B. Component inventory (220 component sets)

"Variants" = number of variant components in the set. Properties: `V(n)` variant property with n options; in the base list the option values are written out; `B` boolean; `I` instance swap; `T` text.

### B.1 Base components (62 sets)

#### Buttons (page `1:1183`) - 8 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Buttons/Button` | `3287:427074` | 200 | ⬅️ Icon leading:B=true<br>➡️ Icon trailing:B=true<br>🔀 Icon leading swap:I=3465:410042<br>🔀 Icon trailing swap:I=3465:410042<br>Loading text:B=true<br>Size:V=[xs/sm/md/lg/xl]<br>Hierarchy:V=[Primary/Secondary/Tertiary/Link color/Link gray]<br>State:V=[Default/Hover/Focused/Disabled/Loading]<br>Icon only:V=[False/True] |
| `Buttons/Social button` | `1256:130788` | 216 | Size:V=[md/lg]<br>Social:V=[Google/Facebook/Apple/Twitter/Figma/Dribbble]<br>Supporting text:V=[True/False]<br>Theme:V=[Brand/Gray/Color]<br>State:V=[Default/Hover/Focused] |
| `Buttons/Social button group` | `1256:132638` | 12 | Size:V=[md/lg]<br>Style:V=[Buttons/Icons]<br>Theme:V=[Brand/Color/Gray] |
| `Mobile app store badge` | `1303:2162` | 20 | Size:V=[md/lg]<br>Store:V=[Google Play/App Store/Mac App Store/Galaxy Store/AppGallery]<br>Style:V=[Brand/Outline] |
| `Buttons/Button close X` | `2763:420129` | 18 | Size:V=[sm/md/lg]<br>Dark background:V=[False/True]<br>State:V=[Default/Hover/Focused] |
| `Buttons/Button destructive` | `6218:85578` | 175 | ⬅️ Icon leading:B=true<br>🔀 Icon leading swap:I=3465:410042<br>➡️ Icon trailing:B=true<br>🔀 Icon trailing swap:I=3465:410042<br>Loading text:B=true<br>Size:V=[xs/sm/md/lg/xl]<br>Hierarchy:V=[Primary/Secondary/Tertiary/Link]<br>State:V=[Default/Hover/Focused/Disabled/Loading]<br>Icon only:V=[False/True] |
| `Buttons/Button utility` | `8003:526508` | 16 | 🔀 Icon swap:I=3465:410042<br>Size:V=[xs/sm]<br>Hierarchy:V=[Secondary/Tertiary]<br>State:V=[Default/Hover/Focused/Disabled] |
| `Buttons/Button loading icon` | `8993:429278` | 2 | Size:V=[sm/md] |

#### Avatars (page `18:1350`) - 7 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Avatar image` | `933:30268` | 2 | Source:B=true<br>Type:V=[Square/Portrait] |
| `Avatar label group` | `82:2793` | 3 | Supporting text:B=true<br>Size:V=[sm/md/lg] |
| `_Avatar add button` | `1102:4864` | 12 | Size:V=[xs/sm/md]<br>State:V=[Default/Hover/Focus/Disabled] |
| `Avatar profile photo` | `1217:108477` | 9 | Verified:B=true<br>Placeholder:V=[False/True]<br>Text:V=[False/True]<br>Size:V=[sm/md/lg] |
| `Avatar group` | `1274:812` | 3 | More users:B=true<br>Add more button:B=true<br>Size:V=[xs/sm/md] |
| `Status icon` | `11008:45024` | 5 | Type:V=[Offline/Online/Avatar/Verified tick/Count] |
| `Avatar` | `11008:45389` | 36 | Status icon:B=true<br>Size:V=[xs/sm/md/lg/xl/2xl]<br>Border:V=[False/True]<br>Placeholder icon:V=[False/True]<br>Placeholder text:V=[False/True] |

#### Badges (page `12:539`) - 3 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Badge` | `1046:3819` | 666 | 🔀 Flag swap:I=11834:15374<br>🔀 Icon trailing swap:I=3463:404482<br>🔀 Icon leading swap:I=3463:404509<br>Size:V=[sm/md/lg]<br>Type:V=[Pill color/Badge color/Badge modern]<br>Icon:V=[False/Dot/Country/X close/Avatar/Icon trailing/Icon leading/Only]<br>Color:V=[Gray/Brand/Error/Warning/Success/Slate/Sky/Blue/Indigo/Purple/Pink/Orange] |
| `Badge group` | `1046:8088` | 80 | Icon:B=true<br>Badge:V=[Leading/Trailing]<br>Size:V=[md/lg]<br>Type:V=[Pill color/Badge modern]<br>Color:V=[Gray/Brand/Error/Warning/Success]<br>State:V=[Default/Hover] |
| `_Badge close X` | `4824:404158` | 48 | Type:V=[Square/Rounded]<br>Color:V=[Gray/Brand/Error/Warning/Success/Slate/Sky/Blue/Indigo/Purple/Pink/Orange]<br>State:V=[Default/Hover] |

#### Button groups (page `16:399`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Button group base` | `1046:9312` | 64 | 🔀 Icon swap:I=3465:410042<br>Size:V=[sm/md]<br>Current:V=[False/True]<br>Icon:V=[False/Leading/Only/Dot]<br>State:V=[Default/Hover/Focused/Disabled] |
| `Button group` | `1046:10171` | 6 | Size:V=[sm/md]<br>Icon:V=[False/Leading/Only] |

#### Checkboxes (page `1097:63638`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Checkbox` | `1097:63652` | 72 | Supporting text:B=true<br>Checked:V=[False/True]<br>Indeterminate:V=[False/True]<br>Size:V=[sm/md]<br>Type:V=[Checkbox/Radio]<br>Text:V=[False/True]<br>State:V=[Default/Hover/Focused/Disabled] |
| `_Checkbox base` | `1097:63886` | 40 | Checked:V=[False/True]<br>Indeterminate:V=[False/True]<br>Size:V=[sm/md]<br>Type:V=[Checkbox/Radio]<br>State:V=[Default/Hover/Focused/Disabled] |

#### Dropdowns (page `18:0`) - 7 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Dropdown menu header` | `3281:382878` | 4 | Supporting text:B=true<br>Type:V=[Avatar group/Header/Subheading/Search] |
| `Dropdown menu` | `3281:383083` | 28 | Scrollbar:B=true<br>Chevron dropdown:B=true<br>Type:V=[Button simple/Button advanced/Button link/Icon simple/Icon advanced/Search simple/Search advanced/Integrations/Account button/Account avatar/Account card xs/Account card sm/Account card md/Account breadcrumb]<br>Open:V=[False/True] |
| `_Dropdown menu list item` | `11546:537565` | 5 | Chevron:B=true<br>Shortcut:B=true<br>Leading icon:B=true<br>Inset icon:V=[True/Default]<br>State:V=[Default/Hover/active/Open/Disabled]<br>Divider:V=[False/True] |
| `_Dropdown menu item inset icon` | `11546:538631` | 7 | 🔀 Icon swap:I=3465:410042<br>Type:V=[Spacer/Icon/Check/Checkbox/Dot/Avatar/Integration icon] |
| `Context menu` | `11547:540792` | 4 | Type:V=[Simple/Advanced]<br>Open:V=[False/True] |
| `_Dropdown menu footer` | `11553:542018` | 2 | Type:V=[Text/Button] |
| `_Dropdown account list item` | `12471:593498` | 2 | State:V=[Default/Hover/active] |

#### Inputs (page `85:1269`) - 4 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Input field` | `1090:57817` | 294 | Label:B=true<br>Hint text:B=true<br>Help icon:B=true<br>🔀 Icon swap:I=3463:406209<br>↳ Required *:B=true<br>⬅️ Icon leading:B=true<br>Time selector:B=true<br>Size:V=[sm/md/lg]<br>Type:V=[Default/Leading dropdown/Trailing dropdown/Leading text/Payment input/Tags inner/Tags outer/Trailing button/Password/Date and time/Number counter horizontal/Number counter vertical/OTP/File upload]<br>Destructive:V=[False/True]<br>State:V=[Placeholder/Filled/Focused/Disabled] |
| `_Mega input field base` | `1106:66560` | 15 | Size:V=[sm/md/lg]<br>State:V=[Placeholder/Focused/Filled/Disabled/Error] |
| `Verification code input field` | `1106:66757` | 6 | Label:B=true<br>Hint text:B=true<br>Size:V=[sm/md/lg]<br>Digits:V=[4/6] |
| `Textarea input field` | `1238:278` | 42 | Label:B=true<br>Hint text:B=true<br>↳ Required *:B=true<br>↳ Help icon:B=true<br>Resize handle:B=true<br>Size:V=[sm/md]<br>Type:V=[Default/Tags inner/Tags outer]<br>Destructive:V=[False/True]<br>State:V=[Placeholder/Default/Focused/Disabled] |

#### Progress indicators (page `1154:89940`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Progress bar` | `1085:57382` | 55 | Progress:V=[0%/10%/20%/30%/40%/50%/60%/70%/80%/90%/100%]<br>Label:V=[False/Right/Bottom/Top floating/Bottom floating] |
| `Progress circle` | `1084:2717` | 10 | Label:B=true<br>Size:V=[xxs/xs/sm/md/lg]<br>Shape:V=[Circle/Half circle] |

#### Radio groups (page `122:3484`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Radio group item` | `124:2838` | 144 | Badge:B=true<br>Selected:V=[False/True]<br>Size:V=[sm/md]<br>Type:V=[Icon simple/Icon card/Avatar/Payment icon/Radio button/Checkbox]<br>State:V=[Default/Hover/Focused]<br>Breakpoint:V=[Mobile/Desktop] |
| `Radio group` | `1142:87213` | 24 | Size:V=[sm/md]<br>Type:V=[Icon simple/Icon card/Avatar/Payment icon/Radio button/Checkbox]<br>Breakpoint:V=[Desktop/Mobile] |

#### Select (page `11132:11643`) - 4 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Select` | `3281:377673` | 90 | Label:B=true<br>Hint text:B=true<br>Supporting text:B=true<br>Scroll bar:B=true<br>🔀 Icon swap:I=3463:405657<br>↳ Required *:B=true<br>↳ Help icon:B=true<br>Shortcut:B=true<br>Size:V=[sm/md/lg]<br>Type:V=[Default/Icon leading/Avatar leading/Dot leading/Search/Tags]<br>State:V=[Placeholder/Default/Focused/Open/Disabled] |
| `Multi-select` | `12206:577041` | 21 | Label:B=true<br>Hint text:B=true<br>Supporting text:B=true<br>Scroll bar:B=true<br>↳ Required *:B=true<br>↳ Help icon:B=true<br>Size:V=[sm/md/lg]<br>State:V=[Default/Active/Focused/Open default/Open active/Search empty state/Disabled] |
| `_Select menu item` | `3281:380429` | 72 | Supporting text:B=true<br>🔀 Icon swap:I=3463:405657<br>Size:V=[sm/md/lg]<br>Selected:V=[False/True]<br>Type:V=[Default/Icon leading/Avatar leading/Dot leading]<br>State:V=[Default/Hover/Disabled] |
| `_Multi-select menu item` | `12206:575660` | 9 | Supporting text:B=true<br>Size:V=[sm/md/lg]<br>State:V=[Default/Hover/Disabled] |

#### Sliders (page `1086:1423`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Slider` | `1086:534` | 30 | Label:V=[False/Bottom/Top floating]<br>Right control:V=[25%/50%/75%/100%]<br>Left control:V=[0%/25%/50%/75%] |
| `_Control handle` | `3287:442783` | 9 | State:V=[Default/Hover/Focused]<br>Type:V=[False/Text/Tooltip] |

#### Tags (page `3306:403749`) - 4 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Tag` | `3307:417515` | 72 | 🔀 Flag swap:I=11834:15374<br>Size:V=[sm/md/lg]<br>Icon:V=[False/Country/Avatar/Dot]<br>Action:V=[X close/Text only/Count]<br>Checkbox:V=[False/True] |
| `_Tag close X` | `3307:417672` | 6 | Size:V=[sm/md/lg]<br>State:V=[Default/Hover] |
| `_Tag count` | `3307:417827` | 3 | Size:V=[sm/md/lg] |
| `_Tag checkbox` | `3308:406033` | 24 | Checked:V=[False/True]<br>Size:V=[sm/md/lg]<br>State:V=[Default/Hover/Focused/Disabled] |

#### Text editors (page `9291:557994`) - 4 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Text editor icon` | `9291:551743` | 48 | Type:V=[Bold/Italic/Underline/Dot points/Left align/Center align/Right align/Justify/Link/Insert image/Attach file/Insert code/Color picker/Generate/More options/Insert video]<br>State:V=[Default/Hover/Current] |
| `Text editor toolbar` | `9291:557668` | 2 | Dropdowns:B=true<br>Type:V=[Simple/Advanced] |
| `Text editor tooltip` | `9291:557669` | 2 | Type:V=[Simple/Advanced] |
| `Text editor` | `9292:559325` | 4 | Scroll bar:B=true<br>Hint text:B=true<br>Type:V=[Default/Floating toolbar]<br>Size:V=[sm/md] |

#### Toggles (page `1102:4631`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Toggle base` | `122:3294` | 32 | Type:V=[Default/Slim]<br>Pressed:V=[False/True]<br>Size:V=[sm/md]<br>State:V=[Default/Hover/Focus/Disabled] |
| `Toggle` | `1102:4208` | 64 | Supporting text:B=true<br>Type:V=[Default/Slim]<br>Pressed:V=[False/True]<br>Size:V=[sm/md]<br>Text:V=[False/True]<br>State:V=[Default/Hover/Focus/Disabled] |

#### Tooltips (page `1052:485`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Tooltip` | `1052:489` | 14 | Text:T=This is a tooltip<br>Supporting text:V=[False/True]<br>Arrow:V=[None/Bottom left/Bottom right/Left/Right/Bottom center/Top center] |
| `Help icon` | `1054:13` | 28 | Cursor:B=true<br>Open:V=[False/True]<br>Supporting text:V=[False/True]<br>Tooltip:V=[Top no arrow/Top arrow/Left/Top left/Bottom/Right/Top right] |

#### Video players (page `9316:559159`) - 7 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Video volume slider handle` | `9264:575544` | 5 | Volume:V=[0%/25%/50%/75%/100%] |
| `_Video volume slider` | `9264:575739` | 2 | State:V=[Default/Hover] |
| `_Video action button` | `9264:575953` | 36 | Type:V=[Play/Pause/Fast backward/Fast forward/Skip backward/Skip forward/Volume none/Volume min/Volume max/Video minus/Video plus/AirPlay/Minimize 01/Maximize 01/Maximize 02/Minimize 02/Playback speed/Subtitles/CC]<br>State:V=[Default/Hover] |
| `_Video actions bar` | `9264:576129` | 6 | Timestamp indicator:B=true<br>Playing:V=[False/True]<br>Size:V=[sm/md/lg] |
| `Video player 16:9` | `9264:576771` | 6 | Overlay action:B=true<br>Actions bar:B=true<br>Size:V=[sm/md/lg]<br>Playing:V=[False/True] |
| `_Video overlay action` | `9264:577247` | 4 | Paused:V=[False/True]<br>State:V=[Default/Hover] |
| `_Video action tooltip` | `9264:577644` | 2 | Badge:V=[False/True] |


### B.2 Application components (110 sets)

#### Activity feeds (page `253:14231`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Feed item base` | `1254:127644` | 16 | New dot:B<br>Size:V=[sm/md]<br>Supporting item:V=[False/Labels/File/Text]<br>Connector:V=[False/True] |
| `Activity feed` | `1254:128631` | 6 | Divider:V=[Divider/Connector/False/Line]<br>Type:V=[Notifications/Messages] |

#### Alerts & notifications (page `176:4256`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Alert` | `1130:81134` | 24 | X close button:B<br>Actions:B<br>Supporting text:B<br>Color:V=[Default/Gray/Error/Warning/Success/Brand]<br>Size:V=[Floating/Full-width]<br>Breakpoint:V=[Desktop/Mobile] |
| `Notification` | `1135:618` | 18 | X close button:B<br>Actions:B<br>Supporting text:B<br>Type:V=[Primary icon/Image/Avatar/Gray icon/Error icon/Warning icon/Success icon/No icon/Progress indicator]<br>Breakpoint:V=[Desktop/Mobile] |

#### Application navigation (page `82:1862`) - 9 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Sidebar navigation` | `1158:90768` | 17 | Open:V=[False/True]<br>Type:V=[Simple/Dual-tier/Slim/Sections dividers/Sections subheadings]<br>Breakpoint:V=[Desktop/Mobile] |
| `Header navigation` | `1207:1678` | 12 | Notification counter:B<br>Desktop open:B<br>Type:V=[Simple/Dual-tier/Tabs/Centered]<br>Mobile open:V=[False/True]<br>Breakpoint:V=[Desktop/Mobile] |
| `_Nav item base` | `1152:89220` | 6 | Badge:B<br>Icon trailing:B<br>Icon leading:B<br>Dot:B<br>Icon swap:I<br>Current:V=[False/True]<br>State:V=[Default/Hover/Focused] |
| `_Nav item dropdown base` | `1152:90366` | 4 | Open:V=[False/True]<br>Current:V=[False/True] |
| `_Nav featured card` | `1157:90307` | 13 | X close button:B<br>Type:V=[13 opts: Progress bar/Progress circle/Image/Cookie preferences/Referral link/Onboarding steps...] |
| `_Nav menu button` | `1161:14070` | 6 | Opened:V=[False/True]<br>State:V=[Default/Hover/Focused] |
| `_Nav button` | `1165:736` | 12 | Icon swap:I<br>Icon leading:B<br>Current:V=[False/True]<br>State:V=[Default/Hover/Focused]<br>Icon only:V=[False/True] |
| `_Nav account card menu item` | `7891:71338` | 8 | Shortcut:B<br>Icon swap:I<br>Type:V=[Menu item/Account]<br>State:V=[Default/Hover]<br>Current:V=[False/True] |
| `_Nav account card` | `7891:87996` | 6 | Type:V=[Card/Simple]<br>Open:V=[False/True]<br>Breakpoint:V=[Desktop/Mobile] |

#### Breadcrumbs (page `43:3087`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Breadcrumb button base` | `43:3221` | 24 | Current:V=[False/True]<br>Type:V=[Button/Text]<br>Icon:V=[False/True]<br>State:V=[Default/Hover/Focused] |
| `Breadcrumbs` | `1122:153` | 16 | Divider:V=[Chevron/Slash]<br>Type:V=[Text/Text with line/Button/Account dropdowns]<br>Breakpoint:V=[Desktop/Mobile] |

#### Calendars (page `7988:349308`) - 10 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Calendar view dropdown` | `7991:21267` | 2 | Open:V=[True/False] |
| `_Calendar header` | `7991:53152` | 2 | Supporting text:B<br>View dropdown:B<br>Badge:B<br>Breakpoint:V=[Desktop/Mobile] |
| `_Calendar cell date` | `7991:56363` | 3 | Type:V=[Default/Selected/Today's date] |
| `_Calendar event/Month view` | `7991:78181` | 27 | Supporting text:B<br>Dot:B<br>State:V=[Default/Hover]<br>Color:V=[Gray/Brand/Green/Blue/Indigo/Purple/Pink/Orange/Yellow]<br>Breakpoint:V=[Desktop/Mobile] |
| `_Calendar cell/Month view` | `7991:104484` | 6 | More events indicator:B<br>Event 1:B<br>Event 2:B<br>Event 3:B<br>State:V=[Default/Hover/Disabled]<br>Breakpoint:V=[Desktop/Mobile] |
| `_Calendar event/Day and week view` | `7996:12700` | 18 | Dot:B<br>Supporting text:B<br>State:V=[Default/Hover]<br>Color:V=[Gray/Brand/Green/Blue/Indigo/Purple/Pink/Orange/Yellow] |
| `_Calendar cell/Day and week view` | `7996:12741` | 10 | Type:V=[Empty/30 min/60 min/90 min/120 min]<br>State:V=[Default/Hover] |
| `_Calendar column header` | `7997:11141` | 6 | Date:B<br>Type:V=[Default/Selected/Today's date]<br>Breakpoint:V=[Desktop/Mobile] |
| `_Calendar time marker` | `8003:31690` | 2 | Breakpoint:V=[Desktop/Mobile] |
| `Calendar` | `8022:24550` | 6 | Type:V=[Month view/Week view/Day view]<br>Breakpoint:V=[Desktop/Mobile] |

#### Card headers (page `223:8525`) - 1 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Card header` | `1211:169` | 4 | Actions:B<br>Dropdown icon:B<br>Supporting text:B<br>Divider:B<br>Badge:B<br>Avatar:V=[False/True]<br>Breakpoint:V=[Desktop/Mobile] |

#### Charts (page `1050:146949`) - 12 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_X-axis` | `1061:47441` | 6 | Data:V=[12 months/30 days/7 days]<br>Breakpoint:V=[Desktop/Mobile] |
| `_Chart data` | `1061:47609` | 18 | Series 2:B<br>Series 3:B<br>Gradient background:B<br>Lines background:B<br>Line border:B<br>Chart type:V=[18 opts: Line gradual 01/Line gradual 02/Line gradual 03/Line gradual 04/Line wavy 01/Line wavy 02...] |
| `Line and bar chart` | `1062:46989` | 24 | Legend:V=[False/Top/Right]<br>Axis labels:V=[False/True]<br>Chart style:V=[Line/Bar]<br>Breakpoint:V=[Desktop/Mobile] |
| `_Y-axis line` | `1062:47445` | 2 | Label:V=[True/False] |
| `_Legend` | `1062:47961` | 2 | Orientation:V=[Vertical/Horizontal] |
| `_Y-axis` | `1067:824` | 2 | Label:V=[False/True] |
| `_Activity gauge` | `1076:4088` | 4 | Label:B<br>Size:V=[xs/sm/md/lg] |
| `Activity gauge` | `1078:155` | 12 | Size:V=[xs/sm/md/lg]<br>Legend:V=[False/Bottom/Right] |
| `_Pie chart` | `1079:51184` | 4 | Hole:V=[False/25%/50%/75%] |
| `Pie chart` | `1084:114` | 10 | Size:V=[xxs/xs/sm/md/lg]<br>Legend:V=[False/True] |
| `Radar chart` | `1084:7362` | 3 | Legend:V=[False/Right/Bottom] |
| `Chart marker` | `8100:193259` | 3 | Cursor:B<br>Tooltip:B<br>Type:V=[Line/Dash/Minimal] |

#### Code snippets (page `1221:106300`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Code snippet` | `1234:243` | 3 | Mask content:B<br>Actions:B<br>Header copy button:B<br>Type:V=[Horizontal/Vertical/Vertical with tabs] |
| `_Code snippet tabs` | `9282:60274` | 6 | Current:V=[False/True]<br>State:V=[Default/Hover/Focus] |

#### Color pickers (page `12206:573373`) - 6 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Color inputs` | `12304:616891` | 6 | Color model:V=[Hex/RGB/CSS/HSL/HSB/Gradient stop] |
| `Color picker` | `12423:52680` | 12 | Tabs:B<br>Type:V=[12 opts: Solid color/Gradient stops/Image upload/Color swatch/Saved swatches sm/Saved swatches md...] |
| `_Color swatch` | `12423:52815` | 6 | Type:V=[Default/Action]<br>State:V=[Default/Hover/Focused] |
| `Color picker dropdown` | `12424:15898` | 12 | Percentage input:B<br>Type:V=[Swatch sm/Swatch button/Swatch button link/Hex input/Select/Swatch md]<br>Open:V=[False/True] |
| `Color picker modal` | `12427:142023` | 2 | Breakpoint:V=[Desktop/Mobile] |
| `_Color swatch handle` | `12436:10729` | 2 | Type:V=[Default/Slider] |

#### Command menus (page `3307:403757`) - 6 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Command dropdown menu item` | `3307:404956` | 24 | Shortcut:B<br>Supporting text:B<br>Icon swap:I<br>Type:V=[Default/Icon leading/Avatar leading/Dot leading]<br>State:V=[Default/Hover/Focus]<br>Text:V=[Default/Stacked] |
| `_Command shortcut` | `3307:405262` | 2 | Supporting text:B<br>Icon:B<br>Dual:V=[True/False] |
| `_Command input` | `3307:405355` | 3 | Help icon:B<br>Shortcut:B<br>State:V=[Placeholder/Filled/Focus] |
| `_Command bar menu section` | `3307:405570` | 2 | Heading:B<br>Scrollable:V=[False/True] |
| `Command bar` | `3307:407570` | 10 | Type:V=[Users/Actions/Users menu/Integrations menu/Command only/Empty state]<br>Text:V=[Default/Stacked] |
| `_Command bar navigation icon` | `4898:411319` | 2 | Icon swap:I<br>Type:V=[Icon/Text] |

#### Content dividers (page `780:0`) - 1 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Content divider` | `1252:126874` | 18 | Type:V=[Heading/Text/Button/Button group icon/Button group/Button icon]<br>Style:V=[Single line/Dual line/Background fill] |

#### Date pickers (page `1143:85678`) - 5 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Date picker list item` | `1150:62` | 6 | Selected:V=[False/True]<br>State:V=[Default/Hover/Focused] |
| `_Date picker menu` | `1150:1925` | 6 | Pre-set ranges:B<br>Actions:B<br>Scroll bar:B<br>Type:V=[Dual dates/Single date/Available times]<br>Breakpoint:V=[Desktop/Mobile] |
| `Date picker dropdown` | `1150:16803` | 24 | Opened:V=[False/True]<br>Type:V=[Dual dates/Single date/Available times]<br>State:V=[Placeholder/Active]<br>Breakpoint:V=[Desktop/Mobile] |
| `Date picker modal` | `1547:269867` | 6 | Type:V=[Dual dates/Single date/Available times]<br>Breakpoint:V=[Desktop/Mobile] |
| `_Calendar cell` | `7365:57922` | 12 | Left connector:B<br>Right connector:B<br>Active dot:B<br>Type:V=[Default/Active/Selected/Today's date]<br>State:V=[Default/Hover/Disabled] |

#### Empty states (page `1172:31`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Empty state` | `1182:317` | 24 | Featured icon:B<br>Icon:V=[Featured icon/Illustration/File type icon/Folder icon/Folder icon transparent/Users radius/Users row/Integrations]<br>Size:V=[sm/md/lg] |
| `Illustration` | `1182:1085` | 12 | Style:V=[Cloud/Box/Documents/Credit card]<br>Size:V=[sm/md/lg] |

#### File upload (page `1157:90306`) - 3 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_File upload base` | `1175:100312` | 3 | File drag and drop:B<br>State:V=[Default/Hover/Disabled] |
| `_File upload item base` | `1175:100366` | 12 | Icon:B<br>Type:V=[Progress bar/Progress fill]<br>Icon type:V=[File type/Simple]<br>State:V=[In progress/Complete/Error] |
| `File upload` | `1175:101149` | 8 | Files queued:V=[True/False]<br>Type:V=[Progress bar/Progress fill]<br>Breakpoint:V=[Desktop/Mobile] |

#### Filters (page `12206:572286`) - 3 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Filters dropdown menu` | `12232:366410` | 16 | Dropdown chevron:B<br>Counter badge:B<br>State:V=[Default/Hover/Focused/Open empty state/Open inactive filter/Open active filters/Active/Disabled]<br>Orientation:V=[Right aligned/Left aligned] |
| `Filters slideout menu` | `12232:375462` | 6 | State:V=[Empty state/Inactive filter/Active filters]<br>Breakpoint:V=[Desktop/Mobile] |
| `Filters bar` | `12232:376165` | 16 | Type:V=[Simple/Tabs and search/Tabs and date picker/Date filters/Dropdowns/Dropdowns and date picker/Advanced inactive filter/Advanced active filters]<br>Breakpoint:V=[Desktop/Mobile] |

#### Inline CTAs (page `127:2907`) - 1 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Inline CTA` | `1255:131915` | 14 | Type:V=[Image/Actions/Email field/Change plan/Upgrade plan/Payment method/Receipt]<br>Breakpoint:V=[Desktop/Mobile] |

#### Loading indicators (page `1172:32`) - 1 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Loading indicator` | `1192:610` | 12 | Supporting text:B<br>Style:V=[Dot circle/Line spinner/Line simple]<br>Size:V=[md/sm/lg/xl] |

#### Messaging (page `1251:12271`) - 5 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Message` | `1242:996` | 33 | Reactions:B<br>Status icon:B<br>Type:V=[Message/Message reply/File/Audio/Image/Video/Link preview/Link minimal/Writing]<br>Sent:V=[False/True]<br>Actions panel:V=[False/True] |
| `_Message reaction` | `1244:298` | 2 | Emoji swap:I<br>Count:V=[False/True] |
| `_Message action button` | `9206:591516` | 2 | Icon swap:I<br>State:V=[Default/Hover] |
| `Message action` | `9206:602532` | 3 | Type:V=[Minimal/Textarea input/Advanced] |
| `_Message status icon` | `9241:548211` | 6 | Status:V=[Unread/Read/Failed]<br>State:V=[Default/Hover] |

#### Metrics (page `185:279`) - 3 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Metric item` | `1560:266217` | 36 | Dropdown icon:B<br>Featured icon:B<br>Actions:V=[False/True]<br>Type:V=[Simple/Icon 01/Icon 02/Icon 03/Icon 04/Chart 01/Chart 02/Chart 03/Chart 04]<br>Breakpoint:V=[Desktop/Mobile] |
| `_Chart mini` | `1561:265493` | 24 | Marker(s):B<br>Background:B<br>Type:V=[12 opts: Realistic 01/Realistic 02/Realistic 03/Wavy 01/Wavy 02/Wavy 03...]<br>Trend:V=[Positive/Negative] |
| `_Change` | `1563:260319` | 6 | Type:V=[01/02/03]<br>Trend:V=[Positive/Negative] |

#### Modals (page `172:4293`) - 3 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Modal` | `4057:415205` | 102 | Type:V=[51 opts: Stacked left aligned/Horizontal/Warning stacked left aligned/Warning horizontal/Destructive stacked left aligned/Destructive horizontal/...]<br>Breakpoint:V=[Desktop/Mobile] |
| `_Modal actions` | `4057:414352` | 18 | Checkbox:B<br>Tertiary button:B<br>Divider:B<br>Type:V=[Horizontal fill container/Vertical fill container/Horizontal right aligned (checkbox)]<br>Destructive:V=[False/True]<br>Breakpoint:V=[Desktop/Mobile vertical aligned/Mobile horizontal aligned] |
| `_Modal header` | `4055:413620` | 6 | X close button:B<br>Featured icon:B<br>Padding bottom:B<br>Divider:B<br>Type:V=[Left aligned/Center aligned/Horizontal left aligned]<br>Breakpoint:V=[Desktop/Mobile] |

#### Page headers (page `185:2718`) - 1 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Page header` | `1239:122640` | 12 | Breadcrumbs:B<br>Supporting text:B<br>Actions:B<br>Search:B<br>Divider:B<br>Style:V=[Simple/Avatar/Banner avatar/Banner simple/Banner avatar centered/Banner simple centered]<br>Breakpoint:V=[Desktop/Mobile] |

#### Pagination (page `225:7288`) - 7 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Pagination dot indicator` | `1111:1` | 8 | Current:V=[False/True]<br>Style:V=[Dot/Line]<br>Size:V=[md/lg] |
| `Pagination dot group` | `1111:38` | 8 | Size:V=[md/lg]<br>Style:V=[Dot/Line]<br>Framed:V=[True/False] |
| `_Pagination number base` | `1114:68174` | 6 | Shape:V=[Circle/Square]<br>State:V=[Default/Hover/active/Focused] |
| `_Pagination button group base` | `1114:68857` | 12 | Icon leading:I<br>Icon trailing:I<br>Icon:B<br>Type:V=[Number/Leading icon/Trailing icon/Icon only]<br>State:V=[Default/Active/hover/Focused] |
| `Pagination` | `1115:68622` | 26 | Select (dropdown):B<br>Type:V=[Page default/Page minimal center aligned/Card default/Card minimal right aligned/Card minimal left aligned/Card button group right aligned/Card button group left aligned/Card minimal center aligned/Card advanced/Card advanced center aligned]<br>Shape:V=[Square/Circle]<br>Breakpoint:V=[Desktop/Mobile] |
| `_Carousel arrow` | `1253:164` | 4 | Size:V=[md/lg]<br>Chevron:V=[Left/Right] |
| `Carousel image` | `1253:237` | 2 | Size:V=[md/lg] |

#### Progress steps (page `53:1288`) - 7 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Step icon base` | `1138:23` | 12 | Type:V=[Check/Number]<br>Status:V=[Incomplete/Current/Complete]<br>Size:V=[sm/md] |
| `_Step base` | `1138:1954` | 42 | Connector:B<br>Type:V=[Icon left/Icon top/Number left/Number top/Featured icon left/Featured icon top/Text line]<br>Status:V=[Incomplete/Current/Complete]<br>Size:V=[sm/md] |
| `Progress steps / Progress minimal icons connected` | `1139:79128` | 8 | Size:V=[sm/md]<br>Type:V=[Check/Number]<br>Breakpoint:V=[Desktop/Mobile] |
| `Progress steps / Progress minimal icons` | `1139:79149` | 8 | Text:B<br>Size:V=[sm/md]<br>Type:V=[Check/Number]<br>Breakpoint:V=[Desktop/Mobile] |
| `Progress steps / Progress text with line` | `1139:79465` | 4 | Size:V=[sm/md]<br>Breakpoint:V=[Mobile/Desktop] |
| `Progress steps / Progress icons centered` | `1141:76669` | 12 | 4th step:B<br>Size:V=[sm/md]<br>Type:V=[Icon/Number/Featured icon]<br>Breakpoint:V=[Desktop/Mobile] |
| `Progress steps / Progress icons with text` | `1254:144290` | 6 | Size:V=[sm/md]<br>Type:V=[Icon/Number/Icon featured] |

#### Section footers (page `3275:371793`) - 1 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Section footer` | `3275:372571` | 8 | Secondary button:B<br>Actions:B<br>Divider:B<br>Type:V=[Section/Card]<br>Button group:V=[True/False]<br>Breakpoint:V=[Desktop/Mobile] |

#### Section headers (page `190:4871`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Section header` | `1214:38` | 12 | Dropdown icon:B<br>Supporting text:B<br>Actions:B<br>Divider:B<br>Tabs:V=[False/True]<br>Type:V=[Buttons/Search/Button group]<br>Breakpoint:V=[Desktop/Mobile] |
| `Section label` | `5013:376534` | 4 | Required *:B<br>Supporting text:B<br>Help icon:B<br>Size:V=[sm/md]<br>Actions:V=[False/True] |

#### Slideout menus (page `231:922`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Slide out menu header` | `1239:120673` | 4 | Icon:B<br>Supporting text:B<br>Tabs:V=[False/True]<br>Breakpoint:V=[Desktop/Mobile] |
| `Slide out menu` | `1240:137582` | 46 | Type:V=[23 opts: Placeholder/User profile/Messages/Message chat/Payment method/Payment details/...]<br>Breakpoint:V=[Desktop/Mobile] |

#### Tables (page `214:0`) - 5 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Table header label` | `1221:106788` | 16 | Help icon:V=[False/True]<br>Arrow:V=[False/Chevron selector/Down/Up]<br>State:V=[Default/Hover] |
| `Table header cell` | `1221:107933` | 6 | Size:V=[sm/md]<br>Text:V=[False/True]<br>Checkbox:V=[False/True] |
| `Table cell` | `1222:107305` | 60 | Lead action:B<br>Supporting text:B<br>Lead text:B<br>Type:V=[15 opts: Text/Avatar/File type icon/Payment method/Badge/Badges multiple/...]<br>Size:V=[sm/md]<br>State:V=[Default/Hover/selected] |
| `Table` | `1227:110587` | 16 | Example:V=[Team members/Companies/Sales/Files]<br>Breakpoint:V=[Desktop/Mobile]<br>Dividers:V=[Divider line/Alternating fills] |
| `Table cell lead action` | `9400:570197` | 3 | Type:V=[Checkbox/Radio/Toggle] |

#### Tabs (page `43:0`) - 3 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Tab button base` | `43:2412` | 72 | Badge:B<br>Icon:B<br>Icon:I<br>Current:V=[False/True]<br>Size:V=[sm/md]<br>Type:V=[Button brand/Button gray/Underline/Line (vertical tabs)/Button white/Button minimal]<br>State:V=[Default/Hover/Focus] |
| `Horizontal tabs` | `1118:69893` | 40 | Type:V=[Button brand/Button gray/Underline/Button border/Button minimal]<br>Size:V=[sm/md]<br>Full width:V=[False/True]<br>Breakpoint:V=[Desktop/Mobile] |
| `Vertical tabs` | `1397:9880` | 20 | Type:V=[Button primary/Button gray/Line/Button border/Button minimal]<br>Size:V=[sm/md]<br>Breakpoint:V=[Desktop/Mobile] |

#### Tree views (page `12206:573377`) - 3 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Tree view connector` | `12450:557109` | 6 | Size:V=[sm/md]<br>Type:V=[Default/End connector/None] |
| `_Tree view item` | `12450:557173` | 16 | Icon:B<br>Checkbox:B<br>Drag handle:B<br>Level 3:B<br>Level 4:B<br>Level 2:B<br>Chevron:B<br>Size:V=[sm/md]<br>State:V=[Default/Hover]<br>Open:V=[False/True]<br>Selected:V=[False/True] |
| `Tree view` | `12451:566966` | 4 | Type:V=[Simple/Advanced]<br>Size:V=[sm/md] |


### B.3 Marketing website components (48 sets)

#### Blog sections (page `665:1107`) - 4 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Blog post card` | `1390:58` | 32 | Type:V(8)<br>Orientation:V(2)<br>Breakpoint:V(2) |
| `Blog subscribe card` | `1391:213014` | 4 | Breakpoint:V(2)<br>Type:V(2) |
| `Blog page header` | `1398:3259` | 32 | Type:V(16)<br>Breakpoint:V(2) |
| `Blog section` | `1398:5920` | 16 | Type:V(8)<br>Breakpoint:V(2) |

#### Careers (page `1458:239246`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Job post` | `1506:244681` | 6 | Details:B<br>Supporting text:B<br>Badge:B<br>Type:V(3)<br>Breakpoint:V(2) |
| `Careers section` | `1507:252424` | 24 | Type:V(8)<br>Theme:V(2)<br>Breakpoint:V(2) |

#### Contact sections (page `673:20368`) - 4 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Map location marker` | `1438:264957` | 2 | Country icon:B<br>State:V(2) |
| `Contact sections` | `1438:267698` | 56 | Type:V(20)<br>Theme:V(2)<br>Breakpoint:V(2) |
| `Contact page header` | `1457:244929` | 16 | Type:V(8)<br>Breakpoint:V(2) |
| `_Contact text` | `1437:3` | 22 | Action:B<br>Type:V(11)<br>Breakpoint:V(2) |

#### Content (page `647:15097`) - 3 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Blog post page header` | `1429:223090` | 24 | Type:V(12)<br>Breakpoint:V(2) |
| `Content section` | `1431:222569` | 20 | Type:V(10)<br>Breakpoint:V(2) |
| `Content item` | `3947:417447` | 58 | Padding top/bottom, Spacing guide, Caption, Caption icon, Divider, Avatar group, Attribution:B<br>Type:V(9)<br>Size:V(6)<br>Breakpoint:V(2) |

#### CTA sections (page `645:15070`) - 1 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `CTA section` | `1365:198734` | 60 | Type:V(23)<br>Theme:V(2)<br>Breakpoint:V(2) |

#### FAQ sections (page `282:168`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_FAQ item` | `1358:191490` | 16 | Icon:B<br>Expanded:V(2)<br>Divider:V(2)<br>Breakpoint:V(2)<br>Icon position:V(2) |
| `FAQ section` | `1360:3728` | 32 | Type:V(8)<br>Theme:V(2)<br>Breakpoint:V(2) |

#### Footers (page `278:13503`) - 3 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Footer links column` | `3288:570969` | 3 | Heading:B<br>Color:V(2)<br>Theme:V(2) |
| `Footer` | `1517:334473` | 80 | Type:V(20)<br>Theme:V(2)<br>Breakpoint:V(2) |
| `_Footer link` | `3288:570928` | 12 | Badge:V(2)<br>Color:V(2)<br>Theme:V(2)<br>State:V(2) |

#### Header navigation (page `683:17952`) - 9 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Dropdown header navigation trigger` | `1288:189` | 14 | Open:V(2)<br>Type:V(7) |
| `_Nav menu item card` | `1282:58` | 24 | Actions:B<br>Type:V(3)<br>Stacked:V(2)<br>State:V(2)<br>Breakpoint:V(2) |
| `_Nav menu item` | `1280:1541` | 8 | Badge:B<br>Supporting text:B<br>Actions:B<br>Icon swap:I<br>Icon:B<br>State:V(2)<br>Breakpoint:V(2)<br>Icon type:V(2) |
| `_Nav menu item dropdown` | `1288:10109` | 16 | Icon swap:I<br>Icon:B<br>Open:V(2)<br>State:V(2)<br>Breakpoint:V(2)<br>Icon type:V(2) |
| `Dropdown header navigation` | `1288:26576` | 60 | Open:V(2)<br>Mobile subnav open:V(2)<br>Type:V(10)<br>Breakpoint:V(2) |
| `_Nav actions` | `1624:264720` | 4 | Logged in:V(2)<br>Breakpoint:V(2) |
| `_Nav menu button` | `1288:20` | 6 | Opened:V(2)<br>State:V(3) |
| `Full-width header navigation` | `1287:2392` | 60 | Open:V(2)<br>Mobile subnav open:V(2)<br>Type:V(10)<br>Breakpoint:V(2) |
| `_Dropdown header navigation button` | `9175:550142` | 6 | Icon:B<br>Open:V(2)<br>State:V(3) |

#### Header sections (page `739:496`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Hero header section` | `1316:3622` | 88 | Type:V(44)<br>Breakpoint:V(2) |
| `Header section` | `1322:1923` | 60 | Alignment:V(3)<br>Actions:V(5)<br>Color:V(2)<br>Breakpoint:V(2) |

#### Features sections (page `736:22481`) - 3 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Feature text` | `1327:180772` | 30 | Action:B<br>Logo swap:I<br>Icon swap:I<br>Type:V(15)<br>Breakpoint:V(2) |
| `Features section` | `1344:104` | 92 | Type:V(42)<br>Theme:V(2)<br>Breakpoint:V(2) |
| `_Feature tab` | `3285:387130` | 8 | Action:B<br>Current:V(2)<br>Orientation:V(2)<br>Breakpoint:V(2) |

#### Metrics sections (page `291:164`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Metric item` | `1369:659` | 10 | Action:B<br>Supporting text:B<br>Type:V(5)<br>Breakpoint:V(2) |
| `Metrics section` | `1369:702` | 32 | Type:V(11)<br>Theme:V(2)<br>Breakpoint:V(2) |

#### Newsletter CTA sections (page `641:15058`) - 1 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Newsletter CTA section` | `1365:208633` | 32 | Type:V(12)<br>Theme:V(2)<br>Breakpoint:V(2) |

#### Pricing sections (page `708:20673`) - 5 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Pricing table cell header` | `1346:182342` | 4 | Help icon:B<br>Type:V(2)<br>Breakpoint:V(2) |
| `_Pricing table cell` | `1354:1721` | 20 | Text:V(2)<br>Icon:V(3)<br>Alignment:V(2)<br>Breakpoint:V(2) |
| `_Pricing tier card` | `1346:182709` | 20 | Type:V(10)<br>Breakpoint:V(2) |
| `Pricing page header` | `1393:7528` | 28 | Type:V(14)<br>Breakpoint:V(2) |
| `Pricing section` | `1394:207156` | 16 | Type:V(8)<br>Breakpoint:V(2) |

#### Social proof sections (page `286:15521`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Social proof section` | `1294:161217` | 20 | Type:V(5)<br>Theme:V(2)<br>Breakpoint:V(2) |
| `Press mentions section` | `1345:564` | 4 | Theme:V(2)<br>Breakpoint:V(2) |

#### Team sections (page `673:16258`) - 2 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `Team section` | `1497:249247` | 28 | Type:V(14)<br>Breakpoint:V(2) |
| `_Team member` | `1458:240598` | 14 | Social icons:B<br>Supporting text:B<br>Type:V(7)<br>Breakpoint:V(2) |

#### Testimonial sections (page `648:16272`) - 3 set(s)

| Component set | Node ID | Variants | Properties (V = variant options, B = boolean, I = instance swap, T = text) |
|---|---|---|---|
| `_Testiomonial carousel arrow` | `1374:440` | 24 | Size:V(2)<br>Arrow:V(2)<br>Type:V(3)<br>State:V(2) |
| `_Quote image bottom panel` | `1376:1163` | 16 | Size:V(2)<br>Type:V(2)<br>Quote:V(2)<br>Breakpoint:V(2) |
| `Testimonial section` | `1377:11884` | 52 | Type:V(17)<br>Theme:V(2)<br>Breakpoint:V(2) |

