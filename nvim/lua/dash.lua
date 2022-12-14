local db = require "dashboard"


db.default_banner = {

    "",
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    "",
    " [ There are no failures, just v0.1's ] ",
    "",
    
}

db.custom_center = {

    {icon = "  ",
    desc = "Open new file                   ",
    shortcut = "SPC o l",
    action = "Sessionload"},
    {icon = "  ",
    desc = "Recent files                    ",
    shortcut = "SPC f r",
    action = "Telescope oldfiles"},
    {icon = "  ",
    desc = "File browser                    ",
    shortcut = "SPC f b",
    action = "Telescope file_browser"},
    {icon = "  ",
    desc = "Find file                       ",
    shortcut = "SPC f f",
    action = "Telescope find_files"},

}

db.custom_footer = {
	" Do one thing and do it well - Unix Philosophy "
}

db.hide_statusline = true
