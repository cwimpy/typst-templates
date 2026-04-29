# cv

A simple, well-documented academic CV template built with Typst via Quarto.

Uses widely-available fonts (Helvetica Neue / Arial fallback) so it renders
without extra fonts installed. Icons via
[`fontawesome`](https://typst.app/universe/package/fontawesome) and
[`use-academicons`](https://typst.app/universe/package/use-academicons) —
both fetched automatically by Typst on first render.

## Render the example

```bash
quarto render template.qmd
```

## YAML fields (header / contact)

All are optional. Fields that aren't set simply don't appear.

| Field | Purpose |
|-------|---------|
| `firstname`, `lastname` | Name at top of CV |
| `affiliation` | Department + institution line under the name |
| `address` | Mailing address (with pin icon) |
| `phone` | Phone number (with phone icon) |
| `email` | Email address (with envelope icon, mailto link) |
| `websiteurl`, `websitedisplay` | URL to link to, and display text |
| `orcidurl`, `orcidhandle` | ORCID URL + display (e.g. `0000-0000-0000-0000`) |
| `github`, `githubhandle` | GitHub URL + username |
| `linkedin`, `linkedinhandle` | LinkedIn URL + username |
| `twitter`, `twitterhandle` | Twitter / X URL + handle (no `@`) |
| `google-scholar`, `google-scholarhandle` | Scholar URL + display text |
| `papersize` | Defaults to `us-letter` |

## Building the CV body

Level-1 markdown headings (`#`) become styled section headers automatically.
Inside each section, use the helper functions in raw Typst blocks:

````markdown
```{=typst}
#cv-entry(
  title: "Associate Professor",
  organization: "Your University",
  location: "City, ST",
  dates: "2023 – Present",
)
```
````

### Available helpers

| Helper | Use for |
|--------|---------|
| `#cv-entry(title, organization, location, dates, description, details)` | Employment, education, fellowships |
| `#pub-entry(authors, title, venue, year, doi, url, note)` | Manual publication entries |
| `#teaching-entry(course, institution, terms)` | Taught courses |
| `#service-list((...))` | Bulleted service list |
| `#reference-entry(name, title, institution, email)` | References section (use inside a `#grid(...)` for two columns) |

All helpers have optional arguments — pass only what you need.

## Using a bibliography instead of manual pub entries

Add to the YAML:

```yaml
bibliography: publications.bib
```

Then cite with Quarto's `@citekey` syntax. The rendered reference list will
appear wherever you place a `# References` heading that resolves to the
bibliography, following your selected CSL.

## Getting started

### Start a new CV from this template

```bash
quarto use template cwimpy/typst-templates/cv
```

Run this from the *parent* directory where you want the CV project to live.
Quarto will prompt for a name and create a new folder with `template.qmd` and
the format extension. Render with:

```bash
quarto render template.qmd
```

### Or add just the format to an existing project

```bash
quarto add cwimpy/typst-templates/cv
```

Then set `format: cv-typst` in your document's YAML.

## Customization

- Change fonts: edit `font-header` and `font-text` near the top of
  `_extensions/cv/cv-template.typ`
- Change colors: edit the color variables at the top of the same file
- Reorder or rename sections: change the `#` headings in your `.qmd`
