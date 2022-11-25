<h1 align = "center">Legoraft's dotfiles</h1>

These are the dotfiles I'm currently working on, I'm mainly working to make my awesome config as beautiful and functional as possible, taking the wallpaper as inspiration. As of commit [2229a0e](https://github.com/legoraft/dots/commit/2229a0e8ce2df88da9ebd5bcf45dfb666e21aa01), this awesome config could be somewhat functional, but I advise not to use it as some features still aren't there, like minimizing and an app launcher.

The rofi and neovim configs are some things I've worked on, the rofi config is going to be the launcher for my awesome config, and when I've worked out if I'm going to use emacs or neovim, I'll make an extensive config for either.

## Firefox

<img src="https://github.com/legoraft/dots/blob/main/assets/firefox.png" width="40%" align="right">

I'm currently working on exporting my theme to the firefox addon site, but the `userContent.css` and `prefs.js` work. 

To install those, enable  go to `about:config` and enable `toolkit.legacyUserProfileCustomizations.stylesheets`, then add the `chrome` folder to your user (probably located at `.mozilla/firefox/<random characters>.default`. You can also add the `prefs.js` file here, which adds some anti tracking features and disables the firefox password manager, I recommend you use bitwarden instead of this, because it's just better.
