# meeting-agenda

A Quarto Typst format for department or committee meeting agendas (and
minutes). Inspired by the LaTeX `meetingmins` class.

## Render the example

```bash
quarto render template.qmd
```

## Usage

Switch between an agenda and meeting minutes by setting `doc-kind`:

```yaml
doc-kind: "Agenda"    # default
doc-kind: "Minutes"
```

## Key YAML fields

| Field | Purpose |
|-------|---------|
| `committee` | Name of the committee or unit (appears under "Agenda"/"Minutes") |
| `doc-kind` | `"Agenda"` (default) or `"Minutes"` |
| `date` | `"YYYY-MM-DD"` → "Month DD, YYYY"; free text passes; omit for today |
| `time` | Meeting time, e.g. `"2:00 – 3:30 PM"` |
| `location` | Meeting room / Zoom link |
| `chair` | Chair's name |
| `members` | YAML array of member names |
| `apologies` | YAML array of absent members |
| `guests` | YAML array of invited guests |
| `next-meeting` | Free-text line shown at the bottom |

## Agenda structure

Level-1 headings (`#`) become major agenda sections with a horizontal rule
underline. Level-2 headings (`##`) become italic sub-items. Use standard
Markdown lists under each heading.

## Getting started

### Start a new agenda from this template

```bash
quarto use template cwimpy/typst-templates/meeting-agenda
```

Run this from the *parent* directory where you want the agenda to live. Quarto
will prompt for a name and create a new folder with `template.qmd` and the
format extension. Render with:

```bash
quarto render template.qmd
```

### Or add just the format to an existing project

```bash
quarto add cwimpy/typst-templates/meeting-agenda
```

Then set `format: meeting-agenda-typst` in your document's YAML.
