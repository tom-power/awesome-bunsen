local gears = require("gears")
local awful = require("awful")

local function raise(c)
  c:emit_signal("request::activate", "mouse_click", {raise = true})
end

return gears.table.join(
  awful.button({ }, 1, function (c) raise(c) end),
  awful.button({ alt }, 1, function (c) raise(c); awful.mouse.client.move(c) end),
  awful.button({ alt, shift }, 1, function (c) raise(c); awful.mouse.client.resize(c) end)
)