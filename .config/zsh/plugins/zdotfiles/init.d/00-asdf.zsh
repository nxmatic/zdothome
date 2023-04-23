command -v asdf >/dev/null || return

plugins=( "${(@f)$(<${XDG_CONFIG_HOME}/asdf/plugins)}" )

for plugin in ${plugins}; do
  asdf plugin add $plugin
done

asdf install
