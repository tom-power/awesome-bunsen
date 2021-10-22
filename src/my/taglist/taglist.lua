local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local taglistButtons = gears.table.join(
  awful.button({ }, 1, function(t) t:view_only() end),
  awful.button({ }, 3, function () mymainmenu:toggle() end)
)

return function(config, tasklist, tagWidth)
  local cfg = config or {}
  return awful.widget.taglist {
    screen = cfg.screen or awful.screen.focused(),
    filter = awful.widget.taglist.filter.all,
    widget_template = {
      widget = wibox.container.margin,
      left = 3,
      {
        widget = wibox.container.margin,
        margins = 1,
        color = "#808080",
        {
          id = "background_role",
          widget = wibox.container.background,
          {
            id = "tasklist_placeholder",
            layout = wibox.layout.fixed.horizontal,
            forced_width = tagWidth
          },
        },
      },
      create_callback = function(self, _, index, _)
        self:get_children_by_id("tasklist_placeholder")[1]:add(tasklist(cfg, index))
      end,
    },
    buttons = taglistButtons,
  }
end