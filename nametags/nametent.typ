// nametent.typ — table tent
// Tabloid sheet (11 x 8.5) folded in half along the horizontal center
// becomes an 11 x 4.25 tent — wide and low-profile.
//
// Layout:
//   TOP HALF    : back side, ROTATED 180° (so it reads upright to the
//                 person across the table when the sheet is folded)
//   FOLD LINE   : center horizontal of the page
//   BOTTOM HALF : front side, normal orientation (reads upright to
//                 the person whose tent it is)
//
// Edit the function defaults below to change the conference name, year,
// accent color, and logo files for the entire run.

#let nametent(
  name: "",
  affiliation: "",
  conference: "Annual Research Symposium",
  year: "2026",
  accent-color: rgb("#0d3b66"),
  logo-left: "iri.png",
  logo-right: "astate.png",
) = {
  // ---- Design tokens ----
  let ink = rgb("#000000")
  let hairline = rgb("#e5e5e5")
  let heading-font = ("Industry Inc Test Base", "Industry Inc", "Industry", "Impact")
  let body-font = ("Oriya MN", "Oriya Sangam MN", "Times New Roman")

  // Pick a name size that keeps the longest name on one line.
  // The center column is roughly 7.5in wide after logos and gutters.
  // Heuristic: shrink for longer names so they don't wrap.
  let name-size = if name.len() > 16 {
    52pt
  } else if name.len() > 12 {
    60pt
  } else {
    68pt
  }

  // ---- Reusable single-panel layout ----
  // Renders one 11 x 4.25 panel: header bar on top, then a body row with
  // logo | NAME | logo.
  let panel = block(
    width: 11in,
    height: 4.25in,
    fill: white,
    grid(
      columns: 1,
      rows: (auto, 1fr),
      row-gutter: 0pt,

      // Header bar (matches the badge for visual continuity)
      block(
        width: 100%,
        fill: ink,
        inset: (x: 28pt, y: 9pt),
        grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          text(
            font: heading-font,
            size: 11pt,
            fill: white,
            tracking: 0.7pt,
            upper(conference),
          ),
          text(
            font: heading-font,
            size: 11pt,
            fill: accent-color,
            year,
          ),
        ),
      ),

      // Body — three columns: left logo | name | right logo
      block(
        width: 100%,
        height: 100%,
        inset: (x: 32pt, y: 18pt),
        grid(
          columns: (1.4in, 1fr, 1.4in),
          column-gutter: 20pt,
          align: (left + horizon, center + horizon, right + horizon),

          // Left logo
          if logo-left != none and logo-left != "" {
            image(logo-left, width: 1.4in, fit: "contain")
          } else { [] },

          // Center: name + accent rule + affiliation
          align(center + horizon)[
            #text(
              font: body-font,
              weight: "bold",
              size: name-size,
              fill: ink,
            )[#name]
            #v(10pt)
            #box(width: 96pt, height: 5pt, fill: accent-color)
            #if affiliation != "" [
              #v(12pt)
              #text(
                font: body-font,
                size: 22pt,
                fill: rgb("#333333"),
              )[#affiliation]
            ]
          ],

          // Right logo
          if logo-right != none and logo-right != "" {
            image(logo-right, width: 1.4in, fit: "contain")
          } else { [] },
        ),
      ),
    ),
  )

  // ---- Page setup: tabloid, landscape ----
  // 11 x 8.5 (tabloid landscape) folds in half to 11 x 4.25.
  set page(
    width: 11in,
    height: 8.5in,
    margin: 0pt,
    fill: white,
  )

  // Compose the sheet using a grid with exact row heights.
  // rotate(180deg, reflow: true) flips the back panel so it reads upright
  // from the opposite side of the table after folding.
  grid(
    columns: 1,
    rows: (4.25in, 4.25in),
    row-gutter: 0pt,
    rotate(180deg, reflow: true, panel),
    panel,
  )
}
