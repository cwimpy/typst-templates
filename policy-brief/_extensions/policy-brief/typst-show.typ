#show: doc => policy-brief(
$if(series)$
  series: [$series$],
$endif$
$if(issue)$
  issue: [$issue$],
$endif$
$if(date)$
  date: "$date$",
$endif$
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(brief-author)$
  brief-author: [$brief-author$],
$endif$
$if(brief-affiliation)$
  brief-affiliation: [$brief-affiliation$],
$endif$
$if(key-findings)$
  key-findings: ($for(key-findings)$[$key-findings$],$endfor$),
$endif$
$if(cite-as)$
  cite-as: [$cite-as$],
$endif$
$if(contact)$
  contact: [$contact$],
$endif$
$if(accent-color)$
  accent-color: rgb("$accent-color$"),
$endif$
  doc,
)
