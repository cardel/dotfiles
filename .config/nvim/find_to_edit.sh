#!/bin/bash
# find files in the home folder (with a long ignore list)

exec 2>/dev/null
find "$HOME" -maxdepth 4 -a -type f \
    -readable \
    -writable \
    -not -path "$HOME/Public/*" \
    -not -path "$HOME/Music/*" \
    -not -path "$HOME/Downloads/*" \
    -not -path "$HOME/Pictures/*" \
    -not -path "$HOME/Private/*" \
    -not -path "$HOME/dotfiles/*" \
    -not -path "$HOME/Dropbox/*" \
    -not -path "$HOME/.dropbox/*" \
    -not -path "$HOME/.dropbox-dist/*" \
    -not -path "$HOME/.cache/*" \
    -not -path "$HOME/.java/*" \
    -not -path "$HOME/.npm/*" \
    -not -path "$HOME/.vim_runtime/*" \
    -not -path "$HOME/.ViberPC/*" \
    -not -path "$HOME/.mozilla/*" \
    -not -path "$HOME/.config/google-chrome*" \
    -not -path "$HOME/.config/microsoft-*" \
    -not -path "$HOME/.encryptfs/*" \
    -not -path "*/.Cache/*" \
    -not -path "*/Cache/*" \
    -not -path "*/Snapshots/*" \
    -not -path "*/.git/*" \
    -not -path "*/bin/*" \
    -not -path "*/node_modules/*" \
    -not -path "*/logs/*" \
    -not -iname "*.log" \
    -not -iname "*.so" \
    -not -iname "*.ttf" \
    -not -iname "*.otf" \
    -not -iname "*.pdf" \
    -not -iname "*.png" \
    -not -iname "*.jpg" \
    -not -iname "*.gif" \
    -not -iname "*.mp3" \
    -not -iname "*.mp4" \
    -not -iname "*.mkv" \
    -not -iname "*.avi" \
    -not -iname "*.ppt" \
    -not -iname "*.iso" \
    -not -iname "*.docx" \
    -not -iname "*.doc" \
    -not -iname "*.rtf" \
    -not -iname "*.pptx" \
    -not -iname "*.jpeg" \
    -not -iname "*.ods" \
    -not -iname "*.jnx" \
    -not -iname "*.sqlite" \
    -not -iname "*.unityweb" \
    -not -iname "*.swf" \
    -not -iname "*.jar" \
    -not -iname "*.inx" \
    -not -iname "*.html" \
    -not -iname "*.psd" \
    -not -iname "*.svg" \
    -not -iname "*.torrent" \
    -not -iname "*.dat" \
    -not -iname "*.xls" \
    -not -iname "*.webp" \
    -not -iname "*.rar" \
    -not -iname "*.zip" \
    -not -iname "*.tar" \
    -not -iname "*.gz" \
    -not -iname "*.7z" \
    -not -iname "*.tif" \
    -not -iname "*.db" \
    -not -iname "*.ldb" \
    -not -iname "*.sql" \
    -not -iname "*.ovpn" \
    -not -iname "*.p12" \
    -not -iname "*.awb" \
    -not -iname "*.exc" \
    -not -iname "*.exe" \
    -not -iname "*.lock" \
    -not -iname "*.pid" \
    -not -iname "*.sav" \
    -not -iname "*.vdi" \
    -not -iname "*.vbox" \
    -not -iname "*.dic"
