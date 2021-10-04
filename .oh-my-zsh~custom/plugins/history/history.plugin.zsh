HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

setopt bang_hist                 # Treat the '!' character specially during expansion.
setopt extended_history          # write the history file in the ":start:elapsed;command" format.
setopt inc_append_history        # write to the history file immediately, not when the shell exits.
setopt share_history             # share history between all sessions.
setopt hist_expire_dups_first    # expire duplicate entries first when trimming history.
setopt hist_ignore_dups          # don't record an entry that was just recorded again.
setopt hist_ignore_all_dups      # delete old recorded entry if new entry is a duplicate.
setopt hist_find_no_dups         # do not display a line previously found.
setopt hist_ignore_space         # don't record an entry starting with a space.
setopt hist_save_no_dups         # don't write duplicate entries in the history file.
setopt hist_reduce_blanks        # remove superfluous blanks before recording entry.
setopt hist_verify               # don't execute immediately upon history expansion.
setopt hist_beep                 # beep when accessing nonexistent history.

# if [ /home/my/zsh/hist/file -lt 64000 ]; then
#     echo "History file is lower than 64 kbytes, restoring backup..."
#     cp -f /mybackup/histfile $HISTFILE
# fi
