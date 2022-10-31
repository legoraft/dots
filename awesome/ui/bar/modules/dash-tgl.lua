local wibox = require "wibox"
local beautiful = require "beautiful"

local launcher = wibox.widget {
  image = beautiful.logo_icon,
  resize = true,
  widget = wibox.widget.imagebox,
}

return launcher