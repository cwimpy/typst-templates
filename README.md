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
| [`nametags`](nametags/) | Conference badges (4×3 in) and table tents (tabloid, folded), driven from a CSV |

## Using a template

### Start a new project from a template (recommended)

`quarto use template` copies the example `.qmd` and any supporting files
(bibliography, CSL, etc.) into a fresh folder *and* installs the format
extension:

```bash
quarto use template cwimpy/typst-templates/peer-review-memo
```

Run this from the *parent* directory where you want the project to live —
Quarto will prompt for a name and create a new folder. Then:

```bash
cd <name-you-chose>
quarto render template.qmd
```

### Add just the format to an existing project

If you already have a Quarto project and only want the format extension (no
starter files):

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

Replace `peer-review-memo` with any of the template names listed above.

## Requirements

- Quarto ≥ 1.4
- Typst (bundled with Quarto since 1.4)

## License

MIT
