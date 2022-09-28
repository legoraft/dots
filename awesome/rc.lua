pcall(require, "luarocks.loader")

local gears         = require("gears")
local awful         = require("awful")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Error Handling
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end

-- Theme definition
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

naughty.config.defaults.icon_size = 48

-- Default applications
terminal    = "kitty"
editor      = "emacs"
browser     = "firefox"
fileman     = "pcmanfm"

-- Default modkey.
modkey = "Mod4"

awful.layout.layouts = {
    awful.layout.suit.floating,
}

-- Load all other functions
require("bar")
require("binds")
require("menu")
require("rules")
require("signals")
