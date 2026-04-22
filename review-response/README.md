# review-response

A Quarto Typst format for point-by-point responses to journal reviewers.
Provides gray-block reviewer-comment quoting and clear "Response:" replies.

## Render the example

```bash
quarto render template.qmd
```

## YAML fields

| Field | Purpose |
|-------|---------|
| `manuscript-title` | Title of the paper being revised |
| `manuscript-id` | Journal-assigned ID |
| `venue` | Journal name (`journal` is reserved by Quarto) |
| `editor-name` | Handling editor (`editor` is reserved by Quarto) |
| `authors-list` | Free-text list of authors (e.g., "Wimpy, Smith, and Jones") |
| `date` | `"YYYY-MM-DD"` → "Month DD, YYYY"; free-text passes; omit for today |

## Formatting reviewer comments and responses

Use raw Typst blocks inside the body:

````markdown
```{=typst}
#reviewer-comment[
  The reviewer's comment goes here, quoted verbatim in a gray block.
]

#response[
  Our reply to that comment.
]
```
````

## Suggested section layout

```markdown
# Reviewer 1
# Reviewer 2
# Editor
# Summary of Changes
```

## Install as an extension

```bash
quarto add cwimpy/typst-templates/review-response
```

Then: `format: review-response-typst`
