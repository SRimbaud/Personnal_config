# .bashrc

function hg_branch ()
{
  #Do the same as hg branch but 5 to 10 times faster.
  local HG_ROOT=""
  local DIR=`pwd`
  while [ $DIR != "/" ]; do
    if [ -f $DIR'/.hg/branch' ]; then
      echo "{Hg:`cat $DIR'/.hg/branch'`}"
      return 0
    else
      DIR=`dirname $DIR`
    fi
  done
  return 1
}

function rev_branch ()
{
  hg_branch ||\
  git branch 2> /dev/null |awk '/^\*/ {printf("{Git:%s}",$2)}'
}

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
PROMPT_COMMAND=_prompt_command

function _prompt_command
{
  local EXIT="$?";
  PS1=""
  PS2=""

  ##Colors
  local RESET='\[\e[0m\]'
  local RED='\[\e[01;31m\]'
  local GREEN='\[\e[00;32m\]'
  local BLUE='\[\e[01;34m\]'
  local YELLOW='\[\e[01;33m\]'
  local ORANGE='\[\e[38;5;208m\]'

  if [ $EXIT == 0 ]; then
    PS1+="${YELLOW}(^_^)${RESET}"
  else
    PS1+="${RED}(0_0)${RESET}"
  fi
  PS1+="${GREEN}[\u@\h]${RESET}`rev_branch`${BLUE}\w${RESET}"
  ## Second line
  PS1+="\n${ORANGE}[\#|\!]> ${RESET}"
  PS2+="${ORANGE}[\#|\!]> ${RESET}"
}

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=700
HISTFILESIZE=5000

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
