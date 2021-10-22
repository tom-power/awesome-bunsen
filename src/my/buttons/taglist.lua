local gears = require("gears")
local awful = require("awful")

return gears.table.join(
  awful.button({ }, 1, function(t) t:view_only() end),
  awful.button({ }, 3, function () mymainmenu:toggle() end)
)