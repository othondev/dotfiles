#!/bin/bash
alias cover="_cover"

_daySuffix(){
    case `date +%d` in
    1|21|31) echo "st";;
    2|22)    echo "nd";;
    3|23)    echo "rd";;
    *)       echo "th";;
  esac
}
_cover() {
  echo "who?" ; [ -z $who ] && read who
  echo "position?" ; [ -z $position ] && read position
  echo "where?" ; [ -z $where ] && read where
  echo "company?" ; [ -z $company ] && read company

  date=$(date "+%-e`_daySuffix` %B %Y")

  echo "
Mr Othon Ferreira
Address: 33/287 Wickham Terrace, Spring Hill QLD 4000
Email: othon.au@gmail.com
Ph: +61 450 592 803

$date

Hi $who,

I am writing to apply for the position of $position, as advertised on $where. I have over 7+ years of experience as both a Software Developer and DevOps specialist, including duties pertaining to Backend and Frontend development, Infrastructure, Telephony and CRM. I believe that with a combination of my skills, experience and work ethic, I can give the $company a strong competitive advantage.

In all the companies that I worked at previously, I was always happy to take on a range of responsibilities, and completed my tasks with the most effective approach possible. I always fostered in my teams an understanding that, while we would make some mistakes, if we worked together we could resolve any problem or difficulty.

I started my career as a developer, and I have always kept up-to-date with the major frameworks, tools, and advances in the industry through self-study. Due to this, I have had opportunities to work for the best companies in my country in the field, including work on important international projects.

Here are some highlights of my skills and qualifications: 
  * Mobile Developer - I worked as a Mobile Developer for 2.5 years at two different companies. This experience resulted in having four of my projects published on the Apple Store and Google Play, as well as a completed pipeline for continuous integration using the Jenkins server.
  * SalesForce Developer/Admin – In one of  my most recent jobs, I was promoted to the position of Salesforce Developer and Administrator. It was a great challenge, firstly because the salesforce had a shared infrastructure for a large number of clients, and secondly because I also had to cope with limitations on resources available, which gave me many obstacles to overcome related to maintaining superior performance levels and complexity of the code.
  * DevOps Developer – Throughout my career, I have keenly studied parallel programming and infrastructure, so when a DevOps profile opportunity appears, it suits me very well. I have taken on a DevOps role in my two last jobs, and both times I significantly reduced the time needed to deploy new code releases. I worked with, and developed expertise utilising, the majority of AWS resources: (CloudFormation, RDS, ECS, EC2 etc.), as well as others including Docker, Jenkins, Swarm, Integration, GitHub, Gitlab, etc.
  * Full Stack Developer - I have also worked in a Full Stack Developer position, using the latest major language and frameworks such as JAVASCRIPT (NodeJS, VueJS, React-Native), and Databases (MySQL, Mongo, Postgres) etc.
Thank you for your time and for considering me for this position. I hope to hear from you soon. If it would be possible to schedule an interview, then don’t hesitate to contact me anytime.
Kind Regards

Othon Ferreira
(ph:+61 450 592 803)

"

}
