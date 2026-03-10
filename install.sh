#!/bin/zsh

DOTS_DIR="$(cd "$(dirname "$0")" && pwd)"

# Xcode tools (only if not installed)
xcode-select -p &>/dev/null || xcode-select --install

# Oh My Zsh (only if not installed)
[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Homebrew (only if not installed)
command -v brew &>/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Dotfiles
cp -f "$DOTS_DIR/dots/.zshrc" ~ 2>/dev/null || true
cp -f "$DOTS_DIR/dev-session.sh" ~ 2>/dev/null || true
cp -f "$DOTS_DIR/.tmux.conf" ~ 2>/dev/null || true

# Fonts
mkdir -p ~/Library/Fonts
cp -f "$DOTS_DIR/packages"/CodeNewRoman* ~/Library/Fonts/ 2>/dev/null || true

# Neovim config
mkdir -p ~/.config
rm -rf ~/.config/nvim
cp -r "$DOTS_DIR/nvim" ~/.config/nvim

# Update brew and all existing packages
brew update || true
brew upgrade || true

install_or_upgrade() {
  if brew list "$1" &>/dev/null; then
    brew upgrade "$1" 2>/dev/null || true
  else
    brew install "$1"
  fi
}

install_or_upgrade_cask() {
  if brew list --cask "$1" &>/dev/null; then
    brew upgrade --cask "$1" 2>/dev/null || true
  else
    brew install --cask "$1" 2>/dev/null || true
  fi
}

# CLI tools
install_or_upgrade git
install_or_upgrade neovim
install_or_upgrade tmux
install_or_upgrade lazygit
install_or_upgrade fzf
install_or_upgrade ripgrep
install_or_upgrade fd
install_or_upgrade go
install_or_upgrade node
install_or_upgrade yarn
install_or_upgrade nvm

# Apps
install_or_upgrade_cask ghostty
install_or_upgrade_cask orbstack
install_or_upgrade_cask goland
install_or_upgrade_cask bitwarden
