#remove fish greeting message
set fish_greeting ""

#run tmux at startup
test $TERM != "screen"; and exec tmux

set -x PATH /usr/local/opt/coreutils/libexec/gnubin $HOME/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin

set -x GOROOT /usr/local/opt/go/libexec
set -x GOPATH ~/code

# fuxor git to non-interactively merge commits
set -x GIT_MERGE_AUTOEDIT no

# Set where to install casks
#set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

# Setup terminal, and turn on colors
set -x TERM xterm-256color
set -xU LS_COLORS "di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34:su=0:sg=0:tw=0:ow=0:"

# Enable color in grep
set -x GREP_OPTIONS '--color=auto'
set -x GREP_COLOR '3;33'

set -x LESS '--ignore-case --raw-control-chars'
set -x PAGER 'less'
set -x EDITOR 'nano'

set -x LANG en_US.UTF-8
set -x LC_CTYPE "en_US.UTF-8"
set -x LC_MESSAGES "en_US.UTF-8"
set -x LC_COLLATE C

#calling z.fish
#source functions/z.fish
source /home/ricci/.config/fish/functions/z.fish

#sourcing autojump
if test -e ~/.autojump/etc/profile.d/autojump.fish
    . ~/.autojump/etc/profile.d/autojump.fish
end

#alias goes here
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias purge="sudo apt-get purge"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias dupgrade="sudo apt-get dist-upgrade"
alias ppa="sudo apt-add-repository"
alias autoremove="sudo apt-get autoremove"


