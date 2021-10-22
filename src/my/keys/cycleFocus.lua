local cyclefocus = require('cyclefocus')
local gears = require("gears")
require("my.cyclefocus.config")

return gears.table.join(
  cyclefocus.key({ ctrl }, tab, cyclefocus.cycleAllTags),
  cyclefocus.key({ alt }, tab, cyclefocus.cycleSameTag)
)