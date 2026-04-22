// Memo — generic institutional memo template for Quarto + Typst
// All branding (logo, footer contact, signature) is driven by YAML.

#import "@preview/fontawesome:0.5.0": *

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

// Postscript helper — use in .qmd: ```{=typst} #ps[PS: Text] ```
#let ps(body) = {
  v(1em)
  text(size: 9pt, style: "italic", body)
}

#let memo(
  title: "MEMORANDUM",
  memo-to: none,
  memo-from: none,
  subject: none,
  date: none,

  // Sender (footer block)
  sender-name: none,
  sender-qualifications: none,
  sender-position: none,
  sender-department: none,
  sender-institution: none,
  sender-email: none,
  sender-phone: none,
  sender-website: none,

  // Department header block (centered, above the memo title)
  dept-header: none,             // e.g. "College of Liberal Arts and Communication"
  dept-subheader: none,          // e.g. "Department | Address | phone | fax"

  // Logos (optional file paths)
  logo-header: none,
  logo-header-height: 2cm,
  logo-footer: none,
  logo-footer-height: 0.6cm,

  // Signature options
  author-sig: false,
  signature: none,               // path to signature image
  signature-height: 1cm,
  cosig: false,
  cosig-name: none,
  cosig-title: none,

  // Typography
  font-body: "Libertinus Serif",
  font-heading: "Libertinus Sans",
  fontsize: 11pt,

  body,
) = {
  set document(title: if title != none { title } else { "Memo" })

  set page(
    paper: "us-letter",
    margin: (left: 1in, right: 1in, top: 1in, bottom: 2in),
    footer: [
      #set text(font: font-heading, size: 9pt, fill: rgb("#666666"))
      #if sender-name != none [
        #strong[
          #sender-name#if sender-qualifications != none [, #sender-qualifications]
        ] \
        #if sender-position != none [#sender-position \ ]
        #if sender-department != none [#sender-department \ ]
        #if sender-institution != none [#sender-institution] \
        #if sender-email != none [#fa-icon("envelope") #sender-email]
        #if sender-phone != none [ | #fa-icon("phone") #sender-phone]
        #if sender-website != none [ | #fa-icon("earth-americas") #sender-website]
      ]
    ],
  )

  // Footer logo (e.g., accreditation mark)
  if logo-footer != none {
    place(
      bottom + right,
      dx: 0.5cm,
      dy: 3.5cm,
      image(logo-footer, height: logo-footer-height),
    )
  }

  set text(font: font-body, size: fontsize)
  set par(leading: 0.78em, justify: false)
  show heading: set text(font: font-heading)

  // Header logo (centered at top)
  if logo-header != none {
    place(
      top + center,
      dy: -1.5cm,
      image(logo-header, height: logo-header-height),
    )
    v(2em)
  }

  // Department header block
  if dept-header != none or dept-subheader != none {
    set text(size: 10pt, font: font-heading)
    align(center)[
      #if dept-header != none [#strong[#dept-header] \ ]
      #if dept-subheader != none [#dept-subheader]
    ]
    v(1em)
  }

  // Memo title
  align(center, text(size: 18pt, weight: "bold", font: font-heading, title))
  v(1em)

  // Memo fields (To / From / Date / Re)
  set text(font: font-heading)
  grid(
    columns: (auto, 1fr),
    column-gutter: 1em,
    row-gutter: 0.8em,
    if memo-to != none { strong[To:] } else { [] },
    if memo-to != none { memo-to } else { [] },
    if memo-from != none { strong[From:] } else { [] },
    if memo-from != none { memo-from } else { [] },
    strong[Date:],
    _format-memo-date(date),
    if subject != none { strong[Re:] } else { [] },
    if subject != none { subject } else { [] },
  )

  v(1em)
  line(length: 100%, stroke: 2pt + black)
  v(1em)

  // Body
  set text(font: font-body)
  body

  v(3em)

  // Author signature block
  if author-sig and sender-name != none {
    grid(
      columns: (2fr, 1fr),
      column-gutter: 2em,
      [
        #if signature != none [
          #place(dx: 0pt, dy: -1cm)[
            #image(signature, height: signature-height)
          ]
        ]
        #line(length: 100%)
        #sender-name#if sender-position != none [, #sender-position]
      ],
      [
        #place(dx: 0pt, dy: -1em)[
          #datetime.today().display("[month]/[day]/[year]")
        ]
        #line(length: 100%)
        Date
      ],
    )
    v(2em)
  }

  // Co-signatory block
  if cosig {
    grid(
      columns: (2fr, 1fr),
      column-gutter: 2em,
      [
        #line(length: 100%)
        #cosig-name#if cosig-title != none and cosig-title != "" [, #cosig-title]
      ],
      [
        #line(length: 100%)
        Date
      ],
    )
    v(2em)
  }
}
