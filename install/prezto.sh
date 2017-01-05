#!/usr/bin/env bash

echo "============================================"
echo "Setup Prezto for Zsh..."
echo "============================================"

prezto="$DOTFILES_DIR/home/zsh/prezto"
[[ -d ${prezto} ]] && ln -nfs ${prezto} ${ZDOTDIR:-$HOME}/.zprezto

tmpfile=$(mktemp /tmp/abc-script.XXXXXX)
cat << 'EOF' > ${tmpfile}
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "${rcfile}" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
EOF
command -v zsh >/dev/null 2>&1 && zsh -x "${tmpfile}"
#rm "${tmpfile}"

chsh -s /bin/zsh

# Override .zpreztorc
prezto_override="$DOTFILES_DIR/home/zsh/prezto-override/zpreztorc"
[[ -f ${prezto_override} ]] && ln -nfs ${prezto_override} "${ZDOTDIR:-$HOME}/.zpreztorc"
