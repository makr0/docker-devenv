# we want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -la'
alias l='ls $LS_OPTIONS -lA'

alias agi='apt-get install -y'
alias acs='apt-cache search'
alias agu='apt-get update'
alias bower='bower --allow-root'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gcam='git commit -am'
alias gcm='git commit -m'

### git coloring stuff

parse_git_branch()
{
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
function prompt {
  local GREEN="\[\e[0;32m\]"
  local RED="\[\e[0;31m\]"
  local CYAN="\[\e[0;36m\]"
  local BLUE="\[\e[0;94m\]"
  local DARK_BLUE="\[\e[0;34m\]"
  local YELLOW="\[\e[0;33m\]"
  local NO_COLOR="\[\e[0;0m\]"


  PS1="$GREEN[\A] $CYAN\u@\h:$GREEN\w$YELLOW\$(parse_git_branch)$RED $ $NO_COLOR"
  export PS1
}

prompt
