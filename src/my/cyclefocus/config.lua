local cyclefocus = require('cyclefocus')

cyclefocus.show_clients = false
cyclefocus.focus_clients = false
cyclefocus.move_mouse_pointer = false
cyclefocus.display_next_count = 10
cyclefocus.display_prev_count = 10

cyclefocus.cycle_filters = {
    function(c, source_c) return c end
}
cyclefocus.cycleAllTags = {
  cycle_filters = { cyclefocus.filters.same_screen }
}
cyclefocus.cycleSameTag = {
  cycle_filters = { cyclefocus.filters.same_screen, cyclefocus.filters.common_tag }
}

cyclefocus.preset_for_offset = require('my.cyclefocus.presetForOffset')
