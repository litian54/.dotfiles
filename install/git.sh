#!/usr/bin/env bash

echo "============================================"
echo "Setup git config..."
echo "============================================"

gitconfig="$DOTFILES_DIR/home/git/gitconfig"
[[ -f ${gitconfig} ]] && ln -nfs ${gitconfig} $HOME/.gitconfig

gitignore="$DOTFILES_DIR/home/git/gitignore"
[[ -f ${gitignore} ]] && ln -nfs ${gitignore} $HOME/.gitignore
