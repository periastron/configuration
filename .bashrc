#!/bin/bash

# Interactive shell profile

[ -z "${PS1}" ] && return

if [ -z "${_HOMEBASHRC}" ]; then

[[ -f /usr/local/share/bash-completion/bash_completion ]] && \
    . /usr/local/share/bash-completion/bash_completion

readonly _HOMEBASHRC=true

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"

# Shorthand for convenience:
export XC="${XDG_CONFIG_HOME}"
export XD="${XDG_DATA_HOME}"

set -o vi

# git clone --bare git@roroleto.local:lee/dotfiles.git .dotfiles.git
# cd .dotfiles.git
# git config --local --unset core.bare
# git config --local core.worktree $HOME
# git config --local status.showUntrackedFiles no
# cd
# echo "gitdir: $HOME/.dotfiles.git" >.git
# mv .bashrc .bashrc.0
# git checkout master

# Aliases should probably go in their own file(s).
alias cls="tput clear"
alias dir="ls -al"
alias dl="cd ~/Downloads"
alias doc="cd ~/Documents"
alias dt="cd ~/Desktop"
alias l="ls -Al"
alias ls="ls -G"
alias md="mkdir"
alias r="fc -e -"
alias rd="rmdir"
alias xc="cd \"${XDG_CONFIG_HOME}\""
alias xd="cd \"${XDG_DATA_HOME}\""

case "${TERM}" in
  iterm | xterm* | rxvt)
    export PS1="\e[1m(\e[35m\\u@\\h\e[39m:\e[1;34m\\w\e[39m)\e[0m\n\$ "
    ;;
  *)
    export PS1="(\\u@\\h:\\w)\n\$ "
    ;;
esac

if [ -e "${XDG_CONFIG_HOME}/bash/bashrc.$(uname -s)" ]; then
  . "${XDG_CONFIG_HOME}/bash/bashrc.$(uname -s)"
fi

if [ -e "${XDG_CONFIG_HOME}/bash/bashrc.$(hostname -s)" ]; then
  . "${XDG_CONFIG_HOME}/bash/bashrc.$(hostname -s)"
fi

fi # -z "${_HOMEBASHRC}"
