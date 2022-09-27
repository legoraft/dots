local awful         = require("awful")
local gears         = require("gears")
local menubar       = require("menubar")

root.buttons(gears.table.join(
    awful.button({ }, 3, function () mainmenu:toggle() end),
    awful.button({ }, 1, function () mainmenu:hide() end)
))

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

globalkeys = gears.table.join(

    awful.key({ modkey }, "space", function () 
        awful.spawn("rofi -show drun")
    end,
        {description = "run rofi", group = "launcher"}),
        
    awful.key({ modkey }, "Enter", function () 
        awful.spawn("kitty")
    end,
        {description = "open kitty terminal", group = "launcher"}),

    clientkeys = gears.table.join(

        awful.key({  }, "F11", function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
            {description = "toggle fullscreen", group = "client"}),
    
        awful.key({ "Control" }, "q", function (c) 
            c:kill()                         
        end,
            {description = "close window", group = "client"}),

        awful.key({ "Alt" }, "Tab", function ()
            awful.client.focus.byidx( 1)
        end,
            {description = "focus next client", group = "client"}),

        awful.key({ modkey }, "n", function (c)
                c.minimized = true
        end,
            {description = "minimize", group = "client"}),
    
    )