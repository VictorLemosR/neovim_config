-- Pull in the wezterm API
local wezterm = require 'wezterm'
local PATH = "C:/users/victor.santos/AppData/Local/nvim"

-- Codigo do cara
local mux = wezterm.mux
local act = wezterm.action

local size_adjust = 2

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- For example, changing the color scheme:
config.font = wezterm.font('SauceCodePro Nerd Font')
config.font_size = 14.4
config.line_height = 1.2

config.default_cwd = PATH
config.adjust_window_size_when_changing_font_size = false

config.hide_tab_bar_if_only_one_tab = true

config.use_dead_keys = false

-- Tab configuration
config.window_frame = {
 font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
}

config.scrollback_lines = 5000

config.front_end = "Software"

config.window_decorations = "RESIZE"

wezterm.on('gui-startup', function()
 local tab, pane, window = mux.spawn_window({})
 window:gui_window():maximize()
end)

config.adjust_window_size_when_changing_font_size = false

config.window_frame = {
  border_left_width = 0,
  border_right_width = 0,
  border_bottom_height = 0,
  border_top_height = 0,
}
config.window_padding = {-- For a full HD monitor
  left = 0,
  right = 0,
  top = 1,
  bottom = 1
}

config.inactive_pane_hsb = {
 saturation = 0.7,
 brightness = 0.6,
}

--config.window_background_image = 'C:/Users/victor.santos/Downloads/60.jpg'

config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.3,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 0.5,
}
config.key_map_preference = "Physical"

config.disable_default_key_bindings = true

config.keys = {
  { key = 'P', mods = 'ALT', action = wezterm.action.ActivateCommandPalette },
  { key = 'u', mods = 'ALT', action = wezterm.action.ShowDebugOverlay },
  
  { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'Tab', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
  { key = 'Tab', mods = 'ALT', action = act.MoveTabRelative(1) },
  { key = 'Tab', mods = 'ALT|SHIFT', action = act.MoveTabRelative(-1) },

  { key = 'PageUp', mods = '', action = act.ScrollByPage(-1) },
  { key = 'PageDown', mods = '', action = act.ScrollByPage(1) },

  { key = ',', mods = 'ALT', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = '.', mods = 'ALT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },

  { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left', },
  { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down', },
  { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up', },
  { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right', },
  
  { key = 'RightArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },
  { key = 'LeftArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },

  { key = 'H', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Left', size_adjust } },
  { key = 'J', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Down', size_adjust } },
  { key = 'K', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Up', size_adjust } },
  { key = 'L', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Right', size_adjust  } },

  { key = 'LeftArrow', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Left', size_adjust } },
  { key = 'DownArrow', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Down', size_adjust } },
  { key = 'UpArrow', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Up', size_adjust } },
  { key = 'RightArrow', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Right', size_adjust  } },

  { key = 'c', mods = 'ALT', action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = 'ALT', action = act.PasteFrom 'Clipboard' },
  { key = 'Enter', mods = 'CTRL', action = act.ActivateCopyMode },

  { key = 'r', mods = 'ALT', action = act.ReloadConfiguration },
  
  { key = '+', mods = 'ALT', action = act.IncreaseFontSize },
  { key = '+', mods = 'ALT|SHIFT', action = act.IncreaseFontSize },
  { key = '-', mods = 'ALT', action = act.DecreaseFontSize },
  { key = '0', mods = 'ALT', action = act.ResetFontSize },
  { key = '=', mods = 'ALT', action = act.ResetFontSize },

  { key = 'n', mods = 'ALT', action = act.SpawnWindow },
  { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
--  { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = false } }, -- Causes conflict with window-managing on neovim
  { key = 'W', mods = 'ALT', action = act.CloseCurrentPane{ confirm = false } },
  
  { key = 'C', mods = 'ALT|SHIFT', action = act.ClearScrollback 'ScrollbackAndViewport'},

  { key = 'f', mods = 'ALT', action = act.Search { Regex = '' } },

  { key = 'h', mods = 'ALT', action = wezterm.action.Hide },
}

config.color_scheme = "rose-pine-moon"
config.color_schemes = {
  ["Gruvbox Dark Hard"] = {
	foreground = "#ebdbb2",
	background = "#1d2021",
	cursor_bg = "#ebdbb2",
	cursor_fg = "#333333",
	cursor_border = "#ebdbb2",
	selection_fg = "#333333",
	selection_bg = "#ebdbb2",
	scrollbar_thumb = "#333333",
	split = "#333333",
	ansi = {
				"#282828",
				"#cc241d",
				"#98971a",
				"#d79921",
				"#458588",
				"#b16286",
				"#689d6a",
				"#a89984",
	},
	brights = {
				"#928374",
				"#fb4934",
				"#b8bb26",
				"#fabd2f",
				"#83a598",
				"#d3769b",
				"#8ec07c",
				"#ebdbb2",
	},
  }
}
return config
