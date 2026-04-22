# sign-in-sheet

A Quarto Typst format for meeting sign-in sheets. Groups positions by
section (e.g., college / unit), each rendered as a three-column table
with blank "Print Name" and "Signature" cells ready for paper sign-in.

## Render the example

```bash
quarto render template.qmd
```

## YAML fields

| Field | Purpose |
|-------|---------|
| `title` | Header at the top of the sheet |
| `meeting-date` | `"YYYY-MM-DD"` → "Month DD, YYYY"; free text passes |
| `meeting-time` | Free text, e.g. `"1:00 p.m."` |
| `meeting-location` | Free text |

## Building the sheet

Use level-1 markdown headings (`#`) for group names. Inside each group,
use the `#signatures(...)` helper in a raw Typst block to list the
positions/departments that will sign:

````markdown
# College of Example Sciences

```{=typst}
#signatures(
  "Department of Biology",
  "Department of Chemistry",
  "Department of Physics",
)
```
````

Each string becomes one blank row. Use `{{< pagebreak >}}` between
groups if you need to force page breaks at specific points.

## Install as an extension

```bash
quarto add cwimpy/typst-templates/sign-in-sheet
```

Then: `format: sign-in-sheet-typst`
