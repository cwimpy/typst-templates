// Conference Poster — A0 landscape
// Single-file Typst template rendered via Quarto.
//
// Default palette: deep navy primary, cream paper, terracotta accent,
// warm gold secondary. Override via YAML (accent-color, primary-color,
// paper-color) or edit the palette block below.
//
// All sizing is in mm so the poster prints at 1:1 scale.

#let default-palette = (
  ink:      rgb("#1a1a1a"),
  paper:    rgb("#fbfaf6"),
  primary:  rgb("#1e3a5f"),   // deep navy
  accent:   rgb("#c17754"),   // terracotta
  wheat:    rgb("#d4a843"),   // warm gold
  muted:    rgb("#6b6b6b"),
  rule:     rgb("#d9d2c2"),   // hairline on cream
  callout-bg: rgb("#f1e4d8"),
)

#let body-font = "Source Sans 3"
#let head-font = "IBM Plex Sans"
#let mono-font = "IBM Plex Mono"
#let serif-font = ("Source Serif 4", "Source Serif Pro", "Libertinus Serif", "New Computer Modern")

// ---------- Public helpers (use inside the .qmd) ----------

#let rule-line(color: auto, thick: 1pt) = {
  let c = if color == auto { default-palette.rule } else { color }
  line(length: 100%, stroke: thick + c)
}

#let section-title(body, color: auto) = {
  let c = if color == auto { default-palette.primary } else { color }
  block(below: 8mm, above: 3mm)[
    #text(font: head-font, weight: "bold", size: 34pt, fill: c)[#body]
    #v(-2mm)
    #line(length: 60mm, stroke: 3pt + default-palette.accent)
  ]
}

#let callout(body, color: auto, fill: auto) = {
  let c = if color == auto { default-palette.accent } else { color }
  let f = if fill == auto { default-palette.callout-bg } else { fill }
  block(
    fill: f,
    inset: 12mm,
    radius: 3mm,
    stroke: (left: 6pt + c),
    width: 100%,
  )[#body]
}

#let stat-card(value, label, color: auto) = {
  let c = if color == auto { default-palette.primary } else { color }
  block(
    fill: default-palette.paper,
    inset: 8mm,
    radius: 3mm,
    stroke: 1.5pt + default-palette.rule,
    width: 100%,
  )[
    #set align(center)
    #text(font: head-font, weight: "bold", size: 54pt, fill: c)[#value]
    #v(-4mm)
    #text(font: body-font, size: 18pt, fill: default-palette.muted)[#label]
  ]
}

// Numbered "chip" for enumerated items (e.g., dimensions, steps)
#let dim-chip(num, title, body) = block(
  fill: default-palette.paper,
  inset: 7mm,
  radius: 3mm,
  stroke: 1.5pt + default-palette.rule,
  width: 100%,
  below: 5mm,
)[
  #grid(
    columns: (22mm, 1fr),
    gutter: 6mm,
    block(
      fill: default-palette.primary,
      inset: 4mm,
      radius: 3mm,
      width: 20mm,
      height: 20mm,
    )[
      #set align(center + horizon)
      #text(font: head-font, weight: "bold", size: 22pt, fill: default-palette.paper)[#num]
    ],
    [
      #text(font: head-font, weight: "bold", size: 20pt, fill: default-palette.ink)[#title] \
      #text(font: body-font, size: 17pt, fill: default-palette.muted)[#body]
    ],
  )
]

// Hero-line pull quote (big italic block at top of body, optional)
#let hero(body) = block(
  width: 100%,
  inset: (x: 24mm, y: 12mm),
  fill: default-palette.callout-bg,
  radius: 3mm,
  stroke: (left: 8pt + default-palette.accent),
)[
  #set text(font: serif-font, style: "italic", size: 40pt, fill: default-palette.primary)
  #set par(leading: 0.58em)
  #body
]

// Expose the palette so users can pull colors in their body (e.g. accents on bolded phrases)
#let palette = default-palette

// ---------- page template ----------

#let poster(
  title: "Poster Title",
  subtitle: none,
  authors: (),
  orcid: none,
  affiliation: "",
  venue: "",
  date: "",
  hero-line: none,
  footer-contact: none,            // e.g. "jane.doe@example.edu  ·  orcid.org/0000-0000-0000-0000"
  footer-affiliation: none,        // e.g. "Example Institute  ·  Example University"
  footer-resources: none,          // e.g. "R package: mypkg on CRAN  ·  github.com/jdoe/mypkg"
  logo-left: none,                 // path to a left-side footer logo (optional)
  logo-right: none,                // path to a right-side footer logo (optional)
  logo-height: 18mm,
  body,
) = {
  set document(title: title)
  set page(
    paper: "a0",
    flipped: true,
    margin: (x: 25mm, top: 18mm, bottom: 15mm),
    fill: default-palette.paper,
  )
  set text(font: body-font, size: 22pt, fill: default-palette.ink)
  set par(justify: true, leading: 0.7em)

  // ---------- Title banner ----------
  block(
    fill: default-palette.primary,
    inset: (x: 28mm, y: 14mm),
    width: 100%,
    radius: 3mm,
  )[
    #set text(fill: default-palette.paper)
    #grid(
      columns: (1fr, auto),
      gutter: 20mm,
      align: horizon,
      [
        #text(font: head-font, weight: "bold", size: 96pt)[#title]
        #if subtitle != none [
          #v(-8mm)
          #text(font: head-font, size: 46pt, fill: default-palette.wheat)[#subtitle]
        ]
        #v(-3mm)
        #text(font: body-font, weight: "semibold", size: 38pt)[
          #authors.map(a => a).join("  \u{2022}  ")
        ]
        #if orcid != none [
          #h(6mm)
          #text(font: mono-font, size: 20pt, fill: default-palette.wheat, tracking: 0.12em)[
            ORCID #orcid
          ]
        ]
        \
        #text(font: body-font, size: 24pt, fill: default-palette.wheat)[#affiliation]
      ],
      align(right)[
        #if venue != "" [#text(font: head-font, weight: "bold", size: 32pt, fill: default-palette.wheat)[#venue] \ ]
        #v(2mm)
        #if date != "" [#text(font: body-font, size: 24pt)[#date]]
      ],
    )
  ]

  // ---------- Optional hero pull quote ----------
  if hero-line != none {
    v(6mm)
    hero(hero-line)
  }

  v(6mm)

  // ---------- Body (user-supplied columns / helpers) ----------
  body

  // ---------- Footer ----------
  v(1fr)
  rule-line(color: default-palette.primary, thick: 1.5pt)
  v(3mm)
  grid(
    columns: (auto, 1fr, 1fr, 1fr, auto),
    gutter: 12mm,
    align: horizon,
    // Far left: logo
    if logo-left != none { image(logo-left, height: logo-height) } else { [] },
    // Resources (package, repo, website)
    if footer-resources != none {
      text(size: 15pt, fill: default-palette.muted, footer-resources)
    } else { [] },
    // Contact
    if footer-contact != none {
      align(center, text(size: 15pt, fill: default-palette.muted, footer-contact))
    } else { [] },
    // Affiliation
    if footer-affiliation != none {
      align(right, text(size: 15pt, fill: default-palette.muted, footer-affiliation))
    } else { [] },
    // Far right: logo
    if logo-right != none { image(logo-right, height: logo-height) } else { [] },
  )
}
