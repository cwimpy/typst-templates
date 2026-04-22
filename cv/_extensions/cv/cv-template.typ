// cv-template.typ
// A simplified, well-commented CV template for Quarto + Typst.
// Place content in the .qmd; styling lives here.

#import "@preview/fontawesome:0.5.0": *
#import "@preview/use-academicons:0.1.0": *

//------------------------------------------------------------------------------
// Colors
//------------------------------------------------------------------------------

#let color-dark = rgb("#222222")
#let color-gray = rgb("#5d5d5d")
#let color-light = rgb("#999999")
#let color-accent = rgb("#333333")

//------------------------------------------------------------------------------
// Fonts
// Uses widely-available fallbacks so it renders out of the box on any machine.
// Override with YAML: mainfont: "Your Font"
//------------------------------------------------------------------------------

#let font-header = ("Helvetica Neue", "Helvetica", "Arial")
#let font-text = ("Helvetica Neue", "Helvetica", "Arial")

//------------------------------------------------------------------------------
// Layout helpers
//------------------------------------------------------------------------------

// Side-by-side row (left content, right content)
#let _row(left-body, right-body) = block[
  #box(width: 4fr)[#left-body]
  #box(width: 1fr)[#align(right)[#right-body]]
]

// Primary entry header: bold title on left, dates/location on right
#let justified-header(primary, secondary) = {
  _row(
    text(weight: "bold", fill: color-dark, size: 12pt)[#primary],
    text(fill: color-gray, size: 11pt)[#secondary],
  )
}

// Secondary line under an entry (e.g. subtitle + secondary dates)
#let secondary-justified-header(primary, secondary) = {
  _row(
    text(fill: color-gray, style: "italic", size: 11pt)[#primary],
    text(fill: color-gray, size: 10pt)[#secondary],
  )
}

//------------------------------------------------------------------------------
// Public entry helpers
// Use these from raw Typst blocks in the .qmd
//------------------------------------------------------------------------------

// Section heading (also rendered automatically for level-1 markdown headings)
#let section(title) = {
  set block(above: 1.5em, below: 1em)
  set text(size: 16pt, weight: "regular")
  stack(
    spacing: 0.3em,
    text(color-accent, weight: "bold")[#title],
    line(length: 100%),
  )
}

// Employment / Education / Fellowship entry
// Usage: #cv-entry(title: "...", organization: "...", location: "...", dates: "...")
#let cv-entry(
  title: "",
  organization: "",
  location: "",
  dates: "",
  description: "",
  details: (),
) = {
  justified-header(title, location)
  secondary-justified-header(
    if organization != "" { organization } else { description },
    dates,
  )
  if description != "" and organization != "" {
    v(0.2em)
    pad(left: 1em, text(size: 11pt, fill: color-gray)[- #description])
  }
  if details.len() > 0 {
    v(0.3em)
    pad(left: 1em)[
      #set text(size: 11pt, fill: color-dark)
      #set par(leading: 0.65em)
      #for detail in details [- #detail \ ]
    ]
  }
  v(0.5em)
}

// Manual publication entry (use this OR Quarto's native bibliography)
// Usage: #pub-entry(authors: "...", title: "...", venue: "...", year: "2025", doi: "...")
#let pub-entry(
  authors: "",
  title: "",
  venue: "",
  year: "",
  doi: "",
  url: "",
  note: "",
) = {
  set text(size: 10pt, fill: color-dark)
  set par(hanging-indent: 1em, leading: 0.55em)

  if authors != "" [#text(weight: "medium")[#authors]#if title != "" [, ]]
  if title != "" ["#title"#if venue != "" [, ]]
  if venue != "" [#text(style: "italic", fill: color-gray)[#venue]]
  if year != "" [#if venue != "" [ ]#text(fill: color-dark)[(#year)]]
  if doi != "" [, doi: #link("https://doi.org/" + doi)[#text(fill: color-accent)[#doi]]]
  else if url != "" [, #link(url)[#text(fill: color-accent)[link]]]
  if note != "" [
    #linebreak()
    #text(size: 9pt, fill: color-light, style: "italic")[#note]
  ]
  v(0.4em)
}

// Teaching entry
// Usage: #teaching-entry(course: "...", institution: "...", terms: "...")
#let teaching-entry(
  course: "",
  institution: "",
  terms: "",
) = {
  justified-header(course, terms)
  secondary-justified-header(institution, "")
  v(0.4em)
}

// Service list (simple bulleted list)
// Usage: #service-list(("Reviewer: JOP (2024)", "Search Committee (2023)"))
#let service-list(items) = {
  set text(size: 11pt, fill: color-dark)
  set par(leading: 0.65em)
  for item in items [- #item \ ]
  v(0.4em)
}

// Reference entry (for "References" section)
#let reference-entry(
  name: "",
  title: "",
  institution: "",
  email: "",
) = {
  set text(size: 10pt)
  [
    #text(weight: "bold", fill: color-dark)[#name] \
    #text(fill: color-gray)[#title \
    #institution
    #if email != "" [ \ #fa-icon("envelope") #link("mailto:" + email)[#text(fill: color-accent)[#email]]]]
  ]
  v(0.6em)
}

//------------------------------------------------------------------------------
// Document-wide style
//------------------------------------------------------------------------------

#set page(
  paper: "$papersize$",
  margin: (x: 1in, top: 0.8in, bottom: 0.8in),
  numbering: "1 / 1",
  number-align: center,
)

#set text(font: font-text, size: 11pt, fill: color-dark, lang: "en")
#set par(leading: 0.65em, justify: false)

// Level-1 markdown headings become styled section headers automatically
#show heading.where(level: 1): it => section(it.body)
#show heading: it => { block(breakable: false, it); v(0.3em, weak: true) }
#show link: it => { set text(fill: color-accent); it }

//------------------------------------------------------------------------------
// Name + contact header
//------------------------------------------------------------------------------

#align(left)[
  #block[
    #set text(size: 32pt, font: font-header, weight: "bold")
    $firstname$ $lastname$
  ]

  #set block(above: 0.75em, below: 0.75em)
  #set text(color-dark, size: 12pt)
  #block[$affiliation$]

  #v(0.3em)

  #set text(size: 9.5pt, fill: color-dark)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.8em,
    align: (left, left, left),
    [
      $if(address)$#fa-icon("location-dot") $address$ \ $endif$
      $if(email)$#fa-icon("envelope") #link("mailto:$email$")[$email$] \ $endif$
      $if(orcidurl)$#fa-icon("orcid", font: "Font Awesome 6 Brands") #link("$orcidurl$")[$orcidhandle$]$endif$
    ],
    [
      $if(phone)$#fa-icon("phone") $phone$ \ $endif$
      $if(websiteurl)$#fa-icon("earth-americas") #link("$websiteurl$")[$websitedisplay$] \ $endif$
      $if(linkedin)$#fa-icon("linkedin", font: "Font Awesome 6 Brands") #link("$linkedin$")[$linkedinhandle$]$endif$
    ],
    [
      $if(github)$#fa-icon("github", font: "Font Awesome 6 Brands") #link("$github$")[$githubhandle$] \ $endif$
      $if(twitter)$#fa-icon("x-twitter", font: "Font Awesome 6 Brands") #link("$twitter$")[\@$twitterhandle$] \ $endif$
      $if(google-scholar)$#ai-icon("google-scholar") #link("$google-scholar$")[$google-scholarhandle$]$endif$
    ],
  )
]

#v(1em)

$body$
