# Dotfiles

These are the dotfiles I'm currently using on my computer. They're linked with `stow` and are updated when I reconfigure them. Things can break, so beware. These are mostly for my own use and not particularly made to be used by others.

## Usage

Start by donwloading all the required packages from your package manager. You can copy and paste the following commands for your distribution.

**Void Linux**

```bash
sudo xbps-install river waybar eww kitty nerd-fonts-symbols-ttf mako fuzzel zsh grim slurp libnotify pipewire swaybg
```

**Arch Linux**

```bash
sudo pacman -S river waybar kitty ttf-nerd-fonts-symbols mako fuzzel zsh grim slurp pipewire swaybg
paru -S eww
```

After that, clone the repository into your home directory and copy the contents over to your home directory.

```bash
git clone https://github.com/legoraft/dots.git
mv dots/* $HOME/
```

Launch `river` in the way you'd like to. I use [greetd](https://sr.ht/~kennylevinsen/greetd/) with [tuigreet](https://github.com/apognu/tuigreet) and run `dbus-run-session river` in Void Linux.

## Dependencies

For this configuration to work, you need to install the following dependencies (these are the names for [Void Linux](https://voidlinux.org)):

- `waybar`
- `river`
- `eww`
- `kitty`
- `nerd-fonts-symbols-ttf`
- `mako`
- `fuzzel`
- `zsh`
- `grim`
- `slurp`
- `swaybg`
- `libnotify`
- `pipewire`
