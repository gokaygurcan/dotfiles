#!/bin/bash

# .bash_aliases
# ----------------------------

# enable aliases to be sudo’ed
alias sudo="sudo "

# clear everything!
alias cls="clear && printf '\e[3J'"

# navigation
alias ~="cd ~"
alias cd..="cd .." # windows habits
alias .2="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"

# list
alias l.="ls -d .*" # only hidden files
alias ll="ls -la"   # list all
alias lt="ls -ltr"  # ls sort by time
alias lS="ls -Slr"  # ls sort by byte size
alias l="ls -lah"
alias ln="ln -v"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"

# file size
alias filesize="stat -f \"%z bytes\""

# numbered cat
alias catn="cat -n"

# tree
alias tre="find . -print | sed -e 's;[^/]*/;|-- ;g;s;-- |;   |;g'"

# calculator
alias bc="bc -l"

# continuous wget
alias wget='wget -c'

# auxwww
alias pcaux='ps auxwww'

# mkdir
alias mkdir="mkdir -pv"

# make basic commands interactive and verbose
alias cp='cp -iv'                       # interactive
alias rm='rm -ri'                       # interactive
alias mv='mv -iv'                       # interactive, verbose
alias grep='grep -i --color='always''   # ignore case

# starts nano with line number enabled
alias nano='nano -c'

# lists the size of all the folders and files
alias ducks='du -cks * | sort -rn|head -11'
