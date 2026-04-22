# memo

A generic institutional memo template — centered title, standard
To/From/Date/Re grid, horizontal rule, body, optional signature and
co-signatory blocks. All branding (logos, footer contact) is driven by
YAML; nothing is hardcoded.

## Render the example

```bash
quarto render template.qmd
```

## Key YAML fields

### Memo header

| Field | Purpose |
|-------|---------|
| `title` | Defaults to `"MEMORANDUM"` |
| `memo-to` | Recipient |
| `memo-from` | Sender (usually name + title) |
| `subject` | Shows as "Re:" |
| `date` | `"YYYY-MM-DD"` → "Month DD, YYYY"; free text passes; omit for today |

### Sender (footer block)

| Field | Purpose |
|-------|---------|
| `sender-name`, `sender-qualifications`, `sender-position`, `sender-department`, `sender-institution` | Identity |
| `sender-email`, `sender-phone`, `sender-website` | Contact with icons |

### Optional header / logos

| Field | Purpose |
|-------|---------|
| `dept-header` | Bold centered line above memo title (e.g., college name) |
| `dept-subheader` | Smaller centered line under `dept-header` (e.g., dept + address + phone) |
| `logo-header` | Centered top logo (path) |
| `logo-footer` | Bottom-right logo (path) |

### Signatures

| Field | Purpose |
|-------|---------|
| `author-sig: true` | Adds a signature line using `sender-name` |
| `signature` | Path to signature image — placed above the line if `author-sig: true` |
| `cosig: true` | Adds a second signature line |
| `cosig-name`, `cosig-title` | Co-signatory identity |

## Postscripts

Use the `#ps[...]` helper via a raw Typst block:

````markdown
```{=typst}
#ps[PS: The next meeting is scheduled for May 8.]
```
````

## Install as an extension

```bash
quarto add cwimpy/typst-templates/memo
```

Then: `format: memo-typst`
