local gears = require("gears")
local awful = require("awful")
local moveClient = require("my.helper.moveClient")

return gears.table.join(
  awful.key({ alt, meta }, "Left", awful.tag.viewprev),
  awful.key({ alt, meta, hyper }, "h", awful.tag.viewprev),
  awful.key({ alt, meta }, "Right", awful.tag.viewnext),
  awful.key({ alt, meta, hyper }, "l", awful.tag.viewnext),

  awful.key({ alt, meta, shift }, "Left", moveClient.toPrevTag),
  awful.key({ alt, meta, hyper, shift }, "h", moveClient.toPrevTag),
  awful.key({ alt, meta, shift }, "Right", moveClient.toNextTag),
  awful.key({ alt, meta, hyper, shift }, "l", moveClient.toNextTag)
)