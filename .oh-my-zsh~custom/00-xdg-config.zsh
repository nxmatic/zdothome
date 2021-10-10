set -a
[ -z "${XDG_CONFIG_HOME}" ] && XDG_CONFIG_HOME=$HOME/.local/etc && mkdir -p ${XDG_CONFIG_HOME}
[ -z "${XDG_CACHE_HOME}" ] && XDG_CACHE_HOME=$HOME/.local/cache && mkdir -p ${XDG_CACHE_HOME}
[ -z "${XDG_DATA_HOME}" ] && XDG_DATA_HOME=$HOME/.local/share && mkdir -p ${XDG_DATA_HOME}
[ -z "${XDG_STATE_HOME}" ] && XDG_STATE_HOME=$HOME/.local/state && mkdir -p ${XDG_DATA_STATE}
[ -z "${XDG_RUNTIME_HOME}" ] && XDG_RUNTIME_HOME=$HOME/.local/run && mkdir -p ${XDG_RUNTIME_HOME}
set +a
