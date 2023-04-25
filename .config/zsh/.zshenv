[[ -n "${_zdotenv}" ]] &&
    echo "zshenv already loaded" >&2 &&
    print -l ${path} &&
    return 1

_zdotenv=${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/.zshenv.d

function {

    # bootstrap

    setopt local_options all_export &&
      source ${_zdotenv}/zdot.zshenv &&
      zsh_rcload ${_zdotenv}
}

unset _zdotenv
