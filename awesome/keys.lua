local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys") -- check what happens if removed
require("awful.autofocus")

root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end)
))

globalkeys = gears.table.join(

    awful.key({ "Mod1" }, "Tab", function ()
            awful.client.focus.byidx(1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey }, "w", function () 
            mymainmenu:show() 
        end,
        {description = "show main menu", group = "awesome"}
    ),
    awful.key({ modkey }, "Tab",      
        hotkeys_popup.show_help,
        {description="show help", group="awesome"}
    ),
    awful.key({ modkey }, "Return", function () 
            awful.spawn(terminal) 
        end,
        {description = "open a terminal", group = "launcher"}
    ),
    awful.key({ modkey, "Control" }, "r", 
        awesome.restart,
        {description = "reload awesome", group = "awesome"}
    ),
    awful.key({ modkey, "Shift" }, "q", 
        awesome.quit,
        {description = "quit awesome", group = "awesome"}
    ),
    awful.key({ modkey }, "r", function () 
            awful.spawn("rofi -show drun") 
        end,
        {description = "run prompt", group = "launcher"}
    )

)

clientkeys = gears.table.join(

    awful.key({ "Control" }, "q", function (c) 
            c:kill()
        end,
        {description = "close", group = "client"}
    ),
    awful.key({ modkey }, "f",  
        awful.client.floating.toggle,
        {description = "toggle floating", group = "client"}
    ),
    awful.key({ "Control" }, "Return", function (c) 
          	c:swap(awful.client.getmaster()) 
        end,
        {description = "move to master", group = "client"}
    ),
    awful.key({ modkey }, "z", function (c)
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}
    ),
    awful.key({ modkey, "Shift" }, "z", function()
            local c = awful.client.restore()
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", {raise = true}
                )
            end
        end,
        {description = "restore minimized", group = "client"}
    )
)

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

root.keys(globalkeys)
