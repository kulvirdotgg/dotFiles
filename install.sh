#!/bin/bash

# ---- Terminal ----

echo "Installing your Teminal and other thingies..."
yay -S git ghostty starship neovim ttf-jetbrains-mono-nerd tmux fzf lsd ripgrep zoxide lazygit fastfetch stow btop

echo "Creating symlinks using GNU STOW"
stow .

echo "changing default shell to z-shell"
sudo chsh -s $(which zsh)
source ~/.zshrc

yay -S bun-bin go node npm

# ---- Applications ----
echo "Installing the Applications..."
yay -S zen-browser-bin discord docker spotify

echo "setup complete...\n"
