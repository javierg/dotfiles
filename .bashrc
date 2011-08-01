# Always use vim
EDITOR=vim
GIT_EDITOR=vim

# Add things to path
PATH=$PATH:/sbin:/usr/sbin:~/local/bin
PATH=./script:$PATH

# Don't put duplicate lines in history
export HISTCONTROL=ignoredups
# Bigger history
HISTSIZE=5000

# Make my searches case-insensitive
PAGER=/usr/bin/less\ -i
export PAGER

# Color output
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Trash from the CLI
alias trash="trash-put"

# Common searching aliases
alias hgrep="history | grep"
alias pgrep="ps aux | grep"

function log {
  file="$1"
  if [ ! -e "$file" -o -d "$file" ]; then
    file=`find log -iname "$file*.log" | head -n 1`
  fi
  tail -f -n 100 "$file"
}

# Show the current git branch in the prompt
function git_current_branch { git branch 2>/dev/null | grep '^*' | cut -f2- -d' '; }
PROMPT_COMMAND=$PROMPT_COMMAND${PROMPT_COMMAND:+;}'PS1="\[\e[01m\]\t\[\e[0m\] \[\e[1;32m\]`git_current_branch` \[\e[0m\]\[\e[33m\]\w \[\e[0m\]\[\e[1m\]\$\[\e[0m\] "'

# Funsies
if [ -x "`which cowsay`" -a -x "`which fortune`" ]; then
  cowsay $(fortune -a)
fi

# I use this for things and stuff
function make_a_hash {
  date +'%F %T %N' | md5sum | sed 's/^\([0-9a-f]\+\) \+-.*$/\1/' | tee >(xclip -i -selection clipboard)
}
