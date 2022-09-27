local beautiful     = require("beautiful")
local awful         = require("awful")
local menubar       = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

awesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
 }
 
mainmenu = awful.menu({ items = {
        { "Terminal", term },
        { "Browser", browser },
        { "Awesome", awesomemenu },
    }
})