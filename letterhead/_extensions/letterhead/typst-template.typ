// Letterhead — generic institutional letter template for Quarto + Typst
// Author, institution, logo, and footer are all configured via YAML.

#import "@preview/fontawesome:0.5.0": *

// Date formatting helper: "YYYY-MM-DD" -> "Month DD, YYYY"; free text passes; omit -> today
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

#let letterhead(
  // Sender (used in footer and optionally in signature block)
  sender-name: none,
  sender-qualifications: none,   // e.g. "PhD" — appended after name
  sender-position: none,         // e.g. "Associate Professor"
  sender-department: none,       // e.g. "Department of History"
  sender-institution: none,      // e.g. "Your University"
  sender-address: none,          // e.g. "PO Box 1234, City, ST 00000"
  sender-email: none,
  sender-phone: none,
  sender-website: none,

  // Logos (optional — set to a path string, or omit to skip)
  logo-header: none,             // top, centered — e.g. department mark
  logo-header-height: 2.5cm,
  logo-footer: none,             // bottom right — e.g. accreditation mark
  logo-footer-height: 0.6cm,

  // Recipient + letter content
  date: none,
  recipient: none,               // array of lines, e.g. ("Dr. Jane Smith", "University", "Address")
  opening: none,                 // e.g. "Dear Dr. Smith,"
  closing: "Sincerely,",
  signature: none,               // path to signature image (optional)
  signature-height: 1.5cm,
  bold-title: none,              // optional bold title line above the date
  sub-header: none,              // optional centered text line below logo (e.g. college name)

  // Bottom elements
  encl: none,
  cc: none,
  ps: none,

  // Typography
  font-body: "Libertinus Serif",
  font-heading: "Libertinus Sans",
  fontsize: 11pt,

  doc,
) = {
  set document(title: "Letter")

  set page(
    paper: "us-letter",
    margin: (left: 1in, right: 1in, top: 1in, bottom: 2in),
    footer: context {
      if counter(page).get().first() == 1 and sender-name != none [
        #set text(font: font-heading, size: 9pt, fill: rgb("#666666"))
        #strong[
          #sender-name#if sender-qualifications != none [, #sender-qualifications]
        ] \
        #if sender-position != none [#sender-position \ ]
        #if sender-department != none [#sender-department \ ]
        #if sender-institution != none [#sender-institution]
        #if sender-address != none [ | #sender-address] \
        #if sender-email != none [#fa-icon("envelope") #sender-email]
        #if sender-phone != none [ | #fa-icon("phone") #sender-phone]
        #if sender-website != none [ | #fa-icon("earth-americas") #sender-website]
      ]
    },
  )

  set text(font: font-body, size: fontsize, lang: "en")
  set par(leading: 0.78em, justify: false)
  show heading: set text(font: font-heading)

  // Top-right footer logo on page 1
  if logo-footer != none {
    place(
      bottom + right,
      dx: 0.5cm,
      dy: 3.5cm,
      context {
        if counter(page).get().first() == 1 {
          image(logo-footer, height: logo-footer-height)
        }
      },
    )
  }

  // Top-center header logo on page 1
  if logo-header != none {
    place(
      top + center,
      dy: -1.5cm,
      image(logo-header, height: logo-header-height),
    )
    v(3em)
  }

  // Sub-header (e.g., college name line)
  if sub-header != none {
    align(center, text(font: font-heading, size: 10pt, sub-header))
    v(0.5em)
  }

  // Optional bold title above date
  if bold-title != none {
    v(0.5em)
    align(center, text(size: 12pt, weight: "bold", font: font-heading, bold-title))
    v(1em)
  }

  // Date
  _format-letter-date(date)
  v(1em)

  // Recipient address block
  if recipient != none {
    if type(recipient) == array {
      for line in recipient [#line \ ]
    } else {
      recipient
    }
    v(1em)
  }

  // Opening salutation
  if opening != none {
    opening
    v(1em)
  }

  // Body content
  doc

  // Closing + signature
  v(1em)
  closing
  if signature != none {
    v(0.5em)
    image(signature, height: signature-height)
  } else {
    v(3em)
  }

  // Name (and position) under the signature line
  if sender-name != none {
    strong[
      #sender-name#if sender-qualifications != none [, #sender-qualifications]
    ]
    if sender-position != none [
      #linebreak()
      #sender-position
    ]
  }

  // Bottom elements — keep clear of the footer
  v(3cm)

  if encl != none [ #strong[Encl:] #encl #v(0.5em) ]
  if cc != none [ #strong[cc:] #cc #v(0.5em) ]
  if ps != none [ #strong[PS:] #ps ]
}
