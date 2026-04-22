// Review Response Memo — Typst template for Quarto
// Provides a #reviewer-comment() helper for quoting reviewers
// and a #response() helper for our replies.

#let _rr-date-format = "[month repr:long] [day padding:none], [year]"

#let _format-rr-date(d) = {
  if d == none or d == auto {
    return datetime.today().display(_rr-date-format)
  }
  if type(d) == str {
    let m = d.match(regex("^(\d{4})-(\d{2})-(\d{2})$$"))
    if m != none {
      let (y, mo, day) = m.captures
      return datetime(year: int(y), month: int(mo), day: int(day))
        .display(_rr-date-format)
    }
    return d
  }
  if type(d) == datetime {
    return d.display(_rr-date-format)
  }
  d
}

// Public helpers for use in the body
#let reviewer-comment(body) = block(
  fill: luma(240),
  stroke: (left: 3pt + rgb("#444")),
  inset: (x: 10pt, y: 8pt),
  radius: 2pt,
  width: 100%,
  spacing: 0.9em,
)[#set text(style: "italic"); #body]

#let response(body) = block(
  inset: (left: 10pt, y: 4pt),
  spacing: 0.9em,
  width: 100%,
)[#strong[Response:] #body]

#let review-response(
  manuscript-title: none,
  manuscript-id: none,
  journal: none,
  editor: none,
  authors: none,
  date: none,
  font-body: "Libertinus Serif",
  font-heading: "Libertinus Sans",
  fontsize: 11pt,
  doc,
) = {
  set document(
    title: "Response to Reviewers" + if manuscript-title != none { ": " + manuscript-title } else { "" },
  )

  set page(
    paper: "us-letter",
    margin: (x: 1in, y: 1in),
    header: context {
      if counter(page).get().first() > 1 [
        #set text(size: 9pt, fill: luma(40%))
        #grid(columns: (1fr, auto),
          [Response to Reviewers#if manuscript-id != none [ — #manuscript-id]],
          [#counter(page).display()]
        )
        #line(length: 100%, stroke: 0.3pt + luma(70%))
      ]
    },
  )

  set text(font: font-body, size: fontsize, lang: "en", hyphenate: false)
  set par(justify: true, leading: 0.65em, first-line-indent: 0em, spacing: 1em)

  show heading: set text(font: font-heading, weight: "semibold")
  show heading.where(level: 1): it => {
    v(1.2em, weak: true)
    text(size: 1.2em, it.body)
    v(0.3em, weak: true)
    line(length: 100%, stroke: 0.5pt + luma(60%))
    v(0.3em, weak: true)
  }
  show heading.where(level: 2): it => {
    v(1em, weak: true)
    text(size: 1.05em, it.body)
    v(0.2em, weak: true)
  }
  show heading.where(level: 3): it => {
    v(0.6em, weak: true)
    text(size: 1em, style: "italic", it.body)
    v(0.2em, weak: true)
  }

  show link: set text(fill: rgb("#1a5490"))

  align(center, text(size: 1.4em, weight: "bold", font: font-heading, "Response to Reviewers"))
  v(0.3em)
  if manuscript-title != none {
    align(center, text(size: 1.05em, style: "italic", manuscript-title))
    v(0.3em)
  }
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

  field("Manuscript ID", manuscript-id)
  field("Journal", journal)
  field("Editor", editor)
  field("Authors", authors)
  field("Date", _format-rr-date(date))

  v(0.4em)
  line(length: 100%, stroke: 0.6pt)
  v(1em)

  doc
}
