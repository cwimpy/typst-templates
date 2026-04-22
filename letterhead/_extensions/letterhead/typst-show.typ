#show: doc => letterhead(
$if(sender-name)$
  sender-name: [$sender-name$],
$endif$
$if(sender-qualifications)$
  sender-qualifications: [$sender-qualifications$],
$endif$
$if(sender-position)$
  sender-position: [$sender-position$],
$endif$
$if(sender-department)$
  sender-department: [$sender-department$],
$endif$
$if(sender-institution)$
  sender-institution: [$sender-institution$],
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
$if(sender-website)$
  sender-website: [$sender-website$],
$endif$
$if(logo-header)$
  logo-header: "$logo-header$",
$endif$
$if(logo-footer)$
  logo-footer: "$logo-footer$",
$endif$
$if(signature)$
  signature: "$signature$",
$endif$
$if(date)$
  date: "$date$",
$endif$
$if(recipient)$
  recipient: ($for(recipient)$[$recipient$],$endfor$),
$endif$
$if(opening)$
  opening: [$opening$],
$endif$
$if(closing)$
  closing: [$closing$],
$endif$
$if(bold-title)$
  bold-title: [$bold-title$],
$endif$
$if(sub-header)$
  sub-header: [$sub-header$],
$endif$
$if(encl)$
  encl: [$encl$],
$endif$
$if(cc)$
  cc: [$cc$],
$endif$
$if(ps)$
  ps: [$ps$],
$endif$
  doc,
)
