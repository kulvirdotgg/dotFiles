#!bin/zsh

echo "Installing commandline tools..."
xcode-select --install

echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# ---- Terminal ----
echo "Installing your Teminal and other thingies..."
brew install git
brew install kitty
brew install lsd
brew install neovim
brew install ripgrep
brew install starship
brew install stow
brew install tmux
brew install wezterm
brew install zoxide
brew install zsh-fast-syntax-highlighting

(cd dotFiles && stow .)

echo "Installing tmux package manager...."
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# ---- Essentials ----
brew install btop
brew install oven-sh/bun/bun
brew install fastfetch
brew install font-meslo-lg-nerd-font
brew install go
brew install node
brew install pnpm

# ---- Applications ----
echo "Installing the Applications..."
brew install --cask discord
brew install --cask google-chrome
brew install --cask httpie
brew install --cask keka
brew install --cask obsidian
brew install --cask raycast
brew install --cask spotify
brew install --cask telegram


yabai() {
    brew install koekeishiya/formulae/yabai
    brew install koekeishiya/formulae/skhd
    brew install FelixKratz/formulae/borders
    brew install sketchybar
    
    yabai --restart-service
    skhd --restart-service
    brew services start borders
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
echo "Install few apps from binaries, fckin Ice installation method...\n"
