-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Macchiato'
config.initial_cols = 120
config.initial_rows = 32

-- config.freetype_load_target = 'Light'
config.native_macos_fullscreen_mode = true

-- Font selection and configuration
local fonts = require 'fonts'
config.font = wezterm.font(fonts.MonoLisa)
config.font_size = 12.0


-- and finally, return the configuration to wezterm
return config

