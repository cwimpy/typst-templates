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

## Install as an extension

```bash
quarto add cwimpy/typst-templates/report
```

Then: `format: report-typst`
