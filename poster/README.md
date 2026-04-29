# poster

A Quarto Typst format for academic / conference posters. A0 landscape,
cream paper, deep-navy title banner, terracotta accents. Ships with a
suite of body helpers (`#section-title`, `#callout`, `#stat-card`,
`#dim-chip`, `#hero`) and leaves the column layout to you.

## Render the example

```bash
quarto render template.qmd
```

Output is a single-page A0 PDF sized for 1:1 print. If you need a
different paper size, edit `set page(paper: "a0", flipped: true, ...)`
inside `_extensions/poster/typst-template.typ`.

## YAML fields

### Title banner

| Field | Purpose |
|-------|---------|
| `title` | Main title (very large, white on navy) |
| `subtitle` | Secondary title (lighter, gold) |
| `by-author` | Quarto authors list — each `{name: {literal: "..."}}` |
| `orcid` | Optional ORCID (shown in monospace under authors) |
| `affiliation` | Department / institute / university line |
| `venue` | Conference name (shown on the right of the banner) |
| `poster-date` | Conference date |

### Hero pull quote (optional)

| Field | Purpose |
|-------|---------|
| `hero-line` | A short emphatic block shown between the banner and the body — Markdown (bold / italic / `*foo*`) is supported |

### Footer

| Field | Purpose |
|-------|---------|
| `footer-contact` | e.g. `"jane.doe@example.edu · orcid.org/..."` |
| `footer-affiliation` | e.g. `"Example Institute · Example University"` |
| `footer-resources` | e.g. `"R package: mypkg on CRAN · github.com/..."` |
| `logo-left`, `logo-right` | Optional logo paths; omit to skip |
| `logo-height` | Logo height (default `18mm`) |

## Body helpers

Use these inside `{=typst}` blocks. Put the whole body into a `#grid(...)`
with as many columns as you want.

| Helper | Purpose |
|--------|---------|
| `#section-title[...]` | Large navy section heading with a terracotta rule |
| `#callout[...]` | Highlighted box with a colored left-rule |
| `#stat-card("67%", "description")` | Big-number stat card |
| `#dim-chip("1", "Title", "body text")` | Numbered chip (for enumerated steps/dimensions) |
| `#hero[...]` | Big italic pull quote |
| `palette.primary`, `palette.accent`, etc. | Access the color palette in your body |

## Changing the palette

Edit `default-palette` at the top of
`_extensions/poster/typst-template.typ`. The defaults are:

- `primary` — deep navy (`#1e3a5f`)
- `accent` — terracotta (`#c17754`)
- `wheat` — warm gold (`#d4a843`)
- `paper` — cream (`#fbfaf6`)
- `muted` — grey (`#6b6b6b`)

## Getting started

### Start a new poster from this template

```bash
quarto use template cwimpy/typst-templates/poster
```

Run this from the *parent* directory where you want the poster to live. Quarto
will prompt for a name and create a new folder with `template.qmd` and the
format extension. Render with:

```bash
quarto render template.qmd
```

### Or add just the format to an existing project

```bash
quarto add cwimpy/typst-templates/poster
```

Then set `format: poster-typst` in your document's YAML.
