local wezterm = require("wezterm")

local config = {
	enable_tab_bar = false,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	font = wezterm.font("MesloLGS Nerd Font Mono"),
	font_size = 14.0,
	-- color_scheme = "Catppuccin Mocha",
	color_scheme = "Carbon Fox",
	window_background_opacity = 0.85,
	window_padding = {
		left = 2,
		right = 2,
		top = 2,
		bottom = 2,
	},
	macos_window_background_blur = 10,
}

-- uncomment this if not using with some wm
-- local mux = wezterm.mux
--
-- wezterm.on("gui-startup", function()
-- 	local _, _, window = mux.spawn_window({})
-- 	window:gui_window():maximize()
-- end)

return config
