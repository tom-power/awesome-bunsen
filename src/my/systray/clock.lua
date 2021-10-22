local wibox = require("wibox")

local time = {
  widget = wibox.widget.textclock,
  format = "%H:%M",
  font = "DejaVu Sans Mono normal 8"
}

local timeCentred = {
  layout = wibox.layout.align.horizontal,
  expand = "none",
  nil, time, nil,
}

local date = {
  widget = wibox.widget.textclock,
  format = "%d/%m/%y",
  font = "DejaVu Sans Mono normal 6"
}

local clock = {
  layout = wibox.layout.grid,
  forced_num_cols = 1,
  forced_num_rows = 2,
  timeCentred,
  date
}

return {
  layout = wibox.layout.margin,
  top = 1, right = 20, bottom = 1, left = 3,
  clock
}
