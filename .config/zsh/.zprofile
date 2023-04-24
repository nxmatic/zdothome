{
  setopt local_options

  fpath+=(${ZDOTDIR}/functions)

  autoload -Uz zsh_host_source

  zsh_host_source ${ZDOTDIR}/.zprofile
}
