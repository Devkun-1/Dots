# Screenshot
<img src="images/2026-06-03_19-24-42.png"/>

# Monster
<img src="images/2026-06-03_22-22-30.png"/>

# Neovim
<img src="images/2026-06-03_22-13-25.png"/>

# Terminal Tmux
<img src="images/2026-06-03_22-42-38.png"/>


## System Information 

| Component         | Value                                                                 | 
| ----------------- | ------------------------------------------------------------------ |
| OS | Arch Linux |
| Display Server | X11, Wayland |
| WM | Monsterwm, Dwm, Dwl |
| Terminal | Alacritty, Kitty |
| Editor   | Neovim, Vim, Vi |
| Shell    | Zsh |
| Launcher | Dmenu, Wmenu |
| Font     | JetBrains Mono Nerd Font |
| Package Manager   | pacman, yay |

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

## Features

- Minimal MonsterWM workflow
- Keyboard-driven navigation
- Fastfetch integration
- Neovim-centric development setup
- Alacritty terminal
- MPV media integration
- Lightweight and low resource usage

## Installation
```bash
git clone https://github.com/kun20101922/Dotfiles.git
cd Dotfiles

# Backup existing files
mv ~/.zshrc ~/.zshrc.bak 2>/dev/null
mv ~/.xinitrc ~/.xinitrc.bak 2>/dev/null

# Copy Configuration
cp -rv .config/* ~/.config
cp -rv .zshrc ~/.zshrc
cp -rv .xinitrc ~/.xinitrc
```

## Installation yay
```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## Dependencies

### Base Development
```bash
sudo pacman -S --needed \
    base-devel git gcc clang cmake
```

### Terminal & Tools
```bash
sudo pacman -S --needed \
   alacritty kitty tmux fzf fd vifm 
```

### Editors
```bash
sudo pacman -S --needed \
   neovim vim vi  
```

### X11
```bash
sudo pacman -S --needed \
    xorg-server xorg-xinit xorg-xranr xorg-setxkbmap
```

### Wayland
```bash
sudo pacman -S --needed \
    wayland wayland-protocols
```

### Wallpaper
```bash
sudo pacman -S --needed \
    feh
```

### Audio
```bash
sudo pacman -S --needed \
    pipewire pipewire-alsa pipewire-pulse pipewire-jack
```

### Files Manager
```bash
sudo pacman -S --needed \
    thuar 
```

### Media
```bash
sudo pacman -S --needed \
    mpv yt-dlp ytfzf 
```

### Media
```bash
sudo pacman -S --needed \
    mpv yt-dlp ytfzf 
```

### Fonts
```bash
yay -S \
    adobe-source-code-pro-fonts \
    noto-fonts-emoji \
    otf-font-awesome \
    ttf-droid \
    ttf-fira-code \
    ttf-jetbrains-mono \
    ttf-jetbrains-mono-nerd \
    ttf-victor-mono \
    brave-bin \
```




