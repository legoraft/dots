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

awful.screen.connect_for_each_screen(function(s)

    awful.tag({ "1"}, s, awful.layout.layouts[1])

    mytextclock = wibox.widget.textclock()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)

    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end)
    ))

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.focused,
        buttons = tasklist_buttons,
        widget_template = {
            {
                id = "text_role",
                widget = wibox.widget.textbox,
            },
            left = 10,
            widget = wibox.container.margin
        }
    }

    beautiful.tasklist_plain_task_name = true
    

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mytextclock,
            wibox.widget.systray(),
            s.mylayoutbox,
        },
    }
end)
-- }}}
