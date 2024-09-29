# Dotfiles

These are the dotfiles I'm currently using on my computer. They're linked with `stow` and are updated when I reconfigure them. Things can break, so beware. These are mostly for my own use and not particularly made to be used by others.

## Use

To use the configs, you need to install the following packages (these are for [void linux](https://voidlinux.org) specifically):

- `waybar`
- `river`
- `eww`
- `foot`
- `nerd-fonts-symbols-ttf`
- `mako`
- `fuzzel`
- `zsh`

After this, you can just drop all the files from the repo into your `$HOME`. Don't clone the repo into your home directly, but copy them over. If you want to automatically update all changes, also install `stow` and run `stow .` in the cloned folder.
