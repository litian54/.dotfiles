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
  boost
  cmake
  ctags
  csshx
  cscope
  caskroom/cask/brew-cask
  findutils
  git
  gnupg
  go
  gotags
  highlight
  iperf
  jq
  lua
  luajit
  macvim
  npm
  openssl
  p11-kit
  pdsh
  python
  python3
  ruby
  reattach-to-user-namespace
  telnet
  tree
  tmux
  vim
  wget
  zsh
)

casks=(
  appcleaner
  firefox
  google-chrome
  iterm2
  java8
  mplayerx
  qq
  spectacle
  sublime-text
  the-unarchiver
  vagrant
  virtualbox
  wireshark
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
