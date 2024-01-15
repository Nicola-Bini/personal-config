#!/bin/bash

# Automatically get the logged-in username
USERNAME=$(whoami)
DOT_FILES_BASE_DIR="/home/$USERNAME/assets/repos/dotfiles"

# Creating symbolic links
ln -s $DOT_FILES_BASE_DIR/nvim /home/$USERNAME/.config/nvim
ln -s $DOT_FILES_BASE_DIR/i3 /home/$USERNAME/.config/i3
ln -s $DOT_FILES_BASE_DIR/alacritty ~/.config/alacritty
ln -s $DOT_FILES_BASE_DIR/.Xresources ~/.Xresources
ln -s $DOT_FILES_BASE_DIR/.gitconfig ~/.gitconfig
ln -s $DOT_FILES_BASE_DIR/packages.txt ~/.config/packages.txt
ln -s $DOT_FILES_BASE_DIR/polybar ~/.config/polybar
ln -s $DOT_FILES_BASE_DIR/lazygit ~/.config/lazygit
ln -s $DOT_FILES_BASE_DIR/picom ~/.config/picom

echo "Symbolic links created successfully."

