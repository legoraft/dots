-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

local dpi = beautiful.xresources.apply_dpi

local helpers = require("helpers")
local launcher = require "ui.bar.modules.launcher"
local dash_tgl = require "ui.bar.modules.dash-tgl"

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                   { "open terminal", terminal }
                                 }
                       })
                       local launcher = require "ui.bar.modules.launcher"
-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

spacer = wibox.widget {
  image = beautiful.spacer,
  resize = true,
  widget = wibox.widget.imagebox,
}

-- Create a wibox for each screen and add it

local tasklist_buttons = gears.table.join(
                    awful.button({ }, 1, function (c)
                                             if c == client.focus then
                                                 c.minimized = true
                                             else
                                                 c:emit_signal(
                                                     "request::activate",
                                                     "tasklist",
                                                     {raise = true}
                                                 )
                                             end
                                         end),
                    awful.button({ }, 3, function()
                                             awful.menu.client_list({ theme = { width = 250 } })
                                         end),
                    awful.button({ }, 4, function ()
                                             awful.client.focus.byidx(1)
                                         end),
                    awful.button({ }, 5, function ()
                                             awful.client.focus.byidx(-1)
                                         end))

local function set_wallpaper(s)
   -- Wallpaper
   if beautiful.wallpaper then
       local wallpaper = beautiful.wallpaper
       -- If wallpaper is a function, call it with the screen
       if type(wallpaper) == "function" then
           wallpaper = wallpaper(s)
       end
       gears.wallpaper.maximized(wallpaper, s, true)
   end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
   -- Wallpaper
   set_wallpaper(s)

   awful.tag({ "1" }, s, awful.layout.layouts[1])

   -- Create a promptbox for each screen
   s.mypromptbox = awful.widget.prompt()

   -- Create a tasklist widget
   s.mytasklist = awful.widget.tasklist {
       screen  = s,
       filter  = awful.widget.tasklist.filter.currenttags,
       buttons = tasklist_buttons
   }

   -- Create the wibox
   s.mywibox = awful.wibar({ 
    position = "bottom",
    screen = s,
    width = s.geometry.width - beautiful.useless_gap * 4,
    height = dpi(30),
    shape = helpers.roundedrect(12),
  })

  s.mywibox.y = s.geometry.height - beautiful.useless_gap * 4

   -- Add widgets to the wibox
   s.mywibox:setup {
       layout = wibox.layout.align.horizontal,
       { -- Left widgets
           layout = wibox.layout.fixed.horizontal,
           dash_tgl,
           spacer,
           launcher,
           s.mypromptbox,
       },
       s.mytasklist, -- Middle widget
       { -- Right widgets
           layout = wibox.layout.fixed.horizontal,
           wibox.widget.systray(),
           mytextclock,
       },
   }
end)
-- }}}
