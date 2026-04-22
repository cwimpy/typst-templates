# cover-letter

A Quarto Typst format for journal submission cover letters. Letterhead-style
sender block, date, recipient, salutation, body, closing signature.

## Render the example

```bash
quarto render template.qmd
```

## YAML fields

All fields are optional; omit any you don't need.

| Field | Purpose |
|-------|---------|
| `sender-name`, `sender-title`, `sender-affiliation`, `sender-address`, `sender-email`, `sender-phone` | Letterhead block (right-aligned) |
| `recipient-name`, `recipient-title`, `recipient-journal`, `recipient-address` | Recipient block |
| `salutation` | Defaults to `Dear {recipient-name}` if omitted |
| `manuscript-title` | Used in PDF title metadata |
| `closing` | Defaults to `Sincerely,` |
| `date` | `"YYYY-MM-DD"` renders as "Month DD, YYYY"; free-text passes through; omit for today |

## Install as an extension

```bash
quarto add cwimpy/typst-templates/cover-letter
```

Then: `format: cover-letter-typst`
