(( $+commands[brew] )) && return

HOMEBREW_BREW_GIT_REMOTE="https://github.com/nxmatic/brew.git" # your Git mirror of Homebrew/homebrew-core here

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install rcmdnk/file/brew-file

