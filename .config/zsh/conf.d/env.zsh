### env - Setup environment.

# dotfiles
export DOTFILES=${DOTFILES:-~/.config/dotfiles}

# editors
export EDITOR=emacs
export VISUAL=emacs

# go
export GLOBALGOPATH=$HOME/Projects/golang
export GOPATH=$GLOBALGOPATH

# groovy
if [[ "$OSTYPE" == darwin* ]]; then
  export GROOVY_HOME=$HOMEBREW_PREFIX/opt/groovy/libexec  # per homebrew
  export GROOVY_TURN_OFF_JAVA_WARNINGS="true"
fi

# perl
# if [[ "$OSTYPE" == darwin* ]]; then
#   # eval "$(perl -I$XDG_DATA_HOME/perl5/lib/perl5 -Mlocal::lib=$XDG_DATA_HOME/perl5)"
#   export PERL_MB_OPT='--install_base "$XDG_DATA_HOME/perl5"'
#   export PERL_MM_OPT='INSTALL_BASE=$XDG_DATA_HOME/perl5'
#   if [[ ! -d $XDG_DATA_HOME/perl5 ]]; then
#     mkdir -p $XDG_DATA_HOME/perl5
#     cpan local::lib
#   fi
# fi

# Set $PATH.
path=(
  # core
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)

  # emacs
  $HOME/.emacs.d/bin(N)
  $HOME/.config/emacs/bin(N)

  # apps
  /{usr/local,opt/homebrew}/opt/curl/bin(N)
  /{usr/local,opt/homebrew}/opt/go/libexec/bin(N)
  /{usr/local,opt/homebrew}/share/npm/bin(N)
  /{usr/local,opt/homebrew}/opt/ruby/bin(N)
  /{usr/local,opt/homebrew}/lib/ruby/gems/*/bin(N)
  $HOME/.gem/ruby/*/bin(N)

  $path
)
