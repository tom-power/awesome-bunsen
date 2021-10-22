local gears = require("gears")
local beautiful = require("beautiful")

return function(s)
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    local myWallpaper = type(wallpaper) == "function" and wallpaper(s) or wallpaper
    gears.wallpaper.maximized(myWallpaper, s, true)
  end
end