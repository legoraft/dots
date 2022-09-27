-- Cultured Jet theme designed by LegoRaft
-- Check out more dotfiles at https://github.com/LegoRaft/dotfiles

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir()

local theme = {}

theme.font          = "Source Sans Pro 10"

theme.bg_normal     = "#2c2e2d"
theme.bg_focus      = "#347349"
theme.bg_urgent     = "#737334"
theme.bg_minimize   = "#101210"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#d6d6d6"
theme.fg_focus      = "#f5f5f5"
theme.fg_urgent     = "#f5f5f5"
theme.fg_minimize   = "#d6d6d6"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#2c2e2d"
theme.border_focus  = "#347349"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."theme/submenu.png"
theme.menu_height = dpi(25)
theme.menu_width  = dpi(130)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
-- theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."theme/close.png"
theme.titlebar_close_button_focus  = themes_path.."theme/close.png"
theme.folder_icon = themes_path.."theme/folder.svg"
theme.term_icon = themes_path.."theme/terminal.svg"
theme.web_icon = themes_path.."theme/globe.svg"
theme.menu_icon = themes_path.."theme/menu.svg"

-- theme.folder_icon = themes_path.. "theme/icons/folder.png"

theme.wallpaper = themes_path.."default/background.png"

theme.rounded_wids = 20

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
