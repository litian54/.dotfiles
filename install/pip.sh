#!/usr/bin/env bash

echo "============================================"
echo "Run pip install..."
echo "============================================"

command -v pip >/dev/null 2>&1 && pip install -r "$DOTFILES_DIR/install/requirements.txt"
