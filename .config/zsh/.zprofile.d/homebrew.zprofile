command -v brew >/dev/null || \
  ( bash <(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh) &&
    brew bundle --global )
