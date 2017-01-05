# Install iTerm2 theme

echo "============================================"
echo "Setup iTerm2 theme and profiles..."
echo "============================================"

profile_dir="$HOME/Library/Application\ Support/iTerm2/DynamicProfiles"
mkdir -p "$profile_dir"
/usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Gruvbox-dark' dict" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Merge 'home/iTerm2/gruvbox-dark.itermcolors' :'Custom Color Presets':'Gruvbox-dark'" ~/Library/Preferences/com.googlecode.iterm2.plist
cp "$DOTFILES_DIR/home/iTerm2/tian_li.iterm2.plist" "$profile_dir"

