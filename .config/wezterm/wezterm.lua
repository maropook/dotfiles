local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font = wezterm.font("Monaco", { weight = "Regular" })
config.font_size = 12.0
config.use_ime = true
config.window_background_opacity = 0.96
config.macos_window_background_blur = 20
local act = wezterm.action

config.colors = {
  background = "#14161b"
}

config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
config.window_background_gradient = {
  colors = { "#14161b" },
}

config.keys = {
  {
    key = "d",
    mods = "CMD",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "d",
    mods = "CMD|SHIFT",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
    {
    key = "w",
    mods = "CMD",
    action = act.CloseCurrentPane({ confirm = false }), -- ペインだけ閉じる
  },
}

return config