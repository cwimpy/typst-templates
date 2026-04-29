# peer-review-memo

A Quarto Typst format for writing structured journal peer-review memos.

## Getting started

### Start a new memo from this template

```bash
quarto use template cwimpy/typst-templates/peer-review-memo
```

Run this from the *parent* directory where you want the memo to live. Quarto
will prompt for a name and create a new folder with `template.qmd` and the
format extension. Render with:

```bash
quarto render template.qmd
```

### Or add just the format to an existing project

```bash
quarto add cwimpy/typst-templates/peer-review-memo
```

Then set `format: peer-review-memo-typst` in your document's YAML.

## YAML fields

| Field | Purpose |
|-------|---------|
| `manuscript-title` | Title of the submission under review |
| `manuscript-id` | Journal-assigned ID (e.g. `JOP-2026-0123`) |
| `venue` | Journal name (`journal` is reserved by Quarto, so we use `venue`) |
| `reviewer` | Reviewer identifier (e.g. `Reviewer 2`) |
| `recommendation` | Editorial recommendation |
| `date` | Date of review (defaults to today) |
| `confidential` | `true` to add a confidentiality banner |

All fields are optional — omit any you don't need.

## Suggested section layout

```markdown
# Summary of the Submission
# Major Comments
# Minor Comments
# Assessment of Contribution
```
