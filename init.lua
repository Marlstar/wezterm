local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- PLUGINS
-- *cricket noises*

-- FONT
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 19

-- TABS
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- WINDOW
-- default: "TITLE | RESIZE", options: "TITLE", "RESIZE", "NONE"
config.window_decorations = "RESIZE"
-- To change padding, see nvim config `plugins/wezterm-config.lua`
-- This is a limitation from the method I use to remove window padding while in neovim
-- Will be fixed later
local window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.5cell",
	bottom = "0.5cell"
}
config.window_padding = window_padding
wezterm.on("user-var-changed", function(window,_,name,value)
	wezterm.log_info("user var changed:", name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "IS_NVIM" and value == "true" then
		overrides.window_padding = {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0
		}
	else
		overrides.window_padding = nil
	end
	window:set_config_overrides(overrides)
end)


-- APPEARANCE
config.color_scheme = "Tokyo Night Moon" -- https://wezfurlong.org/wezterm/colorschemes/t/index.html#tokyo-night-moon
-- config.window_background_opacity = 0.7
-- config.win32_system_backdrop = "Acrylic"


return config
