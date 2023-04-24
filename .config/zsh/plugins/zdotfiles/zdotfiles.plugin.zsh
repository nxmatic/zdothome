#!/usr/bin/env zsh -x

[[ -n "${ZDOTFILES_GIT}" ]] && return 0

setopt local_options

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

declare -x GIT_WORK_TREE="${HOME}"
declare -x GIT_DIR="${ZDOTFILES_GIT}"

alias dtfsh="env PS1=\"dtfsh> \" GIT_WORK_TREE=\"${GIT_WORK_TREE}\" GIT_DIR=\"${GIT_DIR}\" zsh --no-globalrcs --no-rcs"

trap 'unset GIT_WORK_TREE GIT_DIR' 0

if [[ ! -d "${ZDOTFILES_GIT}" ]]; then
    @zdotfiles-init
fi

@zdotfiles-update
