# we want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -la'
alias l='ls $LS_OPTIONS -lA'

# Some more alias to avoid making mistakes:
alias agi='apt-get install -y'
alias acs='apt-cache search'
alias agu='apt-get update'

### git coloring stuff

parse_git_branch()
{
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

export SAVE_PS1="$PS1"
export PS1="$PS1\[\033[1;32m\]\$(parse_git_branch)\[\e[0m\]"
