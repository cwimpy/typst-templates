#show: doc => cover-letter(
$if(sender-name)$
  sender-name: [$sender-name$],
$endif$
$if(sender-title)$
  sender-title: [$sender-title$],
$endif$
$if(sender-affiliation)$
  sender-affiliation: [$sender-affiliation$],
$endif$
$if(sender-address)$
  sender-address: [$sender-address$],
$endif$
$if(sender-email)$
  sender-email: [$sender-email$],
$endif$
$if(sender-phone)$
  sender-phone: [$sender-phone$],
$endif$
$if(recipient-name)$
  recipient-name: [$recipient-name$],
$endif$
$if(recipient-title)$
  recipient-title: [$recipient-title$],
$endif$
$if(recipient-journal)$
  recipient-journal: [$recipient-journal$],
$endif$
$if(recipient-address)$
  recipient-address: [$recipient-address$],
$endif$
$if(salutation)$
  salutation: [$salutation$],
$endif$
$if(manuscript-title)$
  manuscript-title: [$manuscript-title$],
$endif$
$if(closing)$
  closing: [$closing$],
$endif$
$if(date)$
  date: "$date$",
$endif$
  doc,
)
