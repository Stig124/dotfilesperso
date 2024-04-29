local wezterm = require("wezterm")

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha (Gogh)"
	else
		return "Catppuccin Latte (Gogh)"
	end
end

return {
	color_scheme = scheme_for_appearance(get_appearance()),
	check_for_updates = false,
	font_size = 11.0,
	default_prog = { "/usr/bin/tmux" },
	enable_wayland = true,
	xcursor_theme = "Adwaita",
}
