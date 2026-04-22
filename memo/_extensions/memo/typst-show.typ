#show: doc => memo(
$if(title)$
  title: [$title$],
$endif$
$if(memo-to)$
  memo-to: [$memo-to$],
$endif$
$if(memo-from)$
  memo-from: [$memo-from$],
$endif$
$if(subject)$
  subject: [$subject$],
$endif$
$if(date)$
  date: "$date$",
$endif$
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
$if(sender-email)$
  sender-email: [$sender-email$],
$endif$
$if(sender-phone)$
  sender-phone: [$sender-phone$],
$endif$
$if(sender-website)$
  sender-website: [$sender-website$],
$endif$
$if(dept-header)$
  dept-header: [$dept-header$],
$endif$
$if(dept-subheader)$
  dept-subheader: [$dept-subheader$],
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
$if(author-sig)$
  author-sig: $author-sig$,
$endif$
$if(cosig)$
  cosig: $cosig$,
$endif$
$if(cosig-name)$
  cosig-name: [$cosig-name$],
$endif$
$if(cosig-title)$
  cosig-title: [$cosig-title$],
$endif$
  doc,
)
