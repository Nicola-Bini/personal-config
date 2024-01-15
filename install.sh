#!/bin/bash

# Automatically get the logged-in username
USERNAME=$(whoami)
DOT_FILES_BASE_DIR="/home/$USERNAME/assets/repos/dotfiles"

# Function to create symbolic link if it doesn't exist
create_link() {
    if [ ! -L "$2" ]; then
        ln -s "$1" "$2"
        echo "Link created for $2"
    else
        echo "Link for $2 already exists, skipping."
    fi
}

# Creating symbolic links
create_link "$DOT_FILES_BASE_DIR/nvim" "/home/$USERNAME/.config/nvim"
create_link "$DOT_FILES_BASE_DIR/tmux" "/home/$USERNAME/.config/tmux"
create_link "$DOT_FILES_BASE_DIR/i3" "/home/$USERNAME/.config/i3"
create_link "$DOT_FILES_BASE_DIR/alacritty" "/home/$USERNAME/.config/alacritty"
create_link "$DOT_FILES_BASE_DIR/.Xresources" "/home/$USERNAME/.Xresources"
create_link "$DOT_FILES_BASE_DIR/.gitconfig" "/home/$USERNAME/.gitconfig"
create_link "$DOT_FILES_BASE_DIR/packages.txt" "/home/$USERNAME/.config/packages.txt"
create_link "$DOT_FILES_BASE_DIR/polybar" "/home/$USERNAME/.config/polybar"
create_link "$DOT_FILES_BASE_DIR/lazygit" "/home/$USERNAME/.config/lazygit"
create_link "$DOT_FILES_BASE_DIR/picom" "/home/$USERNAME/.config/picom"

echo "Symbolic link creation process completed."
