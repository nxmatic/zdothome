
typeset -U path cdpath fpath manpath

for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

HELPDIR="/nix/store/ws4bcsbxrg68x22q43n4m4f093gy37xb-zsh-5.9/share/zsh/$ZSH_VERSION/help"



eval $(/nix/store/777bwihbjqqvlw8pal36vydlpsvzglw9-coreutils-9.1/bin/dircolors -b ~/.dir_colors)


# Oh-My-Zsh/Prezto calls compinit during initialization,
# calling it twice causes slight start up slowdown
# as all $fpath entries will be traversed again.
autoload -U compinit && compinit









# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY


if [[ $options[zle] = on ]]; then
  . /nix/store/apb0yw4nm1sgws2ri6kpzf7ic3jhh808-fzf-0.35.1/share/fzf/completion.zsh
  . /nix/store/apb0yw4nm1sgws2ri6kpzf7ic3jhh808-fzf-0.35.1/share/fzf/key-bindings.zsh
fi

eval "$(SHELL=zsh /nix/store/wa7pj4w819yyc3aic0sf343rkap8j0yv-keychain-2.8.5/bin/keychain --eval --quiet id_rsa)"

eval "$(/nix/store/6zqpyv17rkhqc603fcm7nvmgn4il25j8-direnv-2.32.1/bin/direnv hook zsh)"


# Aliases
alias vimdiff='nvim -d'

# Named Directory Hashes



