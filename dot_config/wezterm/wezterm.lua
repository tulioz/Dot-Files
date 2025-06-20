-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

local function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

config.font = wezterm.font {
  family = 'JetBrains Mono',
  weight = 'Medium',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- disable ligatures
}
config.font_size = 14.0
config.line_height = 1.0

config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
config.window_background_opacity = 0.96
config.macos_window_background_blur = 20

-- Finally, return the configuration to wezterm:
return config