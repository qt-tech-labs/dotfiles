#!/bin/bash

set -euo pipefail

echo "🚀 Setting up Mac..."

# Install Homebrew if it isn't installed
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
brew update

# CLI tools
brew install \
    wget \
    jq \
    node \
    neovim \
    yqrashawn/goku/goku \
    tree \
    lazygit \
    gh

echo "🚀 Turning off press-and-hold to enable key repeat in VSCode!"

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

echo "🚀 Git configuration"
git config --global user.email "trung.b.nguyen@rakuten.com"
git config --global user.name "Trung Nguyen"
echo "✅ Git configuration set successfully"

echo "✅ Tool complete!"


# GUI applications
install_cask() {
    local cask="$1"
    local app="$2"

    if brew list --cask "$cask" &>/dev/null; then
        echo "✓ $cask already installed"
        return
    fi

    if [ -n "$app" ] && [ -d "/Applications/$app.app" ]; then
        echo "✓ $app already exists in /Applications"
        return
    fi

    echo "→ Installing $cask..."
    brew install --cask "$cask" || {
        echo "⚠️ Failed to install $cask, continuing..."
    }
}

install_cask "zen" "Zen"
install_cask "viber" "Viber"
install_cask "visual-studio-code" "Visual Studio Code"
install_cask "karabiner-elements" "Karabiner"
install_cask "hammerspoon" "Hammerspoon"


echo "🚀 Syncing vscode extension..."
code --install-extension asvetliakov.vscode-neovim
code --install-extension patbenatar.advanced-new-file
code --install-extension tompollak.lazygit-vscode
code --install-extension github.vscode-pull-request-github
echo "✅ vscode extension install successfully"

echo "🚀 Syncing vscode-nvim configuration..."
cp -R vscode-nvim/. ~/.config/vscode-nvim/
echo " ✅ vscode-nvim synced successfully"

echo "🚀 Setup keyboard..."

cp "$(dirname "$0")/karabiner.edn" "$HOME/.config/karabiner.edn"

echo "✅ Karabiner configuration installed."
echo "⚠️  Do run goku to complete the keyboard setup"

echo "🚀 Setting up Codex..."

curl -fsSL https://developer-backend.ai.public.rakuten-it.com/coding-agent-setup/install.sh | sh -s -- --agent=codex

echo "🚀 Setup alias"

cat << 'EOF' >> ~/.zshrc

# Navigation Aliases
alias back='cd ..'
alias project='cd ~/Projects'
alias per='cd ~/Personal'
EOF
source ~/.zshrc

echo "✅ Bash alias complete!"

echo "✅✅✅✅✅✅Mac setup complete!"

