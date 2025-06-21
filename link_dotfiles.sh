#!/bin/bash

DOTFILES=~/.dotfiles

# Bash
ln -sf $DOTFILES/bash/.bashrc ~/.bashrc
ln -sf $DOTFILES/bash/.bash_aliases ~/.bash_aliases

# Neovim
rm -rf ~/.config/nvim
ln -sf $DOTFILES/nvim/.config/nvim ~/.config

# Starship
ln -sf $DOTFILES/starship/.config/starship.toml ~/.config/starship.toml

# Tmux
ln -sf $DOTFILES/tmux/.tmux.conf ~/.tmux.conf

echo "Symlinks created successfully!"
