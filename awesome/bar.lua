local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys") -- check what happens if removed
require("awful.autofocus")

awful.screen.connect_for_each_screen(function(s)

    awful.tag({ "1"}, s, awful.layout.layouts[1])

    mytextclock = {
        {
            id = "text_role",
            widget = wibox.widget.textclock("%H:%M"),
        },
        left = 5,
        right = 5,
        widget = wibox.container.margin,
    }

    s.mylayoutbox = awful.widget.layoutbox(s)

    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end)
    ))

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
            right = 10,
            widget = wibox.container.margin
        }
    }

    beautiful.tasklist_plain_task_name = true

    s.mywibox = awful.wibar({ 
        position = "top", 
        screen = s,
        bg = "#202626",
        border_color = "#202626",
        border_width = 4,
    })

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytasklist
        },
        spacer,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mytextclock,
            wibox.widget.systray(),
            s.mylayoutbox,
        },
    }
end)
