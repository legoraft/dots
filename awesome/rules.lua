local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys") -- check what happens if removed
require("awful.autofocus")

awful.rules.rules = {
    { rule = { },
      properties = { 
        border_width = 3,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = clientkeys,
        buttons = clientbuttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap+awful.placement.no_offscreen -- awful.placement.centered(client, nil)
     }
    },

    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

}