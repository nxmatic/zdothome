# Set p10k theme

plugin-load \
  ohmyzsh/ohmyzsh/lib/git.zsh \
  ohmyzsh/ohmyzsh/plugins/gitfast \
  romkatv/powerlevel10k


: To customize prompt, run `p10k configure` or edit : ${ZSH_THEME:=${ZDOTDIR}/.p10k.zsh}.

[[ -f "${ZSH_THEME}" ]] &&
    source "${ZSH_THEME}"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ${DOTFILES}/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
