--- Ugly hack to disable Awesome native notifications support
--
-- This module shadows builtin naughty module, to prevent it from hijacking
-- notification popups on D-Bus, so that an external notification daemon can
-- display them instead. The module also re-implements just enough naughty API
-- to handle notifications issued from rc.lua, and forward them to the bus.
--
-- See also: https://github.com/awesomeWM/awesome/issues/1285

local awful = require "awful"

local naughty = {}

naughty.config = { presets = { critical = "critical" } }

function naughty.notify(args)
  local urgency = naughty.config.presets[args["preset"]]
  local summary = args["title"]
  local body = args["text"]
  awful.spawn(string.format('notify-send -u %s "%s" "%s"', urgency, summary, body))
end

return naughty
