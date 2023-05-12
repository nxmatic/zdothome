#
# antidote-init
#

# funcs used in .zplugins
function is-macos {
  [[ "$OSTYPE" == darwin* ]] || return 1
}

# Load antidote for plugin management.
local zplugins=$ZDOTDIR/.zplugins
export ANTIDOTE_HOME=${XDG_DATA_HOME:-~/.local/share}/antidote
if [[ ! -e $ANTIDOTE_HOME/mattmc3/antidote ]]; then
  echo "Cloning antidote..."
  git clone --quiet --depth 1 https://github.com/mattmc3/antidote $ANTIDOTE_HOME/mattmc3/antidote
  touch $zplugins
fi
source $ANTIDOTE_HOME/mattmc3/antidote/antidote.zsh

# Cache static antidote plugin file.
if [[ ! ${zplugins}.zsh -nt $zplugins ]] || [[ ! -d $ANTIDOTE_HOME ]]; then
  (antidote bundle < $zplugins >| ${zplugins}.zsh)
fi
source ${zplugins}.zsh
