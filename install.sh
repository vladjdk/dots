#!/bin/zsh

DOTS_DIR="$(cd "$(dirname "$0")" && pwd)"

xcode-select --install

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Dotfiles
cp "$DOTS_DIR/dots/.zshrc" ~
cp "$DOTS_DIR/dev-session.sh" ~
cp "$DOTS_DIR/.tmux.conf" ~

# Fonts
cp "$DOTS_DIR/packages"/CodeNewRoman* ~/Library/Fonts/

# Neovim config
rm -rf ~/.config/nvim
cp -r "$DOTS_DIR/nvim" ~/.config/nvim

# Update brew and all existing packages
brew update
brew upgrade

# CLI tools
brew install git
brew install neovim
brew install tmux
brew install lazygit
brew install fzf
brew install ripgrep
brew install fd
brew install go
brew install node
brew install yarn
brew install nvm

# Apps
brew install --cask ghostty
brew install --cask orbstack
brew install --cask goland
brew install --cask bitwarden
