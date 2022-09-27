local beautiful     = require("beautiful")
local awful         = require("awful")
local wibox         = require("wibox")
local gears         = require("gears")

-- Create a textclock widget
-- clock = wibox.widget.textclock( "%H:%M" )

local clock = {
    {
        {
            {
                id     = 'text_role',
                widget = wibox.widget.textclock("%H:%M"),
            },
            layout = wibox.layout.fixed.horizontal,
        },
        left  = 10,
        right = 10,
        widget = wibox.container.margin
    },
    id     = 'background_role',
    widget = wibox.container.background,
}

local taskbtns = gears.table.join(
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

    -- Each screen has its own tag table.
    awful.tag({ "1" }, s, awful.layout.layouts[1])

    -- Create a tasklist widget
    s.maintasks = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons  = taskbtns,
        style    = {
            shape  = gears.bar,
        },
        layout   = {
            spacing = 5,
            max_widget_size = 250,
            layout  = wibox.layout.flex.horizontal
        },
        widget_template = {
            {
                {
                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left  = 10,
                right = 10,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
        },
    }

    -- Create the wibox
    s.mainwibox = awful.wibar({ position = "top", screen = s, height = 30, bg = "#181a19" })

    -- Add widgets to the wibox
    s.mainwibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
        },
        s.maintasks, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            clock,
        },
    }
end)
