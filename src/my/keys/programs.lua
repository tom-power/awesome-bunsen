local gears = require("gears")
local awful = require("awful")

local spawn = function (process)
  return function()
    awful.util.spawn(process)
  end
end

return gears.table.join(
  -- gen
  awful.key({ ctrl, }, "Return", spawn("gmrun")),

  -- browsers
  awful.key({ win, }, "w", spawn("firefox")),
  awful.key({ win, }, "g", spawn("chrome.sh")),
  awful.key({ win, }, "m", spawn("meet.sh")),

  -- tools
  awful.key({ win, }, "t", spawn(terminal)),
  awful.key({ win, }, "e", spawn("atom")),
  awful.key({ win, }, "f", spawn("sunflower")),
  awful.key({ win, }, "c", spawn("galculator")),

  -- system
  awful.key({ win, }, "h", spawn("bl-exit --hibernate")),
  awful.key({ win, }, "l", spawn("bl-lock"))
)