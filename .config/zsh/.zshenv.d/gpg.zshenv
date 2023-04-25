# -*- mode: shell-script -*-

: ${GNUPGHOME:=${XDG_DATA_HOME}/gnupg} &&
: ${SSH_AUTH_SOCK:=$(gpgconf --list-dirs agent-ssh-socket)}


