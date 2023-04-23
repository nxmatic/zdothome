exec 3>&2 2>/tmp/zprofile~zdotdir &&
  : ${0} $(pwd) &&
  set +x

set +x &&
  exec 2>&3 3>&-
