// Meeting Agenda — Typst template for committee/department meetings
// Inspired by the LaTeX `meetingmins` class.

#let _agenda-date-format = "[month repr:long] [day padding:none], [year]"

#let _format-agenda-date(d) = {
  if d == none or d == auto {
    return datetime.today().display(_agenda-date-format)
  }
  if type(d) == str {
    let m = d.match(regex("^(\d{4})-(\d{2})-(\d{2})$$"))
    if m != none {
      let (y, mo, day) = m.captures
      return datetime(year: int(y), month: int(mo), day: int(day))
        .display(_agenda-date-format)
    }
    return d
  }
  if type(d) == datetime {
    return d.display(_agenda-date-format)
  }
  d
}

#let meeting-agenda(
  committee: none,
  date: none,
  time: none,
  location: none,
  chair: none,                  // string, e.g. "Jane Doe"
  members: (),                  // array of strings (non-chair members)
  apologies: (),                // array of strings
  guests: (),                   // array of strings
  next-meeting: none,           // string, e.g. "May 15, 2026 at 2:00 PM"
  doc-kind: "Agenda",          // "Agenda" or "Minutes"
  font-body: "Libertinus Serif",
  font-heading: "Libertinus Sans",
  fontsize: 11pt,
  doc,
) = {
  set document(
    title: if committee != none { committee + " — " + doc-kind } else { doc-kind },
  )

  set page(paper: "us-letter", margin: (x: 1in, y: 1in))
  set text(font: font-body, size: fontsize, lang: "en")
  set par(leading: 0.65em, justify: false, spacing: 0.8em)

  show heading: set text(font: font-heading, weight: "semibold")
  show heading.where(level: 1): it => {
    v(1em, weak: true)
    grid(
      columns: (auto, 1fr, auto),
      column-gutter: 0.6em,
      text(size: 1.1em, weight: "semibold", it.body),
      align(horizon, line(length: 100%, stroke: 0.4pt + luma(70%))),
      [],
    )
    v(0.3em, weak: true)
  }
  show heading.where(level: 2): it => {
    v(0.6em, weak: true)
    text(size: 1em, weight: "semibold", style: "italic", it.body)
    v(0.2em, weak: true)
  }

  // Title block
  align(center)[
    #text(size: 1.5em, weight: "bold", font: font-heading, doc-kind)
    #if committee != none [
      #linebreak()
      #text(size: 1.1em, font: font-heading, committee)
    ]
  ]
  v(0.5em)

  // Meta row
  let meta-field(label, value) = {
    if value != none [
      #grid(
        columns: (auto, 1fr),
        column-gutter: 0.6em,
        text(weight: "semibold", font: font-heading, label + ":"),
        value,
      )
    ]
  }

  meta-field("Date", _format-agenda-date(date))
  meta-field("Time", time)
  meta-field("Location", location)

  v(0.4em)
  line(length: 100%, stroke: 0.5pt)
  v(0.4em)

  // Attendance
  if chair != none or members.len() > 0 or apologies.len() > 0 or guests.len() > 0 {
    grid(
      columns: (auto, 1fr),
      column-gutter: 0.6em,
      row-gutter: 0.3em,
      if chair != none { text(weight: "semibold", font: font-heading, "Chair:") } else { [] },
      if chair != none { chair } else { [] },
      if members.len() > 0 { text(weight: "semibold", font: font-heading, "Members:") } else { [] },
      if members.len() > 0 { members.join(", ") } else { [] },
      if apologies.len() > 0 { text(weight: "semibold", font: font-heading, "Apologies:") } else { [] },
      if apologies.len() > 0 { apologies.join(", ") } else { [] },
      if guests.len() > 0 { text(weight: "semibold", font: font-heading, "Guests:") } else { [] },
      if guests.len() > 0 { guests.join(", ") } else { [] },
    )
    v(0.4em)
    line(length: 100%, stroke: 0.5pt)
    v(0.8em)
  }

  // Body (agenda items)
  doc

  // Next meeting
  if next-meeting != none {
    v(1.5em)
    line(length: 100%, stroke: 0.5pt)
    v(0.4em)
    grid(
      columns: (auto, 1fr),
      column-gutter: 0.6em,
      text(weight: "semibold", font: font-heading, "Next meeting:"),
      next-meeting,
    )
  }
}
