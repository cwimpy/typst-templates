# typst-templates

A collection of [Quarto](https://quarto.org) custom formats that render with
[Typst](https://typst.app). Designed for academic work — clean defaults, no
LaTeX toolchain required.

## Templates

### Research & publishing

| Template | Purpose |
|----------|---------|
| [`working-paper`](working-paper/) | Double-spaced manuscript with title page, abstract, bibliography |
| [`cover-letter`](cover-letter/) | Journal submission cover letter |
| [`peer-review-memo`](peer-review-memo/) | Structured memo for journal peer reviews |
| [`review-response`](review-response/) | Point-by-point response to reviewer comments |
| [`nsf-proposal`](nsf-proposal/) | PAPPG-compliant multi-document NSF proposal |
| [`cv`](cv/) | Academic CV with icon-decorated contact header and entry helpers |
| [`report`](report/) | Formal project / grant report with cover page, callouts, running footer |
| [`policy-brief`](policy-brief/) | Short policy brief with banner, key-findings box, pull-quote + recommendations helpers |
| [`poster`](poster/) | A0 conference poster with banner, hero pull-quote, stat cards, callouts, footer logos |

### Teaching

| Template | Purpose |
|----------|---------|
| [`notes`](notes/) | Lecture / long-form notes with TOC, theorem boxes, accent color |

### Administration

| Template | Purpose |
|----------|---------|
| [`letterhead`](letterhead/) | Generic institutional letter — configurable logos, footer, signature |
| [`memo`](memo/) | Generic institutional memo — configurable branding, optional signatures |
| [`meeting-agenda`](meeting-agenda/) | Department / committee agenda or minutes |
| [`sign-in-sheet`](sign-in-sheet/) | Grouped sign-in tables for meetings |

## Using a template

Each template ships as a Quarto extension. From the template's folder, render
the example:

```bash
cd peer-review-memo
quarto render template.qmd
```

To use a template in your own project, install it as an extension:

```bash
quarto add cwimpy/typst-templates/peer-review-memo
```

Then in your `.qmd`:

```yaml
---
title: "My review"
format: peer-review-memo-typst
---
```

## Requirements

- Quarto ≥ 1.4
- Typst (bundled with Quarto since 1.4)

## License

MIT
