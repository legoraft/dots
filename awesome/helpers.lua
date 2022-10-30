local beautiful = require("beautiful")
local gears = require("gears")

local dpi = beautiful.xresources.apply_dpi

local helpers = {}

function helpers.roundedrect(radius)
  radius = radius or dpi(8)
  return function (cr, w, h)
    return gears.shape.rounded_rect(cr, w, h, radius)
  end
end

return helpers