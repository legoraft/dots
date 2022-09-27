local awful         = require("awful")
local gears         = require("gears")
local menubar       = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Keyboard map indicator and switcher
keyboardlayout = awful.widget.keyboardlayout()

-- Disable edge and client snapping
awful.mouse.snap.edge_enabled = false
awful.mouse.snap.client_enabled = false
awful.mouse.snap.default_distance = 0

-- Mouse bindings
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

    awful.key({ modkey }, "r", function () 
        awful.spawn("rofi -show drun")
    end,
        {description = "run rofi", group = "launcher"}),
        
    awful.key({ modkey }, "t", function () 
        awful.spawn("kitty")
    end,
        {description = "open kitty terminal", group = "launcher"}),
    
    awful.key({ modkey, "Shift" }, "s", function () 
        awful.spawn("scrot -s /home/lr/Pictures/Screenshots/%Y-%m-%d_%H.%M.%S.png")
    end,
        {description = "select area for screenshot", group = "screenshot"}),
        
    awful.key({  }, "Print", function () 
        awful.spawn("scrot -m /home/lr/Pictures/Screenshots/%Y-%m-%d_%H.%M.%S.png")
    end,
        {description = "screenshot every screen", group = "screenshot"}),
        
    awful.key({ modkey }, "s", function () 
        awful.spawn("scrot -ub /home/lr/Pictures/Screenshots/%Y-%m-%d_%H.%M.%S.png")
    end,
        {description = "screenshot focused window", group = "screenshot"})

)

clientkeys = gears.table.join(

    awful.key({  }, "F11",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
    end,
        {description = "toggle fullscreen", group = "client"}),

    awful.key({ modkey }, "q",      
        function (c) c:kill()                         
    end,
        {description = "close window", group = "client"})

)

-- Set keys
root.keys(globalkeys)
