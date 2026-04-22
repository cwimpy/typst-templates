#show: doc => peer-review-memo(
$if(manuscript-title)$
  manuscript-title: [$manuscript-title$],
$endif$
$if(manuscript-id)$
  manuscript-id: [$manuscript-id$],
$endif$
$if(venue)$
  journal: [$venue$],
$endif$
$if(reviewer)$
  reviewer: [$reviewer$],
$endif$
$if(date)$
  date: "$date$",
$endif$
$if(recommendation)$
  recommendation: [$recommendation$],
$endif$
$if(confidential)$
  confidential: $confidential$,
$endif$
  doc,
)
