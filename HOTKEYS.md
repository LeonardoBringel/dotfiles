# Hotkeys

Central map of every keybinding in this dotfiles setup: **WezTerm**, **Zsh/fzf** and **Neovim** —
including the plugin defaults that are inherited (not written in the config files, but active).

All key names are written for an **Apple MacBook keyboard**.

---

## Key naming

Keys are spelled out by name. Only the arrow keys use symbols: `←` `↓` `↑` `→`.

| Key on the MacBook | Written here as | Written in configs as |
| --- | --- | --- |
| Command | `COMMAND` | `CMD` / `SUPER` |
| Option (Alt) | `OPTION` | `ALT` / `META` / `M-` |
| Control | `CONTROL` | `CTRL` / `C-` |
| Shift | `SHIFT` | `SHIFT` / `S-` |
| Return | `RETURN` | `Enter` / `<CR>` |
| Tab | `TAB` | `Tab` / `<Tab>` |
| Esc | `ESC` | `Esc` / `<Esc>` |
| Delete (backspace) | `DELETE` | `Backspace` / `<BS>` |
| Space bar | `SPACE` | `<Space>` / `" "` |
| Function | `FN` | `fn` |
| Arrow keys | `←` `↓` `↑` `→` | `LeftArrow` … / `<Left>` … |

MacBook keyboards have **no dedicated Home / End / Page Up / Page Down keys**:

| Intent | MacBook combo |
| --- | --- |
| Home | `FN + ←` |
| End | `FN + →` |
| Page Up | `FN + ↑` |
| Page Down | `FN + ↓` |
| Forward Delete | `FN + DELETE` |

**Case sensitivity:** an uppercase letter in a mapping means the Shift key is part of the combo.
`LEADER + N` = `LEADER` then `SHIFT + n`.

**Option as Alt:** WezTerm treats the left `OPTION` as a real Alt/Meta key, which is what makes
`ALT`-based bindings (WezTerm leader, fzf `OPTION + c`) work instead of typing accented characters.

---

## 1. WezTerm

Config: [wezterm.lua](wezterm.lua)

### Leader key

| Action | Keys |
| --- | --- |
| **LEADER** | `OPTION + w` |

The leader is a *prefix*, not a modifier: press and release `OPTION + w`, then press the next key.
It stays armed for **2 seconds** (`timeout_milliseconds = 2000`).

### Tabs & panes

| Action | Keys |
| --- | --- |
| New tab | `LEADER` → `c` |
| Split pane horizontally (side by side) | `LEADER` → `\` |
| Split pane vertically (stacked) | `LEADER` → `-` |

### Selection

| Action | Keys |
| --- | --- |
| Quick-select mode | `LEADER` → `s` |

> Quick-select overlays short jump labels on every match of its patterns — URLs, file paths, git
> hashes, IPs and quoted strings. Type a label to copy that text to the clipboard; `ESC` exits.

### Navigation

| Action | Keys |
| --- | --- |
| Next tab | `LEADER` → `n` |
| Previous tab | `LEADER` → `SHIFT + n` |
| Focus pane to the left | `LEADER` → `←` |
| Focus pane to the right | `LEADER` → `→` |
| Focus pane above | `LEADER` → `↑` |
| Focus pane below | `LEADER` → `↓` |

### Resize panes

Each press adjusts the current pane by **5 cells**.

| Action | Keys |
| --- | --- |
| Grow/shrink toward the left | `LEADER` → `SHIFT + ←` |
| Grow/shrink toward the right | `LEADER` → `SHIFT + →` |
| Grow/shrink toward the top | `LEADER` → `SHIFT + ↑` |
| Grow/shrink toward the bottom | `LEADER` → `SHIFT + ↓` |

### WezTerm built-in defaults (macOS)

Not defined in `wezterm.lua` — these ship with WezTerm and are still available.
Verified against `wezterm show-keys`.

| Action | Keys |
| --- | --- |
| Copy / Paste | `COMMAND + c` / `COMMAND + v` |
| New window | `COMMAND + n` |
| New tab | `COMMAND + t` |
| Close tab / pane (asks to confirm) | `COMMAND + w` |
| Search scrollback | `COMMAND + f` |
| Clear scrollback | `COMMAND + k` |
| Command palette | `CONTROL + SHIFT + p` |
| Enter copy mode | `CONTROL + SHIFT + x` |
| Reload configuration | `COMMAND + r` |
| Quit WezTerm | `COMMAND + q` |

---

## 2. Terminal (Zsh + fzf)

Config: [zshrc](zshrc)

### History

| Action | Keys | Notes |
| --- | --- | --- |
| History search backward | `↑` | Searches using what's already typed as a prefix |
| History search forward | `↓` | Same, in the other direction |

### fzf

`fzf` is loaded via `eval "$(fzf --zsh)"`, which installs the three bindings below.

| Action | Keys | Preview |
| --- | --- | --- |
| Fuzzy-find a file/dir and paste it on the command line | `CONTROL + t` | `bat` for files, `eza --tree` for dirs |
| Fuzzy-search command history | `CONTROL + r` | — |
| Fuzzy-find a directory and `cd` into it | `OPTION + c` | `eza --tree` |
| Trigger fuzzy completion for the current command | `**` then `TAB` | Per-command preview via `_fzf_comprun` |

Inside the fzf window:

| Action | Keys |
| --- | --- |
| Move down / up | `↓` / `↑` |
| Accept selection | `RETURN` |
| Cancel | `ESC` or `CONTROL + c` |
| Scroll the preview | `SHIFT + ↓` / `SHIFT + ↑` (only when the preview overflows) |
| Multi-select (when enabled) | `TAB` / `SHIFT + TAB` |

> **Preview scrolling is a no-op when the preview already fits on screen.** `bat` output for a
> short file, or `eza --tree` for a small directory, has nothing to scroll. Test it on a long
> file: `CONTROL + t`, then select something like `p10k.zsh`.

### zsh-autosuggestions

| Action | Keys |
| --- | --- |
| Accept the whole suggestion | `→` |

### Zsh line editing (emacs mode defaults)

| Action | Keys |
| --- | --- |
| Beginning / end of line | `CONTROL + a` / `CONTROL + e` |
| Delete char before / under cursor | `CONTROL + h` |
| Delete to end of line | `CONTROL + k` |
| Delete whole line | `CONTROL + u` |
| Delete previous word | `CONTROL + w` |
| Clear screen | `CONTROL + l` |
| Interrupt / suspend current job | `CONTROL + c` / `CONTROL + z` |

### Aliases (typed, not chorded)

| Alias | Expands to |
| --- | --- |
| `l` | `eza` long listing, git-aware, icons, no size/time/user/permissions |
| `ll` | `eza` long listing as a 2-level tree |
| `img` | `wezterm imgcat --width '50%'` — render an image inline |
| `fuck` | `thefuck` — correct the previous command |

---

## 3. Neovim

Config: [nvim/](nvim)

### Leader key

| Action | Keys |
| --- | --- |
| **LEADER** | `SPACE` |

### Basic operations

Source: [nvim/lua/keymaps.lua](nvim/lua/keymaps.lua)

| Action | Keys | Mode |
| --- | --- | --- |
| Save file (`:w`) | `LEADER` → `w` | Normal |
| Quit (`:q`) | `LEADER` → `q` | Normal |
| Clear search highlight (`:noh`) | `LEADER` → `h` | Normal |
| Move selected lines up | `SHIFT + k` | Visual |
| Move selected lines down | `SHIFT + j` | Visual |

### Re-mapped motions (auto-centering)

These override built-in motions so the cursor line is recentered after the jump.

| Action | Keys | Mode |
| --- | --- | --- |
| Next search result, centered | `n` | Normal |
| Previous search result, centered | `SHIFT + n` | Normal |
| Previous paragraph, centered | `{` | Normal |
| Next paragraph, centered | `}` | Normal |

### LSP

Source: [nvim/lua/plugins/options/lsp.lua](nvim/lua/plugins/options/lsp.lua) — active only in buffers with an attached
language server (`lua_ls`, `pyright`).

| Action | Keys | Mode |
| --- | --- | --- |
| Hover documentation | `LEADER` → `SPACE` (Space Space) | Normal |
| Go to declaration | `g` → `SHIFT + d` | Normal |
| Go to type definition | `g` → `o` | Normal |
| List references | `g` → `r` | Normal |
| Signature help | `g` → `s` | Normal |
| Rename symbol | `LEADER` → `r` → `r` | Normal |
| Format buffer (async) | `LEADER` → `f` → `f` | Normal |
| Code action / quick fix | `LEADER` → `x` → `x` | Normal |

### Telescope

Source: [nvim/lua/plugins/keymaps/telescope_keymaps.lua](nvim/lua/plugins/keymaps/telescope_keymaps.lua)

| Action | Keys | Mode |
| --- | --- | --- |
| Find files | `LEADER` → `f` → `s` | Normal |
| Live grep (find content) | `LEADER` → `f` → `z` | Normal |
| Recent / previously opened files | `LEADER` → `f` → `o` | Normal |
| Open buffers | `LEADER` → `f` → `b` | Normal |

Inside the Telescope picker (defaults):

| Action | Keys |
| --- | --- |
| Next / previous result | `CONTROL + n` / `CONTROL + p` (or `↓` / `↑`) |
| Open selection | `RETURN` |
| Open in horizontal split | `CONTROL + x` |
| Open in vertical split | `CONTROL + v` |
| Open in a new tab | `CONTROL + t` |
| Scroll preview down / up | `CONTROL + d` / `CONTROL + u` |
| Toggle multi-selection | `TAB` / `SHIFT + TAB` |
| Send to quickfix list | `OPTION + q` |
| Which-key help for the picker | `CONTROL + /` |
| Close picker | `ESC` or `CONTROL + c` |

### File tree (nvim-tree)

Source: [nvim/lua/plugins/keymaps/file_tree_keymaps.lua](nvim/lua/plugins/keymaps/file_tree_keymaps.lua)

| Action | Keys | Mode |
| --- | --- | --- |
| Toggle tree / reveal current file | `LEADER` → `e` | Normal |

Inside the tree buffer (defaults):

| Action | Keys |
| --- | --- |
| Show all mappings (help) | `g` → `?` |
| Open file / expand folder | `RETURN` or `o` |
| Open in vertical split | `CONTROL + v` |
| Open in horizontal split | `CONTROL + x` |
| Open in a new tab | `CONTROL + t` |
| Preview file without leaving the tree | `TAB` |
| Go to parent directory | `SHIFT + p` |
| Set tree root up one directory | `-` |
| Set tree root to node under cursor | `CONTROL + ]` |
| Create file/folder | `a` |
| Delete | `d` |
| Rename | `r` |
| Cut / Copy / Paste | `x` / `c` / `p` |
| Copy name / relative path / absolute path | `y` / `SHIFT + y` / `g` → `y` |
| Toggle hidden (dotfiles) | `SHIFT + h` |
| Toggle gitignored | `SHIFT + i` |
| Refresh | `SHIFT + r` |
| Collapse all | `SHIFT + w` |
| Close tree | `q` |

> The config sets `filters.dotfiles = false`, so dotfiles are **visible by default**.

### Comments (nvim-comment)

Source: [nvim/lua/plugins/keymaps/toggle_comment_keymaps.lua](nvim/lua/plugins/keymaps/toggle_comment_keymaps.lua)

| Action | Keys | Mode |
| --- | --- | --- |
| Toggle comment on line / selection | `LEADER` → `/` | Normal, Visual |

> The plugin's own default mappings are disabled (`create_mappings = false`), so `LEADER + /`
> is the only entry point.

### Completion (nvim-cmp)

Source: [nvim/lua/plugins/lsp.lua](nvim/lua/plugins/lsp.lua) — Insert mode, while the completion menu is open.

| Action | Keys |
| --- | --- |
| Confirm selected item | `RETURN` (explicit selection required) |
| Confirm selected item (preset) | `CONTROL + y` |
| Next / previous item | `CONTROL + n` / `CONTROL + p` (or `↓` / `↑`) |
| Scroll docs down / up | `CONTROL + f` / `CONTROL + b` |
| Abort / close the menu | `CONTROL + e` |

### Autopairs (nvim-autopairs)

No keybindings — brackets and quotes close automatically on Insert, and pairing is
synced with `nvim-cmp` confirmations.

### Git blame (git-blame.nvim)

No keybindings — blame for the current line is shown as virtual text. Drive it with commands:
`:GitBlameToggle`, `:GitBlameOpenCommitURL`, `:GitBlameCopySHA`.

---

## Conflicts & things to watch

- **`CONTROL + t`** means *fzf file widget* in the shell but *open in new tab* inside Telescope /
  nvim-tree. Context decides — they never fire in the same place.
- **`CONTROL + r`** is fzf history search in the shell; in Neovim it stays `redo`.
- **`LEADER + f`** in Neovim is a shared prefix: `fs`/`fz`/`fo`/`fb` go to Telescope, `ff` to LSP format.
