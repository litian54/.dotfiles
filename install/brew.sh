#!/usr/bin/env bash
# Install Homebrew

echo "============================================"
echo " Run brew install && brew cask install ... "
echo "============================================"

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! brew doctor; then
  echo "\`brew doctor\` failed. Please resolve issues before continuing."
  exit 1
fi

brew tap homebrew/versions
brew update
brew upgrade

formulae=(
  cmake
  ctags
  csshx
  cscope
  caskroom/cask/brew-cask
  findutils
  git
  go
  gotags
  jq
  lua
  luajit
  macvim
  npm
  pdsh
  python
  python3
  ruby
  reattach-to-user-namespace
  tree
  tmux
  vim
  wget
  zsh
)

casks=(
  google-chrome
  iterm2
  java
  qq
  vagrant
#  virtualbox
  youdao
)

# brew tap | grep "cask" > /dev/null || brew tap caskroom/homebrew-cask

for formula in "${formulae[@]}"; do
  brew install $formula || brew upgrade $formula
done

brew linkapps

for cask in "${casks[@]}"; do
  brew cask install $cask
done

# brew cleanup
# brew cask cleanup
# 
# brew reinstall macvim --HEAD --with-cscope --with-lua --with-override-system-vim
