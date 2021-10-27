local cyclefocus = require('my.keys.cyclefocus.config')

cyclefocus.cycle_filters = {
  -- function(c, source_c) return not c.minimized end
  function(c, source_c) return true end
}

local cyclefocusKeys = {}

cyclefocusKeys.cycleAll = cyclefocus.key({ ctrl }, tab)

cyclefocusKeys.cycleCurrentTag =
cyclefocus.key({ alt }, tab, {
  cycle_filters = { cyclefocus.filters.common_tag }
})

return cyclefocusKeys