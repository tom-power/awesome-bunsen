local cyclefocus = require('my.cyclefocus.config')

cyclefocus.cycle_filters = {
    -- function(c, source_c) return not c.minimized end
    function(c, source_c) return true end
}

cyclefocus.cycleAll = cyclefocus.key({ ctrl }, tab)

cyclefocus.cycleCurrentTag = cyclefocus.key({ alt }, tab, {
  cycle_filters = { cyclefocus.filters.common_tag }
})

return cyclefocus