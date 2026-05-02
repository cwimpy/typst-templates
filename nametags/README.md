# nametags

Two print-ready deliverables for a conference, both generated from a single CSV: lanyard badges (4 × 3 in) and table tents (tabloid sheet, folds in half to 11 × 4.25 in).

## Files

**Shared data**
- `attendees.csv` — your data. Columns: `First`, `Last`, `Affil1` (department/title), `Affil2` (institution). Ships with four placeholder names; replace with your own.
- `iri.png`, `astate.png` — left and right footer logos. Drop in your own images and update the defaults in `nametag.typ` / `nametent.typ` if you rename them. If a logo file is missing the slot stays empty rather than failing.

**Badges** (4 × 3 in lanyard inserts)
- `nametags.qmd` — Quarto driver. Reads `attendees.csv`, calls the Typst template once per row.
- `nametag.typ` — badge layout. Conference name, year, accent color, and logo paths live as parameter defaults at the top of the function.

**Tents** (11 × 8.5 sheet, folds in half to 11 × 4.25)
- `nametents.qmd` — Quarto driver for the tents. Same CSV; uses name and Affil2 only.
- `nametent.typ` — tent layout. The top half of each page is rotated 180° so when folded along the center, both sides of the tent read upright. Name size is auto-selected based on character count to keep every name on one line.

## Quick start

```bash
# Scaffold a copy in a new folder
quarto use template cwimpy/typst-templates/nametags

# Render
quarto render nametags.qmd     # → nametags.pdf, one badge per page
quarto render nametents.qmd    # → nametents.pdf, one tent per page
```

For the tents: print on letter paper, fold in half along the horizontal center.

## Customizing

Both `nametag()` and `nametent()` accept these parameters (with defaults shown):

```
conference:    "Annual Research Symposium"
year:          "2026"
accent-color:  rgb("#0d3b66")    # dark blue
logo-left:     "iri.png"
logo-right:    "astate.png"
```

The cleanest way to change them for your event is to edit the defaults at the top of `nametag.typ` and `nametent.typ` once, then leave the per-attendee R loop alone.

Other useful single-source design knobs:

**Badges** (`nametag.typ`)
- Other colors: `ink`, `muted`, `faint` near the top
- Accent rule under name: search for `box(width: 56pt, height: 4pt`
- Logo height in footer: search for `height: 24pt`
- Page size: `set page(width: 4in, height: 3in, ...)`
- Spacing around the rule (the `#v(4pt)` and `#v(14pt)` values control optical balance)

**Tents** (`nametent.typ`)
- Name size: search for `name-size = if` — three sizes selected by character count
- Logo width: `width: 1.4in` (appears in both column definition and image call)
- Header bar height: `inset` on the header `block`
- Page size: tabloid (11 × 8.5) folding to 11 × 4.25; if you resize, change `set page(width: 11in, height: 8.5in, ...)` and the `rows: (4.25in, 4.25in)` values together

## Fonts

Both templates ask for **Industry Inc Test Base** (headings) and **Oriya MN** (body), with system fallbacks (Impact and Times New Roman) for machines that don't have them installed. Typst picks up system fonts automatically from `~/Library/Fonts` on macOS.
