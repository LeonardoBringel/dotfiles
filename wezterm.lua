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
        key = "s",
        action = wezterm.action.QuickSelect,
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

-- disable default assignments we don't use, so the keys fall through to the
-- shell/nvim instead of being swallowed by wezterm
local disabled_defaults = {
    -- ToggleFullScreen (macOS' own CTRL+COMMAND+F is a system shortcut and
    -- cannot be disabled from here)
    { mods = "ALT", key = "Enter" },

    -- IncreaseFontSize / DecreaseFontSize / ResetFontSize, every default variant.
    -- This also hands CTRL+- and CTRL+_ back to readline (undo).
    { mods = "SUPER", key = "=" },
    { mods = "SUPER", key = "-" },
    { mods = "SUPER", key = "0" },
    { mods = "CTRL", key = "=" },
    { mods = "CTRL", key = "+" },
    { mods = "CTRL", key = "-" },
    { mods = "CTRL", key = "_" },
    { mods = "CTRL", key = "0" },
    { mods = "CTRL", key = ")" },
    { mods = "SHIFT|CTRL", key = "=" },
    { mods = "SHIFT|CTRL", key = "+" },
    { mods = "SHIFT|CTRL", key = "-" },
    { mods = "SHIFT|CTRL", key = "_" },
    { mods = "SHIFT|CTRL", key = "0" },
    { mods = "SHIFT|CTRL", key = ")" },

    -- ActivateTabRelative on COMMAND+SHIFT+[ / ]. Shift+[ emits "{", so wezterm
    -- registers the same physical combo under several spellings; kill them all.
    { mods = "SHIFT|SUPER", key = "[" },
    { mods = "SHIFT|SUPER", key = "]" },
    { mods = "SUPER", key = "{" },
    { mods = "SUPER", key = "}" },
    { mods = "SHIFT|SUPER", key = "{" },
    { mods = "SHIFT|SUPER", key = "}" },

    -- the remaining ActivateTabRelative defaults, so LEADER+n / LEADER+N are the
    -- only way to move between tabs
    { mods = "CTRL", key = "Tab" },
    { mods = "SHIFT|CTRL", key = "Tab" },
    { mods = "CTRL", key = "PageUp" },
    { mods = "CTRL", key = "PageDown" },

    -- Hide (minimize) and HideApplication, every spelling. Only the shifted
    -- letters are bound, so plain CTRL+h / CTRL+m stay untouched -- terminals
    -- send those as Backspace and Return.
    { mods = "SUPER", key = "m" },
    { mods = "SUPER", key = "h" },
    { mods = "CTRL", key = "M" },
    { mods = "CTRL", key = "H" },
    { mods = "SHIFT|CTRL", key = "M" },
    { mods = "SHIFT|CTRL", key = "H" },
    { mods = "SHIFT|CTRL", key = "m" },
    { mods = "SHIFT|CTRL", key = "h" },
}

for _, binding in ipairs(disabled_defaults) do
    table.insert(config.keys, {
        mods = binding.mods,
        key = binding.key,
        action = wezterm.action.DisableDefaultAssignment,
    })
end

-- ActivateTab by index: COMMAND + 1..6 stays enabled (default) for quick tab
-- navigation; COMMAND + 7..9 stays disabled, so tabs beyond 6 are only
-- reachable via LEADER
for i = 7, 9 do
    table.insert(config.keys, {
        mods = "SUPER",
        key = tostring(i),
        action = wezterm.action.DisableDefaultAssignment,
    })
end

-- pane focus/resize on CONTROL+SHIFT+arrows and CONTROL+OPTION+SHIFT+arrows,
-- which duplicate LEADER+arrows and LEADER+SHIFT+arrows
for _, arrow in ipairs({ "LeftArrow", "RightArrow", "UpArrow", "DownArrow" }) do
    for _, mods in ipairs({ "SHIFT|CTRL", "SHIFT|ALT|CTRL" }) do
        table.insert(config.keys, {
            mods = mods,
            key = arrow,
            action = wezterm.action.DisableDefaultAssignment,
        })
    end
end

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
