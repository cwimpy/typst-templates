# notes

A Quarto Typst format for lecture notes and long-form notes. Features:

- Table of contents (toggle via YAML)
- Numbered headings with a configurable prefix (e.g., "Lecture 1:")
- Colored theorem/definition/example/note/attention boxes via `ctheorems` + `showybox`
- Syntax-highlighted code via `codly`
- Author/date header with "Published" and "Last updated" lines
- Optional color tab in the page header
- Configurable accent color, paper size, columns, fonts

## Render the example

```bash
quarto render example.qmd
```

## YAML fields

| Field | Default | Purpose |
|-------|---------|---------|
| `title` | — | Document title |
| `short-title` | title | Shorter title shown in page headers |
| `subtitle` | — | Description/subtitle under the title |
| `author` | — | List of `{name, url}` objects |
| `date` | today | `"YYYY-MM-DD"` renders as "Month DD, YYYY"; free-text passes through |
| `toc` | `true` | Show/hide the table of contents |
| `lof` / `lot` / `lol` | `false` | List of figures / tables / listings |
| `papersize` | `a4` | e.g. `us-letter` |
| `landscape` | `false` | |
| `columns` | `1` | |
| `mainfont` | `Libertinus Serif` | Body font |
| `monofont` | `DejaVu Sans Mono` | Code font |
| `accent-color` | `DC143C` | Hex color (no `#`) used for headings, links, date, header rule |
| `h1-prefix` | `Lecture` | Prefix for level-1 headings (e.g. "Lecture 1:") |
| `colortab` | `false` | Show a gradient color tab at the top right of each page |
| `bibliography` | — | Path to `.bib` file |
| `bibstyle` | `apa` | Citation style |

## Theorem-style boxes

Invoke with raw Typst blocks:

````markdown
```{=typst}
#definition("Mean")[
  The sum of all values divided by the number of values.
]
```
````

Available environments: `definition`, `theorem`, `proposition`, `example`,
`note`, `attention`, `quote`, `hypothesis`.

## Fonts

The example uses Minion Pro and Pragmata Pro. If you don't have those
installed, Typst falls back silently — override `mainfont` / `monofont` in
YAML to use what you have.

## Install as an extension

```bash
quarto add cwimpy/typst-templates/notes
```

Then in your `.qmd`:

```yaml
format: notes-typst
```
