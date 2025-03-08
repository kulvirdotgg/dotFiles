#!/bin/zsh

# ---- Terminal ----
echo "Installing your Teminal and other thingies..."
brew install git
brew install ghostty
brew install starship
brew install neovim
brew install font-jetbrains-mono-nerd-font
brew install tmux
brew install fzf
brew install lsd
brew install ripgrep
brew install zoxide
brew install lazygit
brew install fastfetch
brew install btop
brew install zsh-syntax-highlighting
brew install stow

echo "Creating symlinks using GNU STOW"
stow .

echo "Sourcing zsh config It should work now atleast"
source ~/.zshrc

echo "Installing languages & runtime envs etc..."
brew install oven-sh/bun/bun
brew install go
brew install node
brew install pnpm

# ---- Applications ----
echo "Installing the Applications..."
brew install --cask discord
brew install --cask docker
brew install --cask ghostty
brew install --cask httpie
brew install --cask keka
brew install --cask obsidian
brew install --cask raycast
brew install --cask spotify
brew install --cask zen-browser


yabai() {
    brew install koekeishiya/formulae/yabai
    brew install koekeishiya/formulae/skhd
    brew install FelixKratz/formulae/borders
    brew install FelixKratz/formulae/sketchybar
    
    yabai --start-service
    skhd --start-service
    brew services start borders
    brew services start sketchybar
}

install_yabai=false

for arg in "$@"; do
    if [ "$arg" = "--yabai" ]; then
        install_yabai=true
        break
    fi
done

if $install_yabai; then
    echo "Installing yabaiiiiiiiii...."
    yabai
fi

echo "setup complete...\n"
