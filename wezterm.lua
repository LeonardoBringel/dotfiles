-- loading wezterm module
local wezterm = require("wezterm")

-- loading config builder to a variable
local config = wezterm.config_builder()

-- settup font
config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 19

-- setup background
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10
--config.window_decorations = "RESIZE"

--config.color_scheme = 'Tokyo Night'
--config.color_scheme = 'ChallengerDeep'
--config.color_scheme = 'Rouge 2'
config.color_scheme = 'Overnight Slumber'

-- setup shortcuts
config.leader = { key = "w", mods = "ALT", timeout_milliseconds = 2000 } -- ALT = Option
config.keys = {
    {
        mods = "LEADER",
        key = "c",
        action = wezterm.action.SpawnTab "CurrentPaneDomain",
    },
    {
        mods = "LEADER",
        key = "N",
        action = wezterm.action.ActivateTabRelative(-1)
    },
    {
        mods = "LEADER",
        key = "n",
        action = wezterm.action.ActivateTabRelative(1)
    },
    {
        mods = "LEADER",
        key = "\\",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
    },
    {
        mods = "LEADER",
        key = "-",
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
    },
    {
        mods = "LEADER",
        key = "LeftArrow",
        action = wezterm.action.ActivatePaneDirection "Left"
    },
    {
        mods = "LEADER",
        key = "DownArrow",
        action = wezterm.action.ActivatePaneDirection "Down"
    },
    {
        mods = "LEADER",
        key = "UpArrow",
        action = wezterm.action.ActivatePaneDirection "Up"
    },
    {
        mods = "LEADER",
        key = "RightArrow",
        action = wezterm.action.ActivatePaneDirection "Right"
    },
    {
        mods = "LEADER|SHIFT",
        key = "LeftArrow",
        action = wezterm.action.AdjustPaneSize { "Left", 5 }
    },
    {
        mods = "LEADER|SHIFT",
        key = "RightArrow",
        action = wezterm.action.AdjustPaneSize { "Right", 5 }
    },
    {
        mods = "LEADER|SHIFT",
        key = "DownArrow",
        action = wezterm.action.AdjustPaneSize { "Down", 5 }
    },
    {
        mods = "LEADER|SHIFT",
        key = "UpArrow",
        action = wezterm.action.AdjustPaneSize { "Up", 5 }
    },
}

-- center new window
wezterm.on("gui-startup", function(cmd)
	local screen = wezterm.gui.screens().main
	local ratio = 0.7
	local width, height = screen.width * ratio, screen.height * ratio
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {
		position = { x = (screen.width - width) / 2, y = (screen.height - height) / 2 },
	})
	-- window:gui_window():maximize()
	window:gui_window():set_inner_size(width, height)
end)

-- return the updated config
return config
