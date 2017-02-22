#  macOS-terminal theme

echo "============================================"
echo "Setup macOS Terminal profile..."
echo "============================================"

/usr/libexec/PlistBuddy -c "Set :'Default Window Settings' 'Gruvbox-dark.tian_li'" ~/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Startup Window Settings' 'Gruvbox-dark.tian_li'" ~/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Add :'Window Settings':'Gruvbox-dark.tian_li' dict" ~/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Merge 'home/macOS-terminal/Gruvbox-dark.tian_li.plist' :'Window Settings':'Gruvbox-dark.tian_li'" ~/Library/Preferences/com.apple.Terminal.plist

