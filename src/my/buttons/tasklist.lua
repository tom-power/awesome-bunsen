local gears = require("gears")
local awful = require("awful")

return gears.table.join(
  awful.button({ }, 1, function (c)
    c:emit_signal(
      "request::activate",
      "tasklist",
      {raise = true}
    )
  end)
)