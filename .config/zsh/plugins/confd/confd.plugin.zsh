#
# confd - Source all zsh files from a Fish-like conf.d directory
#

_confd=(
  ${ZDOTDIR:-$HOME}/.zshrc.d(N/)
  ${ZDOTDIR:-$HOME}/zshrc.d(N/)
  ${ZDOTDIR:-$HOME/.config/zsh}/conf.d(N/)
  ${ZDOTDIR:-$HOME/.config/zsh}/rc.d(N/)
)
(( $#_confd )) || return
for _f in $_confd[1]/*.zsh(N); do
  # ignore files that begin with ~
  case ${_f:t} in '~'*) continue;; esac
  source "$_f"
done
unset _f _confd
