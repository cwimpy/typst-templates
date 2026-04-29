# policy-brief

A short, skim-friendly brief for policy audiences. Top colored banner,
large title, "Key Findings" box right under the title, accent-colored
section headings, pull-quote helper, recommendations block, and a
citation footer.

Designed to produce 2–4 page briefs that a busy staffer can scan in
under a minute and read in full in five.

## Render the example

```bash
quarto render template.qmd
```

## YAML fields

### Banner (top ribbon)

| Field | Purpose |
|-------|---------|
| `series` | e.g. `"Rural Elections Initiative"` — shown in all caps |
| `issue` | e.g. `"Brief No. 4"` |
| `date` | `"YYYY-MM-DD"` → "Month YYYY"; free text passes; omit for today |

### Title block

| Field | Purpose |
|-------|---------|
| `title` | Main title (large, bold) |
| `subtitle` | Lighter subtitle beneath |
| `brief-author` | Author name (bold in byline) |
| `brief-affiliation` | Institution / center |

### Key findings box

| Field | Purpose |
|-------|---------|
| `key-findings` | YAML array of strings — each becomes one bullet in the box |

Leave the array empty or omit the field to suppress the box.

### Footer

| Field | Purpose |
|-------|---------|
| `cite-as` | Full citation string shown at the bottom |
| `contact` | Contact line (email, URL) |

### Styling

| Field | Purpose |
|-------|---------|
| `accent-color` | Hex without the `#` — defaults to `1a5490` (deep blue) |

## Body helpers

Use inside `{=typst}` blocks:

```markdown
```{=typst}
#pullquote[
  A sidebar-worthy sentence that deserves extra attention.
]

#recommendations[
  - First recommendation in bold-like prose.
  - Second recommendation.
  - Third recommendation.
]
```
```

## Getting started

### Start a new brief from this template

```bash
quarto use template cwimpy/typst-templates/policy-brief
```

Run this from the *parent* directory where you want the brief to live. Quarto
will prompt for a name and create a new folder with `template.qmd` and the
format extension. Render with:

```bash
quarto render template.qmd
```

### Or add just the format to an existing project

```bash
quarto add cwimpy/typst-templates/policy-brief
```

Then set `format: policy-brief-typst` in your document's YAML.
