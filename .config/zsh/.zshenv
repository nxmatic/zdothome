set -ae

# xdg defaults required

: ${XDG_DATA_HOME:=${HOME}/.local/share}

# gnupg

: ${GNUPGHOME:=${XDG_DATA_HOME}/gnupg} &&
: ${SSH_AUTH_SOCK:=$(gpgconf --list-dirs agent-ssh-socket)}

# zdot

: ${ZDOTGIT:=${XDG_DATA_HOME}/zdot.git}
: ${ZDOTDIR:=${0:a:h}}
: ${ZSH_THEME:=nxmatic}

set +ae
 
