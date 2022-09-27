local g = vim.g
local o = vim.o

g.mapleader = " "
g.maplocalleader = " "

o.termguicolors = true
o.scrolloff = 4

vim.cmd("colorscheme wanderer")

o.expandtab = true
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4

o.number = true
o.numberwidth = 3
o.cursorline = true

require "plug"  -- Adds plugins
require "dash"  -- Adds dashboard
require "keys"  -- Adds keybindings
