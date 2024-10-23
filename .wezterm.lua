local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- FONT
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13

-- TABS
config.enable_tab_bar = true



return config
