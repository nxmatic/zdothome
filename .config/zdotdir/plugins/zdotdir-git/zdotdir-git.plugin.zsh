#!/usr/bin/env zsh -x

echo "sourcing rcfile ${0}"

alias dtfsh="env PS1=\"dtfsh> \" GIT_WORK_TREE=\"\${HOME}\" GIT_DIR=\"\${DOTDIR:=${HOME}/.dotfiles.git\" zsh -d -f"

# Installation script (Bash) for https://github.com/nxmatic/dotfiles

[[ -n "${ZDOTDIR}" ]] && return 0

if [ -z "${ZDOTDIR}" ]; then
    if [ -h /bin/ls ] && expr "$(readlink /bin/ls)" = '/bin/busybox' > /dev/null; then
        apk add coreutils
        [ -x /usr/bin/rsync ] || apk add rsync
    fi
    export ZDOTDIR="$(realpath ${HOME})"
fi

setopt aliases

alias dtfsh="env PS1=\"dtfsh> \" GIT_WORK_TREE=\"\${ZDOTDIR}\" GIT_DIR=\"\${ZDOTDIR}/.dotfiles.git\" zsh -d -f"

zprofile

