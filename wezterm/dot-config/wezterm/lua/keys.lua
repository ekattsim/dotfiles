local wezterm = require("wezterm")

local M = {}

function M.keys()
	return {
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SendKey({ key = "p", mods = "META|CTRL" }),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SendKey({ key = "n", mods = "META|CTRL" }),
		},
		{
			key = "m",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SendKey({ key = "f", mods = "META|CTRL" }),
		},
		{
			key = "x",
			mods = "CTRL|SHIFT",
			action = wezterm.action.DisableDefaultAssignment,
		},
		{
			key = "x",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SendKey({ key = "x", mods = "META|CTRL" }),
		},
		{
			key = "Tab",
			mods = "CTRL",
			action = wezterm.action.DisableDefaultAssignment,
		},
		{
			key = "m",
			mods = "SUPER|SHIFT",
			action = wezterm.action.SendKey({ key = "m", mods = "ALT" }),
		},
		{
			key = "a",
			mods = "SUPER",
			action = wezterm.action.SendKey({ key = "a", mods = "ALT" }),
		},
		{
			key = "d",
			mods = "SUPER",
			action = wezterm.action.SendKey({ key = "d", mods = "ALT" }),
		},
		{
			key = "n",
			mods = "CTRL",
			action = wezterm.action.DisableDefaultAssignment,
		},
		{
			key = "Enter",
			mods = "SUPER",
			action = wezterm.action.SendKey({ key = "\n" }),
		},
		{
			key = "P",
			mods = "CTRL|SHIFT",
			action = wezterm.action({
				QuickSelectArgs = {
					patterns = {
						"https?://\\S+",
					},
					action = wezterm.action_callback(function(window, pane)
						local url = window:get_selection_text_for_pane(pane)
						wezterm.log_info("opening: " .. url)
						wezterm.open_with(url)
					end),
				},
			}),
		},
		{
			key = "o",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SendKey({ key = "o", mods = "ALT" }),
		},
		{
			key = "Enter",
			mods = "ALT",
			action = wezterm.action.DisableDefaultAssignment,
		},
		{
			key = "Enter",
			mods = "SHIFT",
			action = wezterm.action.SendKey({ key = "Enter", mods = "ALT" }), -- neorg next iteration
		},
	}
end

return M
