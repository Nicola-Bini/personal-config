```ln -s /home/*username*/documents/repos/nvim /home/*username*/.config/nvim ```

```ln -s /home/*username*/documents/repos/i3 /home/*username*/.config/i3 ```

# Arch
## Wifi
NetworkManager GUI
```nm-connection-editor```

nmcli - scan
```nmcli device wifi connect SSID password password```

nmcli - connect
```nmcli device wifi connect SSID password password```

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
