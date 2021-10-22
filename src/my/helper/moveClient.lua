local gmath = require("gears.math")
local awful = require("awful")

local function currentTag()
  return client.focus and client.focus.first_tag or nil
end

local function tagWithOffset(tag, offset)
  local tags = client.focus.screen.tags
  return tags[gmath.cycle(#tags, tag.name + offset)]
end

local moveClient = {}

function moveClient.toPrevTag()
    awful.client.movetotag(tagWithOffset(currentTag(), -1))
    awful.tag.viewprev()
end

function moveClient.toNextTag()
    awful.client.movetotag(tagWithOffset(currentTag(), 1))
    awful.tag.viewnext()
end

return moveClient