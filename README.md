# Screenshot
<img src="images/2026-06-03_19-24-42.png"/>

## System Information 

| Component         | Value                                                                 | 
| ----------------- | ------------------------------------------------------------------ |
| OS | Arch Linux |
| Display Server | X11 |
| WM | Monsterwm |
| Terminal | Alacritty |
| Editor   | Neovim, Vim, Vi |
| Shell    | Zsh |
| Launcher | Dmenu |
| Font     | JetBrains Mono Nerd Font |

## Keybindings

| Key | Action |
|------|---------|
| Super + Enter | Open Terminal |
| Super + d | Launcher  |
| Super + e | Thunar  |
| Super + q | Close Window |
| Super + h/l | Focus Window |
| Super + Shift + q | Pkill Monster |
| Super + Shift + h/l | Resize Window Right/Left |
| Super + Shift + j/k | Resize Window Up/Down |
| Print | Screenshot Full |
| Shift + Print | sele Screenshot |
| Shift + 1-9   | DESKTOPCHANGEe |


# Install Package
```bash
sudo pacman -S fd git gcc cmake clang  base-devel fontconfig gtk-3.0 thunar alacritty kitty tmux fzf nvim vi vim xorg-server xorg-xinit xorg-xrandr xorg-setxkbmap wayland wayland-protocols pipewire pipewire-jack pipewire-audio pipewire-alsa pipewire-pulse mpv
```

# Install yay 
```bash
git clone https://aur.archlinux.org/yay.git
cd yay 
makepkg -si
```

# Yay Install Package
```bash
yay -S gvfs adobe-source-code-pro-fontsnoto-fonts-emojiotf-font-awesomettf-droidttf-fira-codettf-fantasque-nerdttf-jetbrains-monottf-jetbrains-mono-nerdttf-victor-mononoto-fonts brave-bin ttf-victor-mono wlroots-asan-git-debug thunar-archive-plugin thunar-bolman uzip udisk yt-dlp 

```

# Installation
```bash
 git clone https://github.com/kun20101922/Dotfiles.git
 cd Dotfiles
 cp -r .config ~/.config
```




