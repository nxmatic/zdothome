# Set p10k theme

# To customize prompt, run `p10k configure` or edit : ${ZSH_THEME:=nxmatic}

_theme="${ZDOTDIR}/themes/${ZSH_THEME:=default}~p10k.zsh-theme"
if [[ -r "${_theme}" ]]; then
    source "${_theme}"
fi
unset _theme

# Enable Powerlevel10k instant prompt. Should stay close to the top of ${DOTFILES}/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

