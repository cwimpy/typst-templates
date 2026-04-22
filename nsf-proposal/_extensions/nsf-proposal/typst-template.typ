// NSF Proposal – Quarto Typst Template
// Formatting per NSF PAPPG:
//   - Times New Roman 11pt (or Arial/Courier New/Palatino 10pt+)
//   - 1" margins all directions
//   - No more than 6 lines per vertical inch (leading >= 1pt)
//   - No page numbering (Research.gov auto-paginates)
//   - Single-column format

#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  margin: (x: 1in, y: 1in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: (),
  fontsize: 11pt,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {

  // ── Page setup ──────────────────────────────────────────────
  // No page numbering per NSF Research.gov submission guidelines
  set page(
    paper: paper,
    margin: margin,
    numbering: none,
  )

  // ── Font & text ─────────────────────────────────────────────
  set text(
    lang: lang,
    region: region,
    font: font,
    size: fontsize,
  )

  // ── Paragraphs ──────────────────────────────────────────────
  // NSF: no more than 6 lines per vertical inch (≥12pt baseline-to-baseline).
  // Empirically verified: 0.44em → 5.94 LPI (compliant).
  set par(
    justify: true,
    leading: 0.44em,
    first-line-indent: 0em,
    spacing: 0.75em,
  )

  // ── Headings ────────────────────────────────────────────────
  set heading(numbering: sectionnumbering)

  // Level 1 headings: bold, 13pt, small caps, tightened spacing
  show heading.where(level: 1): it => {
    set text(size: 13pt, weight: "bold")
    v(0.8em)
    block[
      #if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.5em)
      }
      #smallcaps(it.body)
    ]
    v(0.25em)
  }

  // Level 2 headings: bold, 11pt
  show heading.where(level: 2): it => {
    set text(size: 11pt, weight: "bold")
    v(0.5em)
    block[
      #if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.5em)
      }
      #it.body
    ]
    v(0.15em)
  }

  // Level 3 headings: bold italic, 11pt
  show heading.where(level: 3): it => {
    set text(size: 11pt, weight: "bold", style: "italic")
    v(0.4em)
    block[
      #if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.5em)
      }
      #it.body
    ]
    v(0.1em)
  }

  // ── Lists ───────────────────────────────────────────────────
  set enum(indent: 1em, body-indent: 0.5em)
  set list(indent: 1em, body-indent: 0.5em)

  // ── Figures & tables ────────────────────────────────────────
  set figure(placement: auto)
  show figure: set text(size: 10pt)
  show figure.caption: set text(size: 10pt)

  // ── Links ───────────────────────────────────────────────────
  show link: set text(fill: rgb("#1a0dab"))

  // ── Title block ─────────────────────────────────────────────
  if title != none {
    align(center)[
      #block(inset: (bottom: 1em))[
        #text(weight: "bold", size: 14pt)[#title]
        #if subtitle != none {
          v(0.3em)
          text(size: 12pt, style: "italic")[#subtitle]
        }
      ]
    ]
  }

  // Authors
  if authors != none {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
        align(center)[
          #text(weight: "bold")[#author.name] \
          #if "affiliation" in author {
            text(size: 9pt)[#author.affiliation]
          }
          #if "email" in author {
            text(size: 9pt)[ \ #link("mailto:" + author.email)[#author.email]]
          }
        ]
      )
    )
    v(1em)
  }

  // ── Abstract / Project Summary ──────────────────────────────
  if abstract != none {
    block(width: 100%)[
      #if abstract-title != none {
        text(weight: "bold", size: 11pt)[#abstract-title]
        parbreak()
      }
      #abstract
    ]
    v(1em)
  }

  // ── Table of contents ───────────────────────────────────────
  if toc {
    let title = if toc_title == none { "Table of Contents" } else { toc_title }
    block(above: 0em, below: 2em)[
      #outline(
        title: text(weight: "bold")[#title],
        depth: if toc_depth == none { 3 } else { toc_depth },
        indent: toc_indent,
      )
    ]
  }

  // ── Columns ─────────────────────────────────────────────────
  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
