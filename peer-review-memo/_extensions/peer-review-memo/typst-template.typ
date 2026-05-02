// Peer Review Memo — Typst template for Quarto
// Usage: see template.qmd

#let _memo-date-format = "[month repr:long] [day padding:none], [year]"

#let _format-memo-date(d) = {
  if d == none or d == auto {
    return datetime.today().display(_memo-date-format)
  }
  if type(d) == str {
    let m = d.match(regex("^(\d{4})-(\d{2})-(\d{2})$$"))
    if m != none {
      let (y, mo, day) = m.captures
      return datetime(year: int(y), month: int(mo), day: int(day))
        .display(_memo-date-format)
    }
    return d
  }
  if type(d) == datetime {
    return d.display(_memo-date-format)
  }
  d
}

#let peer-review-memo(
  manuscript-title: none,
  manuscript-id: none,
  journal: none,
  reviewer: none,
  date: none,
  recommendation: none,
  confidential: false,
  font-body: "Libertinus Serif",
  font-heading: "Myriad Pro",
  font-mono: "JetBrains Mono",
  fontsize: 11pt,
  doc,
) = {
  set document(title: "Peer Review" + if manuscript-title != none { ": " + manuscript-title } else { "" })

  set page(
    paper: "us-letter",
    margin: (x: 1in, y: 1in),
    header: context {
      if counter(page).get().first() > 1 [
        #set text(size: 9pt, fill: luma(40%))
        #grid(columns: (1fr, auto),
          [Peer Review#if manuscript-id != none [ — #manuscript-id]],
          [#counter(page).display()]
        )
        #line(length: 100%, stroke: 0.3pt + luma(70%))
      ]
    },
  )

  set text(font: font-body, size: fontsize, lang: "en", hyphenate: false)
  set par(justify: true, leading: 0.65em, first-line-indent: 0em)

  show heading: set text(font: font-heading, weight: "semibold")
  show heading.where(level: 1): it => {
    v(1.2em, weak: true)
    text(size: 1.15em, it.body)
    v(0.8em, weak: true)
  }
  show heading.where(level: 2): it => {
    v(1em, weak: true)
    text(size: 1.05em, it.body)
    v(0.6em, weak: true)
  }

  show raw: set text(font: font-mono, size: 0.92em)
  show link: set text(fill: rgb("#1a5490"))

  // Memo header block
  align(center, text(size: 1.4em, weight: "bold", font: font-heading, "Peer Review Memo"))
  v(0.2em)
  if confidential {
    align(center, text(size: 0.85em, weight: "semibold", fill: rgb("#8b0000"),
      tracking: 0.1em, "CONFIDENTIAL — FOR EDITORIAL USE ONLY"))
  }
  v(0.8em)
  line(length: 100%, stroke: 0.6pt)
  v(0.4em)

  let field(label, value) = {
    if value != none [
      #grid(
        columns: (auto, 1fr),
        column-gutter: 0.6em,
        row-gutter: 0.35em,
        text(weight: "semibold", font: font-heading, label + ":"),
        value,
      )
    ]
  }

  field("Manuscript", manuscript-title)
  field("Manuscript ID", manuscript-id)
  field("Journal", journal)
  field("Reviewer", reviewer)
  field("Date", _format-memo-date(date))
  field("Recommendation", if recommendation != none {
    text(weight: "semibold", recommendation)
  } else { none })

  v(0.4em)
  line(length: 100%, stroke: 0.6pt)
  v(1em)

  doc
}
