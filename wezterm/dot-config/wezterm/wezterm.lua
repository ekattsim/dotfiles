-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Rose Pine Theme
local colors = require("lua/rose-pine-main").colors()
local window_frame = require("lua/rose-pine-main").window_frame()

-- Keybindings
local keys = require("lua/keys").keys()

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.colorscheme = 'batman'

-- Manual Colors Theme
config.colors = colors
config.window_frame = window_frame
-- config.window_background_opacity = 0.75

-- Tab Bar
config.enable_tab_bar = false

-- Window Config
config.window_decorations = "RESIZE"
config.window_padding = {
	top = 18,
	right = 2,
	bottom = 3,
}

-- Initial Window Size
config.initial_rows = 60
config.initial_cols = 160

-- Fonts
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono", { weight = "Bold" })
-- config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")

-- Keys Table
-- config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = keys

-- and finally, return the configuration to wezterm
return config
