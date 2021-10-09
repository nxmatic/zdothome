#!/usr/bin/env zsh

basedir=$(dirname ${0})

trap "rm -fr ${basedir}" 0 # no need further of this checkout

source $(dirname ${0})/.dotfiles.zsh
