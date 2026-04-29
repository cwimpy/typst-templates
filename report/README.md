# report

A formal project / grant / institutional report template with a cover
page, accent-colored block headings, running header + footer, and a
`#callout()` helper for highlighted notes.

## Render the example

```bash
quarto render template.qmd
```

## YAML fields

### Cover page

| Field | Purpose |
|-------|---------|
| `title` | Main title |
| `subtitle` | Secondary title |
| `report-author` | Author name |
| `author-affiliation` | Role / title |
| `author-email` | Clickable email |
| `institution` | Organization |
| `date` | `"YYYY-MM-DD"` → "Month DD, YYYY"; free text passes; omit for today |
| `logo` | Path to cover-page logo (optional) |

### Running header + footer (page 2+)

| Field | Purpose |
|-------|---------|
| `running-title` | Short title in the header; defaults to `title` |
| `running-footer` | Free text shown at the bottom of each page after the cover |

### Styling

| Field | Purpose |
|-------|---------|
| `accent-color` | Hex string without the `#`, e.g. `"cc092f"` |

## Callouts

```markdown
```{=typst}
#callout(type: "important", title: "Bottom Line")[
  Text goes here.
]
```
```

Available types: `note` (blue), `tip` (green), `important` (accent color),
`warning` (amber).

## Getting started

### Start a new report from this template

```bash
quarto use template cwimpy/typst-templates/report
```

Run this from the *parent* directory where you want the report to live. Quarto
will prompt for a name and create a new folder with `template.qmd` and the
format extension. Render with:

```bash
quarto render template.qmd
```

### Or add just the format to an existing project

```bash
quarto add cwimpy/typst-templates/report
```

Then set `format: report-typst` in your document's YAML.
