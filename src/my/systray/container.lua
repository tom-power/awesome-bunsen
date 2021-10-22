local awful = require("awful")
local wibox = require("wibox")

return {
  layout = wibox.layout.align.horizontal,
  nil, require("my.systray.systray"), require("my.systray.clock")
}