// Sign-in Sheet — Typst template for Quarto
// Use #signatures(...) in raw Typst blocks to generate blank signature tables.

#let _sis-date-format = "[month repr:long] [day padding:none], [year]"

#let _format-sis-date(d) = {
  if d == none or d == auto {
    return datetime.today().display(_sis-date-format)
  }
  if type(d) == str {
    let m = d.match(regex("^(\d{4})-(\d{2})-(\d{2})$$"))
    if m != none {
      let (y, mo, day) = m.captures
      return datetime(year: int(y), month: int(mo), day: int(day))
        .display(_sis-date-format)
    }
    return d
  }
  if type(d) == datetime {
    return d.display(_sis-date-format)
  }
  d
}

// Public helper: generate a signature table.
// Usage from the .qmd:
//   ```{=typst}
//   #signatures(
//     "Department of Biology",
//     "Department of Chemistry",
//   )
//   ```
// Each argument becomes one row with a blank printed-name column and a
// blank signature column.
#let signatures(..positions) = {
  let rows = positions.pos()
  if rows.len() == 0 { return }
  table(
    columns: (1fr, 1.3fr, 1.5fr),
    align: (left + horizon, left + horizon, left + horizon),
    inset: (x: 8pt, y: 10pt),
    stroke: 0.5pt + luma(80%),
    table.header(
      text(weight: "semibold", "Department / Position"),
      text(weight: "semibold", "Print Name"),
      text(weight: "semibold", "Signature"),
    ),
    ..rows.map(pos => (pos, [], [])).flatten(),
  )
  v(0.6em)
}

#let sign-in-sheet(
  title: "Sign-in Sheet",
  meeting-date: none,
  meeting-time: none,
  meeting-location: none,
  font-body: "Libertinus Serif",
  font-heading: "Libertinus Sans",
  fontsize: 10pt,
  doc,
) = {
  set document(title: title)

  set page(
    paper: "us-letter",
    margin: (x: 0.75in, y: 0.75in),
    header: context {
      if counter(page).get().first() > 1 [
        #set text(size: 9pt, fill: luma(40%))
        #grid(columns: (1fr, auto), title, [page #counter(page).display()])
        #line(length: 100%, stroke: 0.3pt + luma(70%))
      ]
    },
  )

  set text(font: font-body, size: fontsize, lang: "en")
  set par(leading: 0.65em, justify: false)

  show heading: set text(font: font-heading, weight: "semibold")
  show heading.where(level: 1): it => {
    v(0.8em, weak: true)
    text(size: 1.15em, fill: luma(30%), it.body)
    v(0.2em, weak: true)
    line(length: 100%, stroke: 0.4pt + luma(60%))
    v(0.2em, weak: true)
  }
  show heading.where(level: 2): it => {
    v(0.6em, weak: true)
    text(size: 1.05em, weight: "semibold", it.body)
    v(0.15em, weak: true)
  }

  // Title
  align(center, text(size: 1.5em, weight: "bold", font: font-heading, title))
  v(0.3em)

  // Meeting meta
  if meeting-date != none or meeting-time != none or meeting-location != none {
    align(center)[
      #if meeting-date != none [#strong[Date:] #_format-sis-date(meeting-date)]
      #if meeting-time != none [ #h(1em) #strong[Time:] #meeting-time]
      #if meeting-location != none [
        #linebreak()
        #strong[Location:] #meeting-location
      ]
    ]
    v(0.3em)
  }

  line(length: 100%, stroke: 0.8pt)
  v(0.6em)

  // Body (grouped sign-in tables)
  doc
}
