// Report — formal project / grant / institutional report template
// Cover page, running header+footer, accent-color block headings, and
// a #callout() helper for highlighted notes.

#let _report-date-format = "[month repr:long] [day padding:none], [year]"

#let _format-report-date(d) = {
  if d == none or d == auto {
    return datetime.today().display(_report-date-format)
  }
  if type(d) == str {
    let m = d.match(regex("^(\d{4})-(\d{2})-(\d{2})$$"))
    if m != none {
      let (y, mo, day) = m.captures
      return datetime(year: int(y), month: int(mo), day: int(day))
        .display(_report-date-format)
    }
    return d
  }
  if type(d) == datetime {
    return d.display(_report-date-format)
  }
  d
}

// Public callout helper — use via raw Typst block:
//   ```{=typst}
//   #callout(type: "important", title: "Heads up")[
//     Body text.
//   ]
//   ```
#let callout(type: "note", title: "", accent: rgb("#cc092f"), body) = {
  let colors = (
    note:      (border: rgb("#1a5490"), bg: rgb("#1a5490").lighten(90%)),
    tip:       (border: rgb("#2d7a4a"), bg: rgb("#2d7a4a").lighten(90%)),
    important: (border: accent,          bg: accent.lighten(90%)),
    warning:   (border: rgb("#c27200"),  bg: rgb("#c27200").lighten(90%)),
  )
  let c = colors.at(type, default: colors.note)

  block(
    width: 100%,
    fill: c.bg,
    stroke: (left: 4pt + c.border, rest: 0.5pt + c.border),
    inset: 14pt,
    radius: 3pt,
    breakable: false,
    [
      #if title != "" [
        #text(weight: "bold", size: 11pt, fill: c.border)[#title]
        #v(0.3em)
      ]
      #body
    ],
  )
}

#let report(
  title: none,
  subtitle: none,
  author: none,
  author-affiliation: none,      // e.g. "Director, Institute for …"
  author-email: none,
  institution: none,             // e.g. "Your University"
  date: none,
  logo: none,                    // path to cover-page logo (optional)
  logo-width: 2in,
  running-title: none,           // short title for running header; defaults to title
  running-footer: none,          // free text for running footer

  // Colors
  accent-color: rgb("#cc092f"),
  accent-bg: auto,               // defaults to accent-color.lighten(80%)

  // Typography
  font-body: "Libertinus Serif",
  font-heading: "Libertinus Sans",
  fontsize: 11pt,

  body,
) = {
  set document(title: if type(title) == str { title } else { "Report" })

  let light-bg = if accent-bg == auto { accent-color.lighten(80%) } else { accent-bg }
  let head-short = if running-title != none { running-title } else { title }

  set page(
    paper: "us-letter",
    margin: (left: 1in, right: 1in, top: 1in, bottom: 1in),
    header: context {
      if counter(page).get().first() > 1 [
        #set text(9pt, fill: gray)
        #smallcaps(head-short)
        #h(1fr)
        #counter(page).display("1")
      ]
    },
    footer: context {
      if counter(page).get().first() > 1 and running-footer != none [
        #set text(8pt, fill: gray)
        #line(length: 100%, stroke: 0.5pt + gray)
        #v(-8pt)
        #h(1fr)
        #running-footer
      ]
    },
  )

  set text(font: font-body, size: fontsize, lang: "en")
  set par(justify: true, leading: 0.65em)

  // Block-style H1 with accent bg
  show heading.where(level: 1): it => {
    v(1.5em)
    block(
      width: 100%,
      fill: light-bg,
      inset: 12pt,
      radius: 2pt,
      text(font: font-heading, size: 16pt, weight: "bold", fill: accent-color, it.body),
    )
    v(0.8em)
  }
  show heading.where(level: 2): it => {
    v(1em)
    text(font: font-heading, size: 13pt, weight: "bold", fill: accent-color, it.body)
    v(0.5em)
  }
  show heading.where(level: 3): it => {
    v(0.8em)
    text(font: font-heading, size: 12pt, weight: "semibold", style: "italic", it.body)
    v(0.4em)
  }

  show link: set text(fill: accent-color)

  // Cover page
  align(center)[
    #v(0.8in)
    #if logo != none [
      #image(logo, width: logo-width)
      #v(0.8in)
    ]
    #if title != none [
      #block(
        width: 85%,
        text(font: font-heading, size: 20pt, weight: "bold", fill: accent-color, title),
      )
    ]
    #if subtitle != none [
      #v(0.3in)
      #block(
        width: 80%,
        text(font: font-body, size: 14pt, fill: black.lighten(20%), subtitle),
      )
    ]
    #v(0.6in)
    #line(length: 60%, stroke: 1pt + accent-color)
    #v(0.5in)
    #if author != none [
      #text(font: font-heading, size: 14pt, weight: "semibold", author)
    ]
    #if author-email != none [
      #v(0.15em)
      #text(size: 10pt, fill: accent-color, link("mailto:" + author-email))
    ]
    #if author-affiliation != none [
      #v(0.1em)
      #text(size: 12pt, author-affiliation)
    ]
    #if institution != none [
      #linebreak()
      #text(size: 12pt, institution)
    ]
    #v(0.5in)
    #text(size: 11pt, fill: black.lighten(30%), _format-report-date(date))
  ]

  pagebreak()

  body
}
