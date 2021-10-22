local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

return gears.table.join(
  awful.key({ win }, "s", hotkeys_popup.show_help),
  awful.key({ win }, "space", function () mymainmenu:show() end),
  awful.key({ win, ctrl }, "r", awesome.restart),
  awful.key({ win, shift }, "q", awesome.quit)
)