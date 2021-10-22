local cyclefocus = require('cyclefocus')
local gears = require("gears")
require("my.cyclefocus.config")

-- include minimised clients in the filter
cyclefocus.cycle_filters = {
    -- function(c, source_c) return not c.minimized end
    function(c, source_c) return c end
}
cyclefocus.cycleAllTags = {
  cycle_filters = { cyclefocus.filters.same_screen }
}
cyclefocus.cycleSameTag = {
  cycle_filters = { cyclefocus.filters.same_screen, cyclefocus.filters.common_tag }
}

return gears.table.join(
  cyclefocus.key({ ctrl }, tab, cyclefocus.cycleAllTags),
  cyclefocus.key({ alt }, tab, cyclefocus.cycleSameTag)
)