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
