#!/usr/bin/env zsh

alias dtfsh="env PS1=\"dtfsh> \" GIT_WORK_TREE=\"\${DOTFILES}\" GIT_DIR=\"\${DOTFILES}/.dotfiles.git\" zsh -d -f"

# Installation script (Bash) for https://github.com/nxmatic/dotfiles

if [ -z "${DOTFILES}" ]; then
    if [ -h /bin/ls ] && expr "$(readlink /bin/ls)" = '/bin/busybox' > /dev/null; then
        apk add coreutils
        [ -x /usr/bin/rsync ] || apk add rsync
    fi
    export DOTFILES=$(realpath ${HOME})
fi

setopt aliases

# TODO: giconfigure sparse checkout based on os/flavors

dtfsh <<EOF
if [ ! -d "\${GIT_DIR}" ]; then
    tmpfile=\$(mktemp -d ~${DOTFILES}/$(basename $0).XXXXX) && trap 0 "rm -fr \$tmpfile"

    git clone --quiet --bare https://github.com/nxmatic/dotfiles "\$GIT_DIR" 
    git ls-tree -r HEAD | awk '{print \$NF}' > \$tmpfile/ls-tree
    
    rsync -av --files-from=\${tmpfile}/ls-tree \$GIT_WORK_TREE \${tmpfile} 2>/dev/null || true
    
    (cd \${GIT_WORK_TREE} && xargs rm -f < \${tmpfile}/ls-tree)

    git config status.showUntrackedFiles no
    git checkout
    rsync -av --files-from=\${tmpfile}/ls-tree \$tmpfile \${GIT_WORK_TREE} 2>/dev/null || true
else
    git fetch
fi
EOF
