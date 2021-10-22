local awful = require("awful")
local wibox = require("wibox")

lo = awful.layout.layouts
local myTagsForScreens = require("my.local.tagsForScreens")

return function(s)
  require("my.wallpaper")(s)

  tagsForScreen = myTagsForScreens[s.index]
  awful.tag(tagsForScreen.names, s, tagsForScreen.layouts)
  -- awful.tag({ "1", "2", "3", "4" }, s, awful.layout.layouts[1])

  s.mywibox = awful.wibar({ position = "bottom", screen = s })

  systrayWidth = 280

  s.mywibox:setup {
    layout = wibox.layout.fixed.horizontal,
    require("my.taglist.container")({screen = s}),
    require("my.systray.container"),
  }
end