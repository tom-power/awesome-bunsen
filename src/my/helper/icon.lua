local gears = require("gears")

local function iconPath(name)
  return gears.filesystem.get_dir("config") .. "/media/icons/" .. name .. ".png"
end

local function fileExists(name)
  return gears.filesystem.file_readable(name)
end

local function fileName(name)
  return fileExists(iconPath(name)) and name or "default"
end

return function(c)
  icon = gears.surface(iconPath(fileName(c.class:lower())))
  return icon and icon._native or nil
end
