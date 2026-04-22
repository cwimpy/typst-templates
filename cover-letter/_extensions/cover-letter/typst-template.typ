// Journal Cover Letter — Typst template for Quarto

#let _letter-date-format = "[month repr:long] [day padding:none], [year]"

#let _format-letter-date(d) = {
  if d == none or d == auto {
    return datetime.today().display(_letter-date-format)
  }
  if type(d) == str {
    let m = d.match(regex("^(\d{4})-(\d{2})-(\d{2})$$"))
    if m != none {
      let (y, mo, day) = m.captures
      return datetime(year: int(y), month: int(mo), day: int(day))
        .display(_letter-date-format)
    }
    return d
  }
  if type(d) == datetime {
    return d.display(_letter-date-format)
  }
  d
}

#let cover-letter(
  sender-name: none,
  sender-title: none,
  sender-affiliation: none,
  sender-address: none,
  sender-email: none,
  sender-phone: none,
  recipient-name: none,
  recipient-title: none,
  recipient-journal: none,
  recipient-address: none,
  salutation: none,
  manuscript-title: none,
  closing: "Sincerely,",
  date: none,
  font-body: "Libertinus Serif",
  font-heading: "Libertinus Sans",
  fontsize: 11pt,
  doc,
) = {
  set document(
    title: "Cover Letter",
  )

  set page(paper: "us-letter", margin: (x: 1in, y: 1in))
  set text(font: font-body, size: fontsize, lang: "en", hyphenate: false)
  set par(justify: true, leading: 0.65em, first-line-indent: 0em, spacing: 1em)

  show link: set text(fill: rgb("#1a5490"))

  // Sender block (letterhead-style)
  if sender-name != none {
    align(right)[
      #text(weight: "semibold", font: font-heading, size: 1.05em, sender-name)
      #if sender-title != none [\ #sender-title]
      #if sender-affiliation != none [\ #sender-affiliation]
      #if sender-address != none [\ #sender-address]
      #if sender-email != none [\ #sender-email]
      #if sender-phone != none [\ #sender-phone]
    ]
    v(1em)
  }

  // Date
  _format-letter-date(date)
  v(1.5em)

  // Recipient block
  if recipient-name != none or recipient-journal != none {
    if recipient-name != none [#recipient-name \ ]
    if recipient-title != none [#recipient-title \ ]
    if recipient-journal != none [#emph(recipient-journal) \ ]
    if recipient-address != none [#recipient-address]
    v(1em)
  }

  // Salutation
  if salutation != none {
    salutation + [:]
    v(0.5em)
  } else if recipient-name != none {
    [Dear ] + recipient-name + [:]
    v(0.5em)
  }

  // Body
  doc

  // Closing
  v(1em)
  closing
  v(3em)
  if sender-name != none [#sender-name]
}
