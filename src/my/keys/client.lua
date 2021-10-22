local gears = require("gears")
local awful = require("awful")

function killIt()
  return function (c) c:kill() end
end

function maximized(bool)
  return function(c)
    c.maximized = bool
    c:raise()
  end
end

return gears.table.join(
  awful.key({ alt, }, "F4", killIt()),
  awful.key({ ctrl }, "Up", maximized(true)),
  awful.key({ ctrl }, "Down", maximized(false))
)