#!/usr/bin/env bash

echo "============================================"
echo "Setup vimrc and vundles..."
echo "============================================"

# vimrc
vimrc="$DOTFILES_DIR/home/vim/vimrc"
[[ -f ${vimrc} ]] && ln -nfs ${vimrc} $HOME/.vimrc

# Vundles
vundle="$DOTFILES_DIR/home/vim/vundles.vim"
mkdir -p ~/.vim && ln -nfs ${vundle} ~/.vim/vundles.vim
vim -E -u $HOME/.vimrc +qall

command -v npm >/dev/null 2>&1 &&  npm -g install instant-markdown-d
