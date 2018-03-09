#!/usr/bin/env bash

echo "============================================"
echo "Setup tmux config..."
echo "============================================"

tmux_dir="$DOTFILES_DIR/home/tmux"
[[ -f ${tmux_dir}/.tmux.conf ]] && ln -nfs ${tmux_dir}/.tmux.conf $HOME/.tmux.conf
[[ -f ${tmux_dir}/.tmux.conf.local ]] && ln -nfs ${tmux_dir}/.tmux.conf.local $HOME/.tmux.conf.local

cat << 'EOF' >> ${HOME}/.tmux.conf.local
set -g history-limit 10000
set -g status-keys vi
set -g mode-keys vi
setw -g mode-keys vi
bind e setw synchronize-panes on
bind E setw synchronize-panes off
EOF
