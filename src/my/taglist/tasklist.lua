local awful = require("awful")
local wibox = require("wibox")

local function clientFilter(i)
  return function(client, screen)
    local tag = screen.tags[i]
    local clientTags = client:tags()
    for _, v in ipairs(clientTags) do
      if v == tag then
        return true
      end
    end
    return false
  end
end

local clientIcon = {
  id = "clienticon",
  widget = awful.widget.clienticon,
}

return function(cfg, tagIndex)
  local cfg = config or {}
  return awful.widget.tasklist {
    screen = cfg.screen or awful.screen.focused(),
    filter = clientFilter(tagIndex),
    widget_template = {
      layout = wibox.layout.fixed.horizontal,
      {
        id = "background_role",
        widget = wibox.container.background,
        {
          widget = wibox.container.margin,
          margins = 2,
          {
            layout = wibox.layout.align.horizontal,
            forced_width = 300,
            expand = "outside",
            nil, clientIcon, nil
          }
        }
      },
      create_callback = function(self, c, _, _)
        self:get_children_by_id("clienticon")[1].client = c
      end,
    },
    buttons = require("my.buttons.tasklist"),
  }

end