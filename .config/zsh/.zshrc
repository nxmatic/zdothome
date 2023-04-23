#!/bin/zsh
##? .zshrc - Run on interactive Zsh session.

: ${ZDOTDIR:=${0:h:a}}

# load zprof first if we need to profile
[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"
alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'

# Load zfunctions.xs
setopt source_trace
fpath=($ZDOTDIR/functions $fpath)
autoload -Uz $fpath[1]/*(.:t)

# get minmalist zsh_unplugged plugin manager
[[ -d $ZDOTDIR/.unplugged ]] ||
  git clone git@github.com:mattmc3/zsh_unplugged $ZDOTDIR/.unplugged
source $ZDOTDIR/.unplugged/zsh_unplugged.zsh

# get zephyr
[[ -d $ZDOTDIR/.zephyr ]] ||
  git clone --recursive https://github.com/mattmc3/zephyr $ZDOTDIR/.zephyr

# clone-only plugins
path+=$ZUNPLUG_REPOS/romkatv/zsh-bench
(( $+commands[zsh-bench] )) || plugin-clone romkatv/zsh-bench

# load plugins
#typeset -a plugins=(${(f)$(<"${ZDOTDIR}"/zplugins)})

ZPLUGINS=(

  # Load customizations.
  $ZDOTDIR/.zstyles
  $ZDOTDIR/.zaliases
  $ZDOTDIR/.zephyr

  # plugins and host setup

  zrunparts
  zdotfiles

  # local plugins
  xdg
  # utility
  homebrew

  # regular plugins
  mattmc3/zfunctions
  mattmc3/zman
  rupa/z

  # oh-my-zsh plugins
  ohmyzsh/ohmyzsh/lib/clipboard.zsh
  ohmyzsh/ohmyzsh/plugins/copyfile
  ohmyzsh/ohmyzsh/plugins/copypath
  ohmyzsh/ohmyzsh/plugins/copybuffer
  ohmyzsh/ohmyzsh/plugins/magic-enter
  ohmyzsh/ohmyzsh/plugins/fancy-ctrl-z
  ohmyzsh/ohmyzsh/plugins/extract

  # prezto replacements
  zshzoo/environment
  zshzoo/terminal
  zshzoo/editor
  zshzoo/history
  zshzoo/directory
  zshzoo/macos

  # prompt
  # sindresorhus/pure
  # starship
  powerlevel10k

  # last
  zsh-users/zsh-completions
  zshzoo/compinit
  zshzoo/compstyle

  $ZDOTDIR/.zopts

  # deferred
  romkatv/zsh-defer
  olets/zsh-abbr
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-history-substring-search
)
plugin-load $ZPLUGINS

# Enable Powerlevel10k instant prompt. Should stay close to the top of ${DOTFILES-~}/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Done profiling.
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
