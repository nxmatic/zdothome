#!/usr/bin/env zsh
# -*- mode: shell-script;-*-

defun zdot.zshenv() {
    : ${XDG_CONFIG_HOME:=${0:a:h:h}}
    : ${XDG_DATA_HOME:=${HOME}/.local/share}
    : ${XDG_CACHE_HOME:=${HOME}/.local/var/cache}

    : ${ZDOTDIR:=${0:a:h}}
    : ${ZDOTFUNCS:=${ZDOTDIR}/functions}
    : ${ZDOTGIT:=${XDG_DATA_HOME}/zdot/bare-repository.git}

    : ${ZSH_THEME:=nxmatic}
}

# ensure we have no duplicate in search path

typeset -aU path=( ${path[@]} )
typeset -aU fpath=( ${fpath[@]} )

# load required environment

zdot.zshenv

# bootstrap zdot functions loading

fpath+=( ${ZDOTFUNCS} )
autoload -Uz autoload-dir &&
  autoload-dir ${ZDOTFUNCS}

