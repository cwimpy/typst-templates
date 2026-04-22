#show: doc => meeting-agenda(
$if(committee)$
  committee: [$committee$],
$endif$
$if(date)$
  date: "$date$",
$endif$
$if(time)$
  time: [$time$],
$endif$
$if(location)$
  location: [$location$],
$endif$
$if(chair)$
  chair: [$chair$],
$endif$
$if(members)$
  members: ($for(members)$[$members$],$endfor$),
$endif$
$if(apologies)$
  apologies: ($for(apologies)$[$apologies$],$endfor$),
$endif$
$if(guests)$
  guests: ($for(guests)$[$guests$],$endfor$),
$endif$
$if(next-meeting)$
  next-meeting: [$next-meeting$],
$endif$
$if(doc-kind)$
  doc-kind: [$doc-kind$],
$endif$
  doc,
)
