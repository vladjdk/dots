xcode-select --install

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

cp ./dots/.zshrc ~
cp ./.config ~
cp ./packages/CodeNewRoman* ~/Library/Fonts/

brew install git
brew install neovim
brew install fzf
brew install ripgrep
brew install fd
brew install --cask ghostty
