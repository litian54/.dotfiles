#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Init and update submodules
# Init
git submodule update --init --recursive
# Upadte
git submodule update --recursive

# Install fonts
. "$DOTFILES_DIR/fonts/install.sh"

echo "Installing apps..."
# OS detect
unamestr=$(uname)
# ================ Linuxi(Ubuntu) ================
if [[ "$unamestr" == 'Linux' ]]; then
    . "$DOTFILES_DIR/install/apt-get.sh"
    . "$DOTFILES_DIR/install/pip.sh"

# ================ macOS ================
elif [[ "$unamestr" == 'Darwin' ]]; then
#    . "$DOTFILES_DIR/install/brew.sh"
#    . "$DOTFILES_DIR/install/pip.sh"

    # Install iTerm2 theme
    profile_dir="$HOME/Library/Application\ Support/iTerm2/DynamicProfiles"
    mkdir -p $profile
    /usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Gruvbox-dark' dict" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Merge 'home/iTerm2/gruvbox-dark.itermcolors' :'Custom Color Presets':'Gruvbox-dark'" ~/Library/Preferences/com.googlecode.iterm2.plist
    cp "$DOTFILES_DIR/home/iTerm2/tian_li.iterm2.plist" "$profile_dir"

    # Install macOS-terminal theme
    /usr/libexec/PlistBuddy -c "Set :'Default Window Settings' 'Gruvbox-dark.tian_li'" ~/Library/Preferences/com.apple.Terminal.plist
    /usr/libexec/PlistBuddy -c "Set :'Startup Window Settings' 'Gruvbox-dark.tian_li'" ~/Library/Preferences/com.apple.Terminal.plist
    /usr/libexec/PlistBuddy -c "Add :'Window Settings':'Gruvbox-dark.tian_li' dict" ~/Library/Preferences/com.apple.Terminal.plist
    /usr/libexec/PlistBuddy -c "Merge 'home/macOS-terminal/Gruvbox-dark.tian_li.plist' :'Window Settings':'Gruvbox-dark.tian_li'" ~/Library/Preferences/com.apple.Terminal.plist

fi


# ======================== Link files ============================
echo "Linking dotfiles..."

# ===================== Prezto ======================
prezto="$DOTFILES_DIR/home/zsh/prezto"
[[ -d ${prezto} ]] && ln -nfs ${prezto} ${ZDOTDIR:-$HOME}/.zprezto
zsh=$(which zsh)
zsh -x "$DOTFILES_DIR/install/prezto.zsh"
chsh -s /bin/zsh

# Override .zpreztorc
prezto_override="$DOTFILES_DIR/home/zsh/prezto-override/zpreztorc"
[[ -f ${prezto_override} ]] && ln -nfs ${prezto_override} "${ZDOTDIR:-$HOME}/.zpreztorc"

# ==================== Tmux =====================
tmux="$DOTFILES_DIR/home/tmux/tmux.conf"
[[ -f ${tmux} ]] && ln -nfs ${tmux} $HOME/.tmux.conf

# ===================== Vim ======================
# vimrc
vimrc="$DOTFILES_DIR/home/vim/vimrc"
[[ -f ${vimrc} ]] && ln -nfs ${vimrc} $HOME/.vimrc

# Vundles
vundle="$DOTFILES_DIR/home/vim/vundles.vim"
mkdir -p ~/.vim && ln -nfs ${vundle} ~/.vim/vundles.vim
vim -E -u $HOME/.vimrc +qall

# ========================= Git ======================
gitconfig="$DOTFILES_DIR/home/git/gitconfig"
[[ -f ${gitconfig} ]] && ln -nfs ${gitconfig} $HOME/.gitconfig

echo "Installation Completed!"
