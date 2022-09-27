local beautiful     = require("beautiful")
local awful         = require("awful")
local menubar       = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Create a launcher widget and a main menu

awesomemenu = {
    { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "Restart", awesome.restart },
    { "Logout", function() awesome.quit() end },
}

mainmenu = awful.menu({ items = {
        { "Terminal", terminal, beautiful.term_icon },
        { "Browser", browser, beautiful.web_icon },
        { "Files", fileman, beautiful.folder_icon },
        { "Awesome", awesomemenu, beautiful.menu_icon },
    }
})

-- Set the terminal for applications that require it
 menubar.utils.terminal = terminal 
