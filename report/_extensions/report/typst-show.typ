#show: doc => report(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(report-author)$
  author: [$report-author$],
$endif$
$if(author-affiliation)$
  author-affiliation: [$author-affiliation$],
$endif$
$if(author-email)$
  author-email: "$author-email$",
$endif$
$if(institution)$
  institution: [$institution$],
$endif$
$if(date)$
  date: "$date$",
$endif$
$if(logo)$
  logo: "$logo$",
$endif$
$if(running-title)$
  running-title: [$running-title$],
$endif$
$if(running-footer)$
  running-footer: [$running-footer$],
$endif$
$if(accent-color)$
  accent-color: rgb("$accent-color$"),
$endif$
  doc,
)
