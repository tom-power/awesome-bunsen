local awful = require("awful")
local wibox = require("wibox")

local systray = {
  layout = wibox.layout.margin,
  margins = 1,
  wibox.widget.systray()
}

return {
  layout = wibox.layout.align.horizontal,
  expand = "none",
  forced_width = systrayWidth,
  nil, systray, nil
}