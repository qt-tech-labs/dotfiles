#!/bin/bash

echo "🚀 Starting Mac setup..."
set -euo pipefail

echo "🚀 Setting up Mac..."

# Install Homebrew if it isn't installed
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "🚀 Configuring Homebrew environment..."
echo >> /Users/trung.b.nguyen/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/trung.b.nguyen/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
echo "✅ Homebrew environment configured"

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
git config --local user.email "trung.nguyen@rak.com"
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
code --install-extension openai.chatgpt
code --install-extension anthropic.claude-code


echo "✅ vscode extension install successfully"

echo "🚀 Syncing vscode-nvim configuration..."

# create .config if not exists
mkdir -p ~/.config/vscode-nvim

cp -R vscode-nvim/. ~/.config/vscode-nvim/
echo " ✅ vscode-nvim synced successfully"

echo "🚀 Setup keyboard..."

cp "$(dirname "$0")/karabiner.edn" "$HOME/.config/karabiner.edn"

echo "✅ Karabiner configuration installed."

echo "🚀 Setting up Codex..."

curl -fsSL https://developer-backend.ai.public.rakuten-it.com/coding-agent-setup/install.sh | sh -s -- --agent=codex

echo "🚀 Setup alias"

mkdir ~/Projects
mkdir ~/Personal

cat << 'EOF' >> ~/.zshrc

# Navigation Aliases
alias back='cd ..'
alias project='cd ~/Projects'
alias per='cd ~/Personal'
alias home='cd ~'
EOF
source ~/.zshrc

echo "✅ Bash alias complete!"

echo "✅✅✅✅✅✅Mac setup complete!"
echo "⚠️  Adding vscode-nvim config: ~/.config/vscode-nvim/init.lua"
echo "⚠️  Do run goku to complete the keyboard setup"
