![Screenshot](https://raw.githubusercontent.com/coffebar/dotfiles/master/screenshot.png)

<div align="center">

![](https://img.shields.io/github/last-commit/coffebar/dotfiles?style=flat-square&logo=)
![](https://img.shields.io/github/stars/coffebar/dotfiles?style=flat-square&logo=)
[![](https://img.shields.io/github/repo-size/coffebar/dotfiles?style=flat-square&logo=)](https://github.com/iamverysimp1e/dots)

</div>

# dotfiles backup

## Overview


- [🌿 Window Mangers]():
  - [🍚 Hyprland](https://github.com/hyprwm/Hyprland)
  - [🍙 i3](https://i3wm.org/)
- [👽 Terminal]():
  - :robot: Emulator:
    - [Alacritty](https://alacritty.org/) with *JetBrains Mono* font
  - [🌌 Shell](#shell): Zsh with [OhMyZsh](https://github.com/ohmyzsh/ohmyzsh)
- [✏️ Code Editors]():
  - [💫 Neovim](https://neovim.io/)
- [:art: Themes]():
  - :desktop_computer: Arc-Dark GTK theme
  - :basecamp: Breeze Dark Icons
  - :small_red_triangle: bloom cursor
  - :large_blue_diamond: Neovim: [onedark](https://github.com/navarasu/onedark.nvim)
  - :new_moon_with_face: Telegram: [arcdarkgrey](https://t.me/addtheme/arcdarkgrey)

- [:pushpin: Bars]():
  - :womans_hat: [waybar](https://github.com/Alexays/Waybar)
  - :tophat: [polybar](https://github.com/polybar/polybar)


<details><summary><h2>Interesting features</h2></summary>

#### i3


- Automatic tiling via [autotiling](https://github.com/nwg-piotr/autotiling) script. Split direction depends on the currently focused window dimensions.

- Some of wm's binds improved by Lua script. Lua has more flexibility than i3config syntax. I like to switch automatically to the appropriate workspace after opening programs using a keyboard shortcut.

- ``Super + ` `` open ssh servers menu to connect.

- ``Super + \ `` open fuzzy finder to search for local text files in the home directory to edit in Neovim.

- Automatic tiling freed up ``Super + H`` shortcut. So I'm using HJKL to navigate inside WM.

- UI scale options depends on current display setup and [autorandr](https://github.com/phillipberndt/autorandr) profile name.


#### Common

- ``Alt + f`` open a file manager in that directory what was found in clipboard. For example, if you copied a file from some program, you can open its directory just by pressing this shortcut.

- Neovim [opens](https://github.com/coffebar/dotfiles/blob/master/.config/nvim/lua/commands.lua) popular image formats in external viewer ([pix](https://github.com/linuxmint/pix)) instead of binary view.

- Mouse side buttons bound to copy and paste in graphics applications. Although I try to use the mouse less, it's useful for (web)apps with mouse-centric UI.

- CapsLock is changed to Backspace.

- Nice aliases: i to install package, 'md2pdf' to convert markdown file to pdf, v to open Neovim. 

- Not using Display Managers.

- ``Ctrl + m`` bind simplifies sequence ``Ctrl + l, Ctrl + v, Return`` to interact with file-picker dialog by selecting file from clipboard blazing fast.

- ``Super + P`` pull dotfiles from this repo and show notification with icon.

</details>

<details><summary>
<h2>Restore backup</h2>
</summary>


### Please don't do this without understanding all files and commands! 

Note: before proceed you need to create or restore ssh keys and install git 

### Download config files and install packages from AUR
```bash
git clone --bare git@github.com:coffebar/dotfiles.git dotfiles
git --git-dir=$HOME/dotfiles --work-tree=$HOME config --local core.worktree $HOME

# install yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd .. && rm -rf yay
yay -Y --gendb

# install packages
yay -S --needed - < pkglist.txt

# enable services
sudo systemctl enable --now input-remapper docker tlp ufw bluetooth systemd-resolved.service autorandr
# add firewall rule
sudo ufw default deny incoming
sudo ufw allow syncthing
sudo ufw enable

# install ohmyzsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# copy ksnip config
cp -f ~/.config/ksnip/ksnip.example.conf ~/.config/ksnip/ksnip.conf

```

### GTK options

Next options will tell GTK-based apps to prefer Dark theme and open file chooser by default in the home directory.
```bash
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gtk.Settings.FileChooser startup-mode cwd
gsettings set org.gtk.gtk4.Settings.FileChooser startup-mode cwd
# cursor and icon themes
gsettings set org.gnome.desktop.interface cursor-theme 'bloom'
gsettings set org.gnome.desktop.interface icon-theme 'bloom-classic'

```

### Neovim plugins and dependencies
Run this script to sync Neovim config from this repo. It can be used separately on Arch systems.
```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/coffebar/dotfiles/master/fetch-nvim-conf.sh)"
```

</details>



