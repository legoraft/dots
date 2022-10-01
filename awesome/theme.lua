local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir()

local theme = {}

theme.font          = "Source Sans 9"

theme.bg_normal     = "#161a1a"
theme.bg_focus      = "#426666"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#070808"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ced9d9"
theme.fg_urgent     = "#c2cccc"
theme.fg_minimize   = "#3d4d4d"

theme.useless_gap   = dpi(2)
theme.border_width  = dpi(1)
theme.border_normal = "#161a1a"
theme.border_focus  = "#60bfbf"
theme.border_marked = "#91231c"

theme.round = 10

theme.layout_floating = themes_path.."icons/floating-icon.svg"
theme.layout_spiral = themes_path.."icons/spiral-icon.svg"
theme.layout_tile = themes_path.."icons/tile-icon.svg"

theme.icon_theme = nil

return theme
