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

-- Font selection and configuration
--
-- Monaspace w/ stylistic sets
config.font = wezterm.font('Monaspace Krypton', {weight = 'Light'})
config.harfbuzz_features = {
	'dlig=1',
	'calt=1',
	'ss01=1',
	'ss02=1',
	'ss03=1',
	'ss04=1',
	'ss05=1',
	'ss06=1',
	'ss07=1',
	'ss08=1'
}

-- Monolisa w/ stylistic sets
--config.font = wezterm.font('Monolisa', {weight = 'Regular'})
--config.harfbuzz_features = {
--	'zero=1',
--	'ss05=1',
--	'ss06=1',
--	'ss07=1',
--	'ss08=1',
--	'ss10=1',
--	'ss11=1',
--	'ss13=1',
--	'ss14=1',
--	'ss15=1',
--	'ss16=1'
--}

-- and finally, return the configuration to wezterm
return config

