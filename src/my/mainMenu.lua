local has_fdo, freedesktop = pcall(require, "freedesktop")
local debian = require("debian.menu")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")
local xrandr = require("my.xrandr")

local spawn = function (process)
  return function() awful.util.spawn(process) end
end

myAwesomeMenu = {
  -- gen
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },

  -- wm
  { "wm restart", awesome.restart },
  { "wm quit", function() awesome.quit() end },
  { "wm xrandr", function() xrandr.xrandr() end },

  -- system
  { "logout", spawn("bl-exit --logout") },
  { "hibernate", spawn("bl-exit --hibernate") },
  { "reboot", spawn("bl-exit --reboot") },
  { "poweroff", spawn("bl-exit --poweroff") },
}

local awesomeMenu = { "awesome", myAwesomeMenu, beautiful.awesome_icon }
local terminalMenu = { "open terminal", terminal }

local freedesktopMenu = freedesktop.menu.build({
  before = { awesomeMenu },
  after = { terminalMenu }
})

local awfulMenu = awful.menu{
  items = {
    awesomeMenu,
    { "Debian", debian.menu.Debian_menu.Debian },
    terminalMenu,
  }
}

return has_fdo and freedesktopMenu or awfulMenu