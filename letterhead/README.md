# letterhead

A generic institutional letterhead template for business / academic letters.
Optional top-center and bottom-right logos, YAML-driven footer with sender
contact, optional signature image, and standard `encl` / `cc` / `PS` fields.

## Render the example

```bash
quarto render template.qmd
```

## Key YAML fields

All fields are optional — omit any you don't need.

### Sender (footer + signature block)

| Field | Purpose |
|-------|---------|
| `sender-name` | e.g. `"Dr. Jane Doe"` |
| `sender-qualifications` | Suffix appended after name, e.g. `"PhD"` |
| `sender-position` | e.g. `"Associate Professor"` |
| `sender-department` | e.g. `"Department of Example Studies"` |
| `sender-institution` | e.g. `"Your University \| City, ST"` |
| `sender-address` | Mailing address |
| `sender-email`, `sender-phone`, `sender-website` | Contact icons |

### Logos + signature (file paths)

| Field | Purpose |
|-------|---------|
| `logo-header` | Centered top logo (e.g., department mark) |
| `logo-footer` | Bottom-right logo (e.g., accreditation mark) |
| `signature` | Signature image, shown above the typed name |

Drop your own PNG/SVG files in the project directory (or an `assets/`
subfolder) and point these fields at the relative paths.

### Letter content

| Field | Purpose |
|-------|---------|
| `date` | `"YYYY-MM-DD"` → "Month DD, YYYY"; free text passes; omit for today |
| `recipient` | List of address lines (YAML array) |
| `opening` | Salutation, e.g. `"Dear Dr. Roe,"` |
| `closing` | Default `"Sincerely,"` |
| `bold-title` | Optional centered bold title line above the date |
| `sub-header` | Optional centered line below the top logo (e.g., college name) |

### Bottom elements

| Field | Purpose |
|-------|---------|
| `encl` | Enclosures |
| `cc` | Copy recipients |
| `ps` | Postscript |

## Customization

- Change fonts: edit `font-body` / `font-heading` defaults in
  `_extensions/letterhead/typst-template.typ`
- Adjust margins / footer depth: edit `set page(...)` in the same file
- Reposition logos: adjust the `dx` / `dy` values in the `place(...)` calls

## Install as an extension

```bash
quarto add cwimpy/typst-templates/letterhead
```

Then: `format: letterhead-typst`
