# Set p10k theme

# To customize prompt, run `p10k configure` or edit : ${ZSH_THEME:=${ZDOTDIR}/.p10k.zsh}.

if [[ -r "${ZSH_THEME}" ]]; then
    source "${ZSH_THEME}"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ${DOTFILES}/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
