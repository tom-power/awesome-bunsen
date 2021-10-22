local awful = require("awful")
local wibox = require("wibox")
local tasklist = require("my.taglist.tasklist")
local taglist = require("my.taglist.taglist")

local function tableLength(T)
  local count = 0
  for _ in pairs(T) do
    count = count + 1
  end
  return count
end

return function(config)
  local cfg = config or {}
  local s = cfg.screen or awful.screen.focused()

  local screenWidth = s.geometry.width
  local numberOfTags = tableLength(s.tags)
  local tagWidth = (screenWidth - systrayWidth) / numberOfTags

  return taglist(cfg, tasklist, tagWidth)
end