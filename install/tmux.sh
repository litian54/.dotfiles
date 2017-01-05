#!/usr/bin/env bash

echo "============================================"
echo "Setup tmux config..."
echo "============================================"

tmux="$DOTFILES_DIR/home/tmux/tmux.conf"
[[ -f ${tmux} ]] && ln -nfs ${tmux} $HOME/.tmux.conf
