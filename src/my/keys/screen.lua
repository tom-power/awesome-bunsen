local gears = require("gears")
local awful = require("awful")

local screenNext = function () awful.screen.focus_relative( 1) end
local screenPrev = function () awful.screen.focus_relative(-1) end

local moveToscreenNext = function (c) c:move_to_screen() end
local moveToscreenPrev = function (c) c:swap(awful.client.getmaster()) end

return gears.table.join(
  awful.key({ alt, meta }, "Down", screenNext),
  awful.key({ alt, meta, hyper }, "j", screenNext),
  awful.key({ alt, meta, shift }, "Down", moveToscreenNext),
  awful.key({ alt, meta, hyper, shift }, "j", moveToscreenNext),

  awful.key({ alt, meta }, "Up", screenPrev),
  awful.key({ alt, meta, hyper }, "k", screenPrev),
  awful.key({ alt, meta, shift }, "Up", moveToscreenPrev),
  awful.key({ alt, meta, hyper, shift }, "k", moveToscreenPrev)
)