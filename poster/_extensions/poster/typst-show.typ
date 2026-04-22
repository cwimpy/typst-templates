#show: doc => poster(
$if(title)$
  title: "$title$",
$endif$
$if(subtitle)$
  subtitle: "$subtitle$",
$endif$
$if(by-author)$
  authors: ($for(by-author)$"$it.name.literal$",$endfor$),
$endif$
$if(orcid)$
  orcid: "$orcid$",
$endif$
$if(affiliation)$
  affiliation: "$affiliation$",
$endif$
$if(venue)$
  venue: "$venue$",
$endif$
$if(poster-date)$
  date: "$poster-date$",
$endif$
$if(hero-line)$
  hero-line: [$hero-line$],
$endif$
$if(footer-contact)$
  footer-contact: [$footer-contact$],
$endif$
$if(footer-affiliation)$
  footer-affiliation: [$footer-affiliation$],
$endif$
$if(footer-resources)$
  footer-resources: [$footer-resources$],
$endif$
$if(logo-left)$
  logo-left: "$logo-left$",
$endif$
$if(logo-right)$
  logo-right: "$logo-right$",
$endif$
  doc,
)
