# TODO: giconfigure sparse checkout based on os/flavors

dtfsh <<!

if [ ! -d "\${GIT_DIR}" ]; then
    tmpdir=\$(mktemp -d "${DOTFILES_DIR}/$(basename $0).XXXXX") && trap "rm -fr \"\${tmpdir}\"" 0
    git_work_tree=\${tmpdir}/tree

    git clone --quiet --bare https://github.com/nxmatic/dotfiles "\${GIT_DIR}" 
    git ls-tree -r HEAD | awk '{print \$NF}' > "\${git_work_tree}"
    
    rsync -av --files-from="\${git_work_tree}" "\${GIT_WORK_TREE}" "\${tmpdir}" 2>/dev/null || true
    
    ( cd "\${GIT_WORK_TREE}" && xargs rm -f < "\${git_work_tree}" )

    git config status.showUntrackedFiles no
    git checkout
    rsync -av --files-from="\${git_work_tree}" "\${tmpfile}" "\${GIT_WORK_TREE}" 2>/dev/null || true

    source_if_exists "\${GIT_WORK_TREE}/.dotfiles~$(uname).rc"
    source_if_exists "\${GIT_WORK_TREE}/.dotfiles~$(hostname).rc"
else
    git fetch
fi
!
