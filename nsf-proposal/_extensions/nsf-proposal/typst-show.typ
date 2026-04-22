// Quarto show-rule partial – connects the YAML metadata to the template
#show: doc => article(
  $if(title)$ title: [$title$], $endif$
  $if(subtitle)$ subtitle: [$subtitle$], $endif$
  $if(by-author)$ authors: (
    $for(by-author)$
      (
        name: [$it.name.literal$],
        $if(it.affiliations)$
          affiliation: [$for(it.affiliations)$$it.name$$sep$; $endfor$],
        $endif$
        $if(it.email)$
          email: "$it.email$",
        $endif$
      ),
    $endfor$
  ), $endif$
  $if(date)$ date: [$date$], $endif$
  $if(abstract)$ abstract: [$abstract$], $endif$
  $if(abstract-title)$ abstract-title: "$abstract-title$", $endif$
  $if(lang)$ lang: "$lang$", $endif$
  $if(region)$ region: "$region$", $endif$
  $if(margin)$ margin: ($for(margin/pairs)$$it.key$: $it.value$,$endfor$), $endif$
  $if(papersize)$ paper: "$papersize$", $endif$
  $if(mainfont)$ font: ("$mainfont$",), $endif$
  $if(fontsize)$ fontsize: $fontsize$, $endif$
  $if(section-numbering)$ sectionnumbering: "$section-numbering$", $endif$
  $if(toc)$ toc: $toc$, $endif$
  $if(toc-title)$ toc_title: "$toc-title$", $endif$
  $if(toc-depth)$ toc_depth: $toc-depth$, $endif$
  cols: $if(columns)$ $columns$ $else$ 1 $endif$,
  doc,
)
