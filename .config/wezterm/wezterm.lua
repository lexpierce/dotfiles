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
config.font = wezterm.font(fonts.BerkeleyMono)
config.font_size = 14.0

-- Playing with transparency
--config.window_background_opacity = 0.80
--config.macos_window_background_blur = 40

return config
