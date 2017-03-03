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
    . "$DOTFILES_DIR/install/brew.sh"
    . "$DOTFILES_DIR/install/pip.sh"
    open -a iTerm
    . "$DOTFILES_DIR/install/iTerm2.sh"
    . "$DOTFILES_DIR/install/macOS-terminal.sh"
fi


# ======================== Link files ============================
echo "Linking dotfiles..."

# ===================== Prezto ======================
. "$DOTFILES_DIR/install/prezto.sh"

# ==================== Tmux =====================
. "$DOTFILES_DIR/install/tmux.sh"

# ===================== Vim ======================
. "$DOTFILES_DIR/install/vim.sh"

# ========================= Git ======================
. "$DOTFILES_DIR/install/git.sh"

echo "Installation Completed!"
