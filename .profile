#!/bin/bash

export EDITOR="mate -w"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export HISTFILESIZE=1000


# Path

export PYTHONPATH="/usr/local/lib/python":$PYTHONPATH
export NODE_PATH="/usr/local/lib/node_modules":$NODE_PATH

export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/heroku/bin:$PATH"

echo $PATH | grep -q -s "/usr/local/sbin"
if [ $? -eq 1 ] ; then
  PATH=/usr/local/sbin:$PATH
  export PATH
fi


function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
GRAY="\[\033[1;30m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$CYAN\u$NO_COLOUR:\W$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "


# Virtualenv

export WORKON_HOME="~/Envs"

source /usr/local/share/python/virtualenvwrapper.sh


# bash completion

#complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh


if [ -f `brew --prefix`/etc/bash_completion ]; then
  source `brew --prefix`/etc/bash_completion
fi


# rbenv

eval "$(rbenv init -)"


# Aliases

# postgres
export PGDATA="/usr/local/var/postgres/data"
alias psql="psql -d postgres"
alias pg_start="pg_ctl -D /usr/local/var/postgres/data -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl stop"

# git
alias gs="git status"

#mysql
alias mysql_start='mysql.server start'
alias mysql_stop='mysql.server stop'
