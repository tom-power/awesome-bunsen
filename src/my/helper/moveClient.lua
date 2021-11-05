local gmath = require("gears.math")
local awful = require("awful")

local function currentTag()
  return client.focus and client.focus.first_tag or nil
end

local function tagAtIndex(index)
  local tags = client.focus.screen.tags
  return tags[gmath.cycle(#tags, index)]
end

local moveClient = {}

function moveClient.toPrevTag()
  awful.client.movetotag(tagAtIndex(currentTag().name - 1))
  awful.tag.viewprev()
end

function moveClient.toNextTag()
  awful.client.movetotag(tagAtIndex(currentTag().name + 1))
  awful.tag.viewnext()
end

return moveClient