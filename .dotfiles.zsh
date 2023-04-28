#!/usr/bin/env zsh

alias dtfsh="env PS1=\"dtfsh> \" GIT_WORK_TREE=\"\$DOTFILES\" GIT_DIR=\"\$DOTFILES/.dotfiles.git\" zsh -d -f"

# Installation script (Bash) for https://github.com/nxmatic/dotfiles

[ -n "$DOTFILES" ] && return

set -x

export DOTFILES=$(realpath $HOME)

if [ -h /bin/ls ] && expr "$(readlink /bin/ls)" = '/bin/busybox' > /dev/null; then
    apk add coreutils
    [ -x /usr/bin/rsync ] || apk add rsync
fi

setopt aliases

dtfsh -x <<EOF
if [ ! -d "\$GIT_DIR" ]; then
    tmpfile=\$(mktemp -d $(basename $0).XXXXX) # && trap 0 "rm -fr \$tmpfile"

    git clone --quiet --bare https://github.com/nxmatic/dotfiles "\$GIT_DIR" && git checkout
    git ls-tree -r HEAD | awk '{print \$NF}' > \$tmpfile/ls-tree
    
    rsync -av --files-from=\$tmpfile/ls-tree \$GIT_WORK_TREE \$tmpfile 2>/dev/null || true
    
    xargs rm -f < \$tmpfile/ls-tree

    git config status.showUntrackedFiles no
    git checkout
    rsync -av --files-from=\$tmpfile/ls-tree \$tmpfile \$GIT_WORK_TREE 2>/dev/null || true
else
    git pull --rebase
fi
EOF

set +x
