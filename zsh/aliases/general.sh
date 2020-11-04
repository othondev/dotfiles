alias gitall='f(){ for i in $(ls -d ./*/.git | sed s,/.git,, ); do cd ${i} && tput setaf 1; echo ${i} && tput sgr0; git ${@} ; cd - > /dev/null ; done   }; f'
alias status='curl -s https://gitlab.com/othondev/scripts/raw/master/online/softfax/status_service.sh | sh'
alias chbranch='gitall fetch && gitall pull --all && gitall stash && gitall checkout origin/development && gitall checkout ${1}'
alias editor=vim
