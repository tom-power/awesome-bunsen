-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")
local beautiful = require("beautiful")

require("my.errorHandling")

beautiful.init("~/.config/awesome/theme.lua")
awful.spawn.with_shell("~/.config/awesome/autorun.sh")

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Keys.
win = "Mod4"
alt = "Mod1"
ctrl = "Control"
shift = "Shift"
meta = "Mod3"
hyper = "Mod5"
tab = "Tab"

--!Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = { awful.layout.suit.floating }
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
-- mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
--                                       menu = require("my.mainMenu") })

local menubar = require("menubar")
-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", require("my.wallpaper"))

-- {{{ Wibar
-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(require("my.wibar"))
-- }}}

mymainmenu = require("my.mainMenu")

-- {{{ Mouse bindings
root.buttons(require("my.buttons.root"))
-- }}}

-- {{{ Key bindings
local cyclefocusKeys = require("my.keys.cyclefocus")

globalkeys = gears.table.join(
  require("my.keys.root"),
  require("my.keys.tagNav"),
  require("my.keys.screen"),
  require("my.keys.programs"),
  cyclefocusKeys.cycleAll
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
clientkeys = gears.table.join(
  require("my.keys.client"),
  cyclefocusKeys.cycleCurrentTag
)

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  { rule = { },
    properties = {
      border_width = 1,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      size_hints_honor = false,
      keys = clientkeys,
      buttons = require("my.buttons.client"),
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },

  -- Set Firefox to always map on the tag named "2" on screen 1.
  -- { rule = { class = "Firefox" },
  --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", require("my.signals.manage"))