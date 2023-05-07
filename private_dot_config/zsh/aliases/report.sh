
alias report="task status:pending or \( end.after:today and status:completed \) export |  jq --unbuffered -r '.[] | \" [ \(.status) ]\t\(.description)\"' "
alias plan="task status:pending export | jq -r '.[] | \" [ \(.status) ] \t\(.description)\"'"
alias sendreport=" _send report mobile2office@atlantico.com.br"
alias sendplan=" _send plan mobile2office@atlantico.com.br"

_send() {
  if [ "$1" = "report" ]; then
    title="Home Office Result"
    body="Here is report of my activities\n\n`report`"
  else
    title="Home Office Planning"
    body="Here is my activities plan \n\n`plan`"
  fi

  mail="Subject: $title `date +%m-%d`


  Hi Team,

  $body,

  Regards,
  Othon Ferreira
  "

  echo $mail > /tmp/email && vim /tmp/email
  cat /tmp/email
  echo "to: $2"
  echo "Sure?"
  read choice
  case "$choice" in
    y|Y ) cat /tmp/email | sendmail $2 && rm /tmp/email;;
    n|N ) echo "Canceled!";;
    * ) echo "invalid";;
  esac
}
