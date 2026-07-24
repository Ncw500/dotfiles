-- Configuration template code
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Behavior 
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = 'RESIZE'
config.window_close_confirmation = "NeverPrompt"
config.automatically_reload_config = true

-- General style 
config.window_background_opacity = 0.8
config.text_background_opacity = 0.8
config.macos_window_background_blur = 20

config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 20,
}

-- Color scheme 
config.color_scheme = 'Afterglow (Gogh)'

-- Font 
config.font = wezterm.font 'JetBrainsMonoNL Nerd Font'
config.font_size = 20

-- Return configuration object to wezterm
return config


