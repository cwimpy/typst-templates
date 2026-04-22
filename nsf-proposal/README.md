# NSF Proposal Template for Quarto

A [Quarto](https://quarto.org) template extension for writing NSF proposals using [Typst](https://typst.app). Produces PAPPG-compliant PDFs with correct fonts, margins, spacing, and page layout — no manual formatting required.

## Features

- **NSF PAPPG-compliant formatting**: Times New Roman 11pt, 1" margins, ≤6 lines per vertical inch, no page numbers (Research.gov auto-paginates)
- **Multi-document workflow**: Each NSF upload component renders as an independent PDF
- **Makefile build system**: `make all` renders everything; `make proposal` for just the narrative
- **Auto-generated checklist**: R-based status checker flags placeholders, missing sections, and tracks completion
- **Clean output**: All PDFs land in `_output/` matching Research.gov upload order

## Getting Started

### Install the template

```bash
quarto use template cwimpy/typst-templates/nsf-proposal
```

This creates a new directory with all template files and installs the extension.

### Or add just the format to an existing project

```bash
quarto add cwimpy/typst-templates/nsf-proposal
```

### Requirements

- [Quarto](https://quarto.org) >= 1.4.0 (installs Typst automatically)
- [R](https://www.r-project.org/) with `tidyverse`, `knitr`, and `stringr` (for the checklist only)
- [GNU Make](https://www.gnu.org/software/make/) (optional, for the Makefile)

## Usage

### Render everything

```bash
make all
```

### Render individual documents

```bash
make project-summary
make project-description
make references
make budget-justification
make facilities
make data-management
make synergistic-activities
make mentoring-plan
make checklist
```

### Or use Quarto directly

```bash
quarto render                          # render all
quarto render 01-project-summary.qmd  # render one document
```

### Open all PDFs (macOS)

```bash
make open
```

## Template Files

| File | NSF Component | Page Limit |
|:-----|:--------------|:-----------|
| `01-project-summary.qmd` | Project Summary | 1 page |
| `02-project-description.qmd` | Project Description | 15 pages* |
| `03-references.qmd` | References Cited | No limit |
| `04-budget-justification.qmd` | Budget Justification | 5 pages |
| `05-facilities.qmd` | Facilities, Equipment & Resources | No limit |
| `06-data-management.qmd` | Data Management and Sharing Plan | 2 pages |
| `07-synergistic-activities.qmd` | Synergistic Activities | 1 page/person |
| `08-mentoring-plan.qmd` | Mentoring Plan (if postdocs/students funded) | 1 page |
| `09-current-pending.qmd` | Current and Pending Support | No limit |
| `10-pi-summary.qmd` | PI Summary (optional) | Varies |
| `checklist.qmd` | Auto-generated status report | — |

*\*Check your solicitation — some programs have different limits (e.g., 10 pages for fellowship programs).*

Each `.qmd` file includes HTML comments with NSF guidance on required content and formatting rules.

## How It Works

The extension provides a custom Typst format (`nsf-proposal-typst`) that handles all PAPPG formatting:

- **`typst-template.typ`** — Page layout, fonts, heading styles, paragraph spacing
- **`typst-show.typ`** — Bridges Quarto YAML metadata to the Typst template

The `_quarto.yml` applies this format to all documents. Individual `.qmd` files can override settings in their own YAML front matter.

### Multi-document citation workflow

- `02-project-description.qmd` uses `suppress-bibliography: true` to cite in-text without printing the reference list
- `03-references.qmd` uses `nocite: '@*'` with `citeproc: true` to print all entries from `references.bib`
- This keeps citations and the reference list in separate uploadable PDFs, as Research.gov requires

## Customization

### Change the citation style

Replace `american-political-science-association.csl` with any CSL file from the [Zotero Style Repository](https://www.zotero.org/styles). Update the `csl:` field in `02-project-description.qmd` and `03-references.qmd`.

### Change fonts or margins

Override in `_quarto.yml` or in individual `.qmd` files:

```yaml
format:
  nsf-proposal-typst:
    mainfont: "Arial"
    fontsize: 10pt
    margin:
      x: 1in
      y: 1in
```

### Add or remove documents

Edit the `render:` list in `_quarto.yml` and the corresponding targets in the `Makefile`.

## Checklist

The `checklist.qmd` auto-generates a status report when rendered. It:

- Checks that all required files exist
- Flags placeholder text (TODO, template markers)
- Verifies required NSF sections are present
- Provides an upload checklist matching Research.gov order

Customize the document registry, placeholder patterns, and required sections in the R code blocks to match your solicitation.

## Documents Prepared Separately

The following required NSF documents are **not** included in this template and must be prepared through other systems:

- **Cover Sheet** — Prepared in Research.gov or Grants.gov
- **Budget** — Built using the Research.gov budget tool
- **Biographical Sketches** — Use [SciENcv](https://www.ncbi.nlm.nih.gov/sciencv/) (no page limit per PAPPG 24-1)
- **Current and Pending Support** — Use SciENcv (preferred) or upload a PDF
- **Collaborators and Other Affiliations (COA)** — Download the NSF COA template spreadsheet; includes thesis advisors, postdoc sponsors, collaborators from past 48 months
- **Letters of Support** — Upload as separate PDFs in supplementary documentation

## Pre-submission Checklist

- [ ] Project Description does not exceed page limit (check your solicitation)
- [ ] Project Summary fits on exactly 1 page
- [ ] Separate "Intellectual Merit" and "Broader Impacts" headings exist in both Summary and Description
- [ ] "Results from Prior NSF Support" section is included (or "no prior support" stated)
- [ ] All citations in the Description appear in References Cited
- [ ] Budget matches Budget Justification narrative
- [ ] All co-PIs have submitted biosketches, C&P support, and COA
- [ ] Mentoring Plan included and within 1-page limit (required if postdocs or grad students funded)
- [ ] Data Management and Sharing Plan is within 2-page limit
- [ ] Synergistic Activities within 1-page limit per person
- [ ] Senior/key personnel salary does not exceed 2 months/year (unless solicitation allows more)
- [ ] Run `make checklist` for automated status report
- [ ] Have colleagues review for clarity and completeness
- [ ] Verify compliance with program-specific solicitation requirements
- [ ] Submit by 5:00 p.m. submitting organization's local time on the deadline date

## License

MIT
