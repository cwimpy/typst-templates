# peer-review-memo

A Quarto Typst format for writing structured journal peer-review memos.

## Render the example

```bash
quarto render template.qmd
```

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
