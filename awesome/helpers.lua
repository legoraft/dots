local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

local dpi = beautiful.xresources.apply_dpi

local helpers = {}

function helpers.roundedrect(radius)
  radius = radius or dpi(8)
  return function (cr, w, h)
    return gears.shape.rounded_rect(cr, w, h, radius)
  end
end

function helpers.mintitle(c)
  local ret = wibox.widget.textbox()
  local function update()
      ret:set_text(c.class or titlebar.fallback_name)
  end
  c:connect_signal("property::name", update)
  update()

  return ret
end

return helpers