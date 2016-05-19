#!/bin/bash

# .bash_profile
# ----------------------------

# path exports
export PATH="/usr/local/sbin:/usr/local/bin:/usr/local/bin/node:/usr/local/opt/go/libexec/bin:$PATH"

if [ -d ~/bin ]; then
  # add your bin folder to the path, if you have it.
  # it's a good place to add all your scripts.
  export PATH=:~/bin:$PATH
fi

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/man:$MANPATH

# ----------------------------

# generic settings and exports
if [ -f ~/.bashrc ] ; then
  source ~/.bashrc
fi

# aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# defaults
if [ -f ~/.bash_defaults ]; then
  source ~/.bash_defaults
fi

# exports
if [ -f ~/.bash_exports ]; then
  source ~/.bash_exports
fi

# functions
if [ -f ~/.bash_functions ]; then
  source ~/.bash_functions
fi

# osx
if [ -f ~/.bash_osx ]; then
  source ~/.bash_osx
fi

# git-prompt script from git repository
# see https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
if [ -f ~/.git-prompt.sh ] ; then
  source ~/.git-prompt.sh
fi

# color stuff
export CLICOLOR=1

RED=$(tput setaf 1)    # \[$RED\]
GREEN=$(tput setaf 2)  # \[$GREEN\]
WHITE=$(tput setaf 7)  # \[$WHITE\]
BOLD=$(tput bold)      # \[$BOLD\]
RESET=$(tput sgr0)     # \[$RESET\]

# prompt statement settings
# default value = "\h:\W \u\$"
export PS1="\[$WHITE\][\$(if [[ \$? == 0 ]]; then echo \"\[\$GREEN\]\342\234\223\"; else echo \"\[\$RED\]\342\234\227\"; fi)\[$WHITE\]] \[$RESET\]\[$GREEN\]\u \[$WHITE\]\w\[$BOLD\]\$(__git_ps1) \[$RESET\]\[$BOLD\]\[$RED\]\\$ \[$RESET\]\[$RESET\]"
# default value = ">"
export PS2='> '
# default value = " "
export PS3='#? '
# default value = "+"
export PS4='+'
# default value = "update_terminal_cwd;"
export PROMPT_COMMAND='echo -ne "\\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\\007"'
