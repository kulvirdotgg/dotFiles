#!/bin/zsh

# ---- Terminal ----
echo "Installing your Teminal and other thingies..."
brew install fastfetch
brew install font-meslo-lg-nerd-font
brew install fzf
brew install git
brew install kitty
brew install lsd
brew install neovim
brew install ripgrep
brew install starship
brew install stow
brew install tmux
brew install zoxide
brew install zsh-syntax-highlighting

echo "Creating symlinks using GNU STOW"
stow .

echo "Sourcing zsh config It should work now atleast"
source ~/.zshrc

# ---- Maybe sometimes idk ----
# brew install btop
# brew install oven-sh/bun/bun
# brew install go
# brew install node
# brew install pnpm
# brew install wezterm

# ---- Applications ----
echo "Installing the Applications..."
brew install --cask discord
brew install --cask docker
brew install --cask google-chrome
brew install --cask httpie
# brew install --cask keka
brew install --cask obsidian
brew install --cask raycast
brew install --cask spotify
brew install --cask telegram


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
echo "Install few apps from binaries,gfckin Ice installation method...\n"
