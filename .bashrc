# .bashrc

function rev_branch ()
{
  hg branch 2> /dev/null |awk '{printf("{Mercurial:%s}-",$1)}'
  if [ ${PIPESTATUS}[0] == 0 ]; then
   return 0;
 fi 
  git branch 2> /dev/null |awk '/^\*/ {printf("{Git:%s}-",$2)}'
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
  PS1+="\n${ORANGE}[\!]> ${RESET}"
}
export PATH=$PATH:/home/fsardren/anaconda3/bin
#PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$ "
#export PS1
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=3000
HISTFILESIZE=10000
