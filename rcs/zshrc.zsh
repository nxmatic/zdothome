# load zprof first if we need to profile
[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# ZFunctions

source $ZDOTDIR/plugins/zfunctions/zfunctions.plugin.zsh

zdot-debug enter

# Libs
for zfile in $ZDOTDIR/lib/*.zsh(N); source $zfile; unset zfile

# plugins
function {
    local _customplugins
    local _custompluginsdefer

    zstyle -a ':zsh_custom:plugins:list' 'main'  '_custompluginsmain'
    zstyle -a ':zsh_custom:plugins:list' 'defer' '_custompluginsdefer'
    
    declare -au myplugins

    myplugins=(
	# load plugins
	zfunctions
	prompt
	clipboard
	directory
	editor
	history
	utility
	terminal
	#z
	homebrew
	macos
	python
	completion
	$_custompluginsmain
	
	_defer_
	abbreviations
	syntax-highlighting
	autosuggestions
	history-substring-search
	$_custompluginsdefer
    )

    source <(plugin-script $myplugins)
}

# local settings
[[ ! -f $DOTFILES.local/zsh/zshrc_local.zsh ]] || source $DOTFILES.local/zsh/zshrc_local.zsh

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }

zdot-debug leave
