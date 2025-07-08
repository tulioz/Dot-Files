-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

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

config.keys = {
  -- Use CMD+Left/Right to switch tabs
  {key="LeftArrow", mods="CMD", action=wezterm.action{ActivateTabRelative=-1}},
  {key="RightArrow", mods="CMD", action=wezterm.action{ActivateTabRelative=1}},
}

-- Finally, return the configuration to wezterm:
return config
