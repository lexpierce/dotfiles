local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Macchiato'
config.initial_cols = 120
config.initial_rows = 32

config.native_macos_fullscreen_mode = true

-- Define fonts and stylistic settings in separate 'fonts.lua'
local fonts = require 'fonts'
config.font = wezterm.font(fonts.MonoLisa)
config.font_size = 14.0

return config
