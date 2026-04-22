// Policy Brief — a short, skim-friendly brief for policy audiences.
// Top colored banner with series info, bold title, key-findings box,
// accent-colored section headings, pull-quote helper, recommendations
// block, and a footer with citation + contact.

#let _pb-date-format = "[month repr:long] [year]"

#let _format-pb-date(d) = {
  if d == none or d == auto {
    return datetime.today().display(_pb-date-format)
  }
  if type(d) == str {
    let m = d.match(regex("^(\d{4})-(\d{2})-(\d{2})$$"))
    if m != none {
      let (y, mo, day) = m.captures
      return datetime(year: int(y), month: int(mo), day: int(day))
        .display(_pb-date-format)
    }
    return d
  }
  if type(d) == datetime {
    return d.display(_pb-date-format)
  }
  d
}

// Public pull-quote helper for use in raw Typst blocks.
// Usage: ```{=typst} #pullquote[Sidebar-worthy sentence.] ```
#let pullquote(body, accent: rgb("#1a5490")) = {
  block(
    width: 100%,
    inset: (left: 14pt, right: 6pt, y: 10pt),
    stroke: (left: 3pt + accent),
    breakable: false,
  )[
    #set text(size: 1.1em, style: "italic", fill: black.lighten(10%))
    #body
  ]
}

// Public recommendations helper.
// Usage: ```{=typst}
//   #recommendations[
//     - First recommendation
//     - Second recommendation
//   ]
// ```
#let recommendations(body, accent: rgb("#1a5490"), title: "Recommendations") = {
  v(0.6em)
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (top: 2pt + accent),
    inset: 14pt,
    breakable: false,
  )[
    #text(weight: "bold", size: 1.15em, fill: accent, title)
    #v(0.4em)
    #body
  ]
}

#let policy-brief(
  // Banner (top ribbon)
  series: none,                  // e.g. "Rural Elections Initiative"
  issue: none,                   // e.g. "Brief No. 4"
  date: none,

  // Title block
  title: none,
  subtitle: none,
  brief-author: none,
  brief-affiliation: none,

  // Key findings (bullet list shown under the title)
  key-findings: (),              // array of strings

  // Footer
  cite-as: none,                 // free-form citation string
  contact: none,                 // contact line for footer

  // Styling
  accent-color: rgb("#1a5490"),
  font-body: "Libertinus Serif",
  font-heading: "Libertinus Sans",
  fontsize: 10.5pt,

  body,
) = {
  set document(title: if type(title) == str { title } else { "Policy Brief" })

  set page(
    paper: "us-letter",
    margin: (left: 0.9in, right: 0.9in, top: 0.6in, bottom: 0.9in),
    header: context {
      if counter(page).get().first() > 1 [
        #set text(size: 9pt, fill: luma(40%))
        #if series != none [#series]
        #h(1fr)
        #if issue != none [#issue — ]
        #counter(page).display()
        #v(-4pt)
        #line(length: 100%, stroke: 0.4pt + accent-color)
      ]
    },
    footer: {
      if cite-as != none or contact != none {
        line(length: 100%, stroke: 0.4pt + luma(70%))
        v(-4pt)
        set text(size: 8.5pt, fill: luma(35%))
        if cite-as != none [*Cite as:* #cite-as #linebreak()]
        if contact != none [#contact]
      }
    },
  )

  set text(font: font-body, size: fontsize, lang: "en")
  set par(justify: true, leading: 0.62em)

  show heading: set text(font: font-heading)
  show heading.where(level: 1): it => {
    v(0.9em, weak: true)
    text(size: 1.2em, weight: "bold", fill: accent-color, it.body)
    v(0.1em)
    line(length: 100%, stroke: 0.6pt + accent-color)
    v(0.3em, weak: true)
  }
  show heading.where(level: 2): it => {
    v(0.7em, weak: true)
    text(size: 1.05em, weight: "semibold", fill: accent-color, it.body)
    v(0.2em, weak: true)
  }

  show link: set text(fill: accent-color)

  // Top banner ribbon
  if series != none or issue != none or date != none {
    block(
      width: 100%,
      fill: accent-color,
      inset: (x: 14pt, y: 8pt),
    )[
      #set text(fill: white, font: font-heading, size: 9pt, tracking: 0.08em)
      #upper(if series != none { series } else { "" })
      #h(1fr)
      #if issue != none [#issue ]
      #if issue != none and date != none [ · ]
      #if date != none [#_format-pb-date(date)]
    ]
    v(0.5em)
  }

  // Title and subtitle
  if title != none {
    text(font: font-heading, size: 22pt, weight: "bold", fill: black, title)
  }
  if subtitle != none {
    v(0.2em)
    text(font: font-heading, size: 14pt, weight: "regular", fill: luma(35%), subtitle)
  }
  v(0.3em)

  // Author line
  if brief-author != none or brief-affiliation != none {
    text(size: 10pt, fill: luma(30%))[
      #if brief-author != none [*#brief-author*]
      #if brief-author != none and brief-affiliation != none [ · ]
      #if brief-affiliation != none [#brief-affiliation]
    ]
    v(0.4em)
  }

  line(length: 100%, stroke: 0.4pt + luma(70%))
  v(0.6em)

  // Key findings box
  if key-findings.len() > 0 {
    block(
      width: 100%,
      fill: accent-color.lighten(92%),
      stroke: (left: 4pt + accent-color),
      inset: (x: 14pt, y: 12pt),
      breakable: false,
    )[
      #text(font: font-heading, size: 11pt, weight: "bold", fill: accent-color, tracking: 0.05em)[
        #upper[Key Findings]
      ]
      #v(0.4em)
      #set text(size: 10.5pt)
      #set par(leading: 0.6em)
      #for finding in key-findings [
        · #finding \
      ]
    ]
    v(0.8em)
  }

  // Main body
  body
}
