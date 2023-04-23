#!/usr/bin/env zsh -x

[[ -n "${ZDOTFILES_GIT}" ]] && return 0

# Load functions subdirs.
for _fndir in $ZFUNCDIR(N/) $ZFUNCDIR/*(N/); do
  fpath=("$_fndir" $fpath)
  autoload -Uz $fpath[1]/*(.:t)
done
unset _fndir

if [ -z "${ZDOTFILES_GIT}" ]; then
    if [ -h /bin/ls ] && expr "$(readlink /bin/ls)" = '/bin/busybox' > /dev/null; then
        apk add coreutils
        [ -x /usr/bin/rsync ] || apk add rsync
    fi
    export ZDOTFILES_GIT="${XDG_DATA_HOME}/dotfiles.git"
fi

setopt aliases

alias dtfsh="env PS1=\"dtfsh> \" GIT_WORK_TREE=\"${HOME}\" GIT_DIR=\"${ZDOTFILES_GIT}\" zsh --no-globalrcs --no-rcs"

if [[ ! -d "${ZDOTFILES_GIT}" ]]; then
    @zdotfiles-init
fi

@zdotfiles-update
