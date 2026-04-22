#show: doc => review-response(
$if(manuscript-title)$
  manuscript-title: [$manuscript-title$],
$endif$
$if(manuscript-id)$
  manuscript-id: [$manuscript-id$],
$endif$
$if(venue)$
  journal: [$venue$],
$endif$
$if(editor-name)$
  editor: [$editor-name$],
$endif$
$if(authors-list)$
  authors: [$authors-list$],
$endif$
$if(date)$
  date: "$date$",
$endif$
  doc,
)
