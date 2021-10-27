local tostring = tostring
local cyclefocus = require('cyclefocus')
local xresources = require("beautiful").xresources
local dpi = xresources and xresources.apply_dpi or function() end

--- Escape pango markup, taken from naughty.
local escape_markup = function(s)
  local escape_pattern = "[<>&]"
  local escape_subs = { ['<'] = "&lt;", ['>'] = "&gt;", ['&'] = "&amp;" }
  return s:gsub(escape_pattern, escape_subs)
end

return {
  -- Default callback, which will gets applied for all offsets (first).
  default = function (preset, args)
    -- Default font and icon size (gets overwritten for current/0 index).
    preset.font = 'sans 8'
    preset.icon_size = dpi(24)
    preset.text = escape_markup(cyclefocus.get_client_title(args.client, false))
  end,

  -- Preset for current entry.
  ["0"] = function (preset, args)
    preset.font = 'sans 14'
    preset.icon_size = dpi(36)
    preset.text = escape_markup(cyclefocus.get_client_title(args.client, true))
    -- Add screen number if there is more than one.
    if screen.count() > 1 then
      preset.text = preset.text .. " [screen " .. tostring(args.client.screen.index) .. "]"
    end
    -- preset.text = preset.text .. " [#" .. args.idx .. "] "
    preset.text = '<b>' .. preset.text .. '</b>'
  end,

  -- You can refer to entries by their offset.
  -- ["-1"] = function (preset, args)
  --     -- preset.icon_size = 32
  -- end,
  -- ["1"] = function (preset, args)
  --     -- preset.icon_size = 32
  -- end
}
