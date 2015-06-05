#remove fish greeting message
set fish_greeting ""

#run tmux at startup
#test $TERM != "screen"; and exec tmux

#calling z.fish
#source functions/z.fish
source /home/ricci/.config/fish/functions/z.fish

#alias goes here
alias clipboard="xclip -se c"
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias purge="sudo apt-get purge"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias dupgrade="sudo apt-get dist-upgrade"
alias ppa="sudo apt-add-repository"
alias ppa-remove="sudo apt-add-repository --remove"
alias autoremove="sudo apt-get autoremove"
alias tmux="tmux -2"
