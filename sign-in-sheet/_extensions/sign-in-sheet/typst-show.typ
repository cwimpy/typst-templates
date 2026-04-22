#show: doc => sign-in-sheet(
$if(title)$
  title: [$title$],
$endif$
$if(meeting-date)$
  meeting-date: "$meeting-date$",
$endif$
$if(meeting-time)$
  meeting-time: [$meeting-time$],
$endif$
$if(meeting-location)$
  meeting-location: [$meeting-location$],
$endif$
  doc,
)
