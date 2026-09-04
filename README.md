## Setup

### Install Packages
- Packages are installed using `brew` package manager. To setup a new environment run:
```
brew bundle --file=Brewfile
```

- If you wish to update the packages list, recreate the `Brewfile` with the following command:
```
brew bundle dump --force
```

### Create Symbolic links
- Claude Code Global Instructions and Settings
```
ln -s ./global-claude.md ~/.claude/CLAUDE.md

ln -s ./claude-settings.json ~/.claude/settings.json
```

- P10K
```
ln -s ./p10k.zsh ~/.p10k.zsh
```

- Wezterm
```
ln -s ./wezterm.lua ~/.wezterm.lua
```

- ZSH
```
ln -s ./zshrc ~/.zshrc
```

## Hotkeys

All keybindings — WezTerm, Zsh/fzf and Neovim, including the plugin defaults this setup
inherits — are documented in **[HOTKEYS.md](HOTKEYS.md)**, with key names written for a
MacBook keyboard.

Quick reference for the two leader keys:

| Context | Leader |
| --- | --- |
| WezTerm | `OPTION + w` (prefix, 2s timeout) |
| Neovim | `SPACE` |
