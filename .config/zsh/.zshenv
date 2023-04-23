#!/bin/zsh
##? .zshenv - Zsh environment file, loaded always.

exec 3>&2 2>/tmp/zshenv~zdotdir &&
 . set -x

: ${0} $(pwd)

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-~/.local/share}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

set +x &&
  exec 2>&3 3>&-
