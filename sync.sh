#!/bin/bash

cp -R vscode-nvim/. ~/.config/vscode-nvim/
echo " ✅ vscode-nvim synced successfully"

cp "$(dirname "$0")/karabiner.edn" "$HOME/.config/karabiner.edn"
echo " ✅ karabiner.edn synced successfully"