local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Macchiato'
config.initial_cols = 110
config.initial_rows = 30

config.native_macos_fullscreen_mode = true

-- Define fonts and stylistic settings in separate 'fonts.lua'
local fonts = require 'fonts'
config.font = wezterm.font(fonts.PragmataProMono)
config.font_size = 15.0
config.freetype_interpreter_version = 40

-- Playing with transparency
-- config.window_background_opacity = 0.90
-- config.macos_window_background_blur = 40

return config
