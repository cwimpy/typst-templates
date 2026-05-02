// nametag.typ — single 4x3in badge
// Called by the Quarto driver once per attendee.
//
// Edit the function defaults below to change the conference name, year,
// accent color, and logo files for the entire run. Per-attendee values
// (name, affiliation, subaffiliation) are passed in from the .qmd.

#let nametag(
  name: "",
  affiliation: "",
  subaffiliation: "",
  conference: "Annual Research Symposium",
  year: "2026",
  accent-color: rgb("#0d3b66"),
  logo-left: "iri.png",
  logo-right: "astate.png",
) = {
  // ---- Design tokens ----
  let ink = rgb("#000000")
  let muted = rgb("#555555")
  let faint = rgb("#777777")
  let hairline = rgb("#e5e5e5")

  // Font fallbacks let this render on machines that don't have the
  // licensed fonts installed (CI, collaborators, etc.)
  let heading-font = ("Industry Inc Test Base", "Industry Inc", "Industry", "Impact")
  let body-font = ("Oriya MN", "Oriya Sangam MN", "Times New Roman")

  // ---- Page = the badge itself ----
  set page(
    width: 4in,
    height: 3in,
    margin: 0pt,
    fill: white,
  )

  // ---- Outer frame: a 3-row grid (header / body / footer) ----
  // Using a grid with explicit row heights guarantees no overlap and
  // gives the body whatever space remains after header and footer.
  block(
    width: 100%,
    height: 100%,
    stroke: 0.5pt + hairline,
    radius: 6pt,
    clip: true,
    {
      grid(
        columns: 1,
        rows: (auto, 1fr, auto),

        // ---- Header bar ----
        block(
          width: 100%,
          fill: ink,
          inset: (x: 14pt, y: 9pt),
          grid(
            columns: (1fr, auto),
            align: (left + horizon, right + horizon),
            text(
              font: heading-font,
              size: 10pt,
              fill: white,
              tracking: 0.6pt,
              upper(conference),
            ),
            text(
              font: heading-font,
              size: 10pt,
              fill: accent-color,
              year,
            ),
          ),
        ),

        // ---- Body (fills remaining vertical space) ----
        block(
          width: 100%,
          height: 100%,
          inset: (x: 18pt, y: 14pt),
          // Vertically center the whole stack and use tuned v() spaces.
          // Optical balance: text bounding boxes include descender/ascender
          // space, so visible-ink gaps differ from bounding-box gaps.
          // The small space above the rule + larger space below it
          // produces visually equal whitespace around the rule.
          align(center + horizon)[
            #text(
              font: body-font,
              weight: "bold",
              size: 26pt,
              fill: ink,
            )[#name]
            #v(4pt)
            // The chunky accent rule
            #box(width: 56pt, height: 4pt, fill: accent-color)
            #v(14pt)
            #text(font: body-font, size: 13pt, fill: rgb("#333333"))[#affiliation]
            #if subaffiliation != "" [
              #v(3pt)
              #block(
                width: 90%,
                text(
                  font: body-font,
                  size: 11pt,
                  fill: faint,
                )[#subaffiliation],
              )
            ]
          ],
        ),

        // ---- Footer with logos ----
        block(
          width: 100%,
          stroke: (top: 0.5pt + hairline),
          inset: (x: 14pt, y: 6pt),
          grid(
            columns: (1fr, 1fr),
            align: (left + horizon, right + horizon),
            // Left logo
            if logo-left != none and logo-left != "" {
              image(logo-left, height: 24pt, fit: "contain")
            } else { [] },
            // Right logo
            if logo-right != none and logo-right != "" {
              image(logo-right, height: 24pt, fit: "contain")
            } else { [] },
          ),
        ),
      )
    },
  )
}
