# working-paper

A Quarto Typst format for academic working papers and manuscripts.

## Features

- Title page with author names, dagger-symbol affiliation footnotes, and
  optional ORCID icons (via `fontawesome`)
- Abstract and keywords block
- Double-spaced body, 0.5" first-line indent
- Booktabs-style table rules
- Bibliography with hanging indent and CSL support
- Optional table of contents
- Myriad Pro headings / Minion Pro body (falls back silently if not installed —
  override `mainfont` in YAML to use what you have)

## Render the example

```bash
quarto render template.qmd
```

The example includes `references.bib` and `apsa.csl` to demonstrate the
bibliography pipeline.

## Key YAML fields

| Field | Purpose |
|-------|---------|
| `title`, `subtitle` | Title page |
| `author` | List of `{name, affiliations, email, orcid}` objects |
| `date` | Publication date (supports `"today"` and `date-format`) |
| `abstract`, `keywords` | Abstract block and keyword list |
| `thanks` | Footnote on the title — acknowledgments, funding, etc. |
| `bibliography` | Path to `.bib` file |
| `bibliographystyle` | Path to `.csl` file or CSL name |
| `biblio-title` | Reference list heading (e.g., "References") |
| `toc` | `true` to include a table of contents (default `false`) |
| `section-numbering` | e.g. `"1.1"` to number sections; omit to disable |
| `mainfont`, `fontsize`, `papersize` | Standard Quarto overrides |

## Getting started

### Start a new paper from this template

```bash
quarto use template cwimpy/typst-templates/working-paper
```

Run this from the *parent* directory where you want the paper to live. Quarto
will prompt for a name and create a new folder containing `template.qmd`,
`references.bib`, `apsa.csl`, and the format extension. Render with:

```bash
quarto render template.qmd
```

### Or add just the format to an existing project

```bash
quarto add cwimpy/typst-templates/working-paper
```

Then set `format: working-paper-typst` in your document's YAML.
