#!/usr/bin/env bash 

echo "============================================"
echo "Run apt-get install..."
echo "============================================"

sudo apt-get install -y python-pip python-dev build-essential cmake
sudo apt-get install -y vim zsh git tmux jq go exuberant-ctags npm

# Install gotags
command -v go >/dev/null 2>&1 && go get -u github.com/jstemmer/gotags
