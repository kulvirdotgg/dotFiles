local wezterm = require("wezterm")

local config = {
	enable_tab_bar = false,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	font = wezterm.font("MesloLGS Nerd Font Mono"),
	font_size = 14.0,
	-- color_scheme = "Catppuccin Mocha",
	color_scheme = "Carbon Fox",
	window_background_opacity = 0.8,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	-- window_background_image = "documents/wallpapers/slcdn6avjgn71.png",
}

config.leader = { key = "d", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "|",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

-- uncomment this if not using with some wm
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
