# Dotfiles

## Overview

This repository conatins my personal dotfiles.

It uses [Dotbot][dotbot] for installation.

## How to use

Simply run `sudo install`.

If `--install-pkgs` is passed as the first argument, `pacaur` will be bootstraped and the packages in `pacman.lst` and `aur.lst` will be installed.

To create `pacman.lst` and `aur.lst`, run:
```
pacman -Qqe | grep -v "$(pacman -Qqm)" > pacman.lst
pacman -Qqm > aur.lst
```

## The setup

```
Linux Distro: archlinux
Display Manager: cdm
Window Manager: i3-gaps
Launcher: Rofi
Terminal Emulator: konsole
Shell: bash
File Manager: ranger (cli), thunar (gui)
Text Editor: vim
Music Player: cmus
Web Browsers: firefox
Video Player: mpv
Photo Browser: gpicview
Torrent Client: transmission-remote-cli
IRC Client: weechat
PDF Viewer: mupdf
Mail: mutt
```

[dotbot]: https://github.com/anishathalye/dotbot
