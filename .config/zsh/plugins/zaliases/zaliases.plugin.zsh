##? ZALIASES - Use a Fish-like functions directory for zsh functions.

: ${ZDOTDIR:=${XDG_CONFIG_HOME:-$HOME/.config/zsh}

# Load ZPLUGINSDIR.
if [[ -z "$ZPLUGINSDIR" ]]; then
  ZPLUGINSDIR=${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config/zsh}}/plugins
fi
[[ -d "$ZDOTDIR" ]] || return

for _zaliases in **/.zaliases; do
  source $_zaliases
done
unset _zaliases

#
# Tell Zephyr this plugin is loaded.
zstyle ":zephyr:plugin:ZALIASES" loaded 'yes'
