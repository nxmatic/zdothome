# install brew-file wrapper

if [ -f $(brew --prefix)/etc/brew-wrap ];then
   source $(brew --prefix)/etc/brew-wrap
fi

# install homebrew installed in path
path=(
      $HOMEBREW_PREFIX/opt/curl/bin(N)
			       ;;  $HOMEBREW_PREFIX/opt/go/libexec/bin(N)
			       ;;  $HOMEBREW_PREFIX/opt/ruby/bin(N)
			       ;;  $HOMEBREW_PREFIX/lib/ruby/gems/*/bin(N)
			       ;;  $HOME/.gem/ruby/*/bin(N)
			       
)
