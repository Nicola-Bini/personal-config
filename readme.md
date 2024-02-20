```ln -s $HOME/assets/repos/dotfiles/nvim $HOME/.config/nvim ```

```ln -s $HOME/assets/repos/dotfiles/i3 $HOME/.config/i3 ```

```ln -s $HOME/assets/repos/dotfiles/alacritty/ $HOME/.config/alacritty```

```ln -s $HOME/assets/repos/dotfiles/alacritty $HOME/.config/alacritty```

```ln -s $HOME/assets/repos/dotfiles/.Xresources $HOME/.Xresources```

```ln -s $HOME/assets/repos/dotfiles/.gitconfig $HOME/.gitconfig```

```ln -s $HOME/assets/repos/dotfiles/packages.txt $HOME/.config/packages.txt```

```ln -s $HOME/assets/repos/dotfiles/polybar $HOME/.config/polybar```

# Arch
## Wifi
NetworkManager GUI
```nm-connection-editor```

nmcli - scan
```nmcli device wifi connect SSID password password```

nmcli - connect
```nmcli device wifi connect SSID password password```

## keyrepeat speed
```xset r rate 150 50```

## File explorer
```Thunar```
I should probably add an i3 shortcut for this.

## Screen
xrandr - scan
```xrandr```

xrandr - connect
```xrandr --output DP-3 --auto```
```xrandr --output DP-3 --mode 3840x2160 --rate 60 --primary```

## TODO:
- Add aliases for git and lazygit
e.g. ``` git add => g a ```
e.g. ``` lazygit => lg or g lz```
e.g. ``` git log <properties> => g l ```
- Set up UI to launch applications

# Neovim 
Activate copilot
```Copilot auth ```

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/.tmux/plugins/tpm

Resurrect
- `prefix + Ctrl-s` - save
- `prefix + Ctrl-r` - restore

## TODO:
- Add autocomplete (I think is cmp)


## Webcam
- Test video (might need to chang dev number)
```ffplay /dev/video0```

- Adjust settings
To list all video devices: [source](https://wiki.archlinux.org/title/webcam_setup)

```v4l2-ctl --list-devices```

```v4l2-ctl -d /dev/video0 --list-ctrls```

Alternatively, there is cameractrls (I didn't test this one)

```cameractrls -c brightness=128```
