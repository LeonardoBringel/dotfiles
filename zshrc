# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi


# Created by `pipx` on 2024-07-23 19:12:39
export PATH="$PATH:/Users/leonardobringel/.local/bin"

# powerlevel10k
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -- history setup --
# sets the file where command history will be saved.
HISTFILE=$HOME/.zhistory
# limits the number of commands saved to the history file
SAVEHIST=1000
# limits the number of commands stored in memory during a session
HISTSIZE=500
# enables sharing of history between sessions
setopt share_history
# removes duplicates from the history file first
setopt hist_expire_dups_first
# prevents duplicate commands in the history
setopt hist_ignore_dups
# prompts for confirmation before executing a command from the history
setopt hist_verify
# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# fzf
eval "$(fzf --zsh)"

# bat theme
export BAT_THEME=Nord

# alias para o eza
alias l="eza --all --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
# alias ls="eza --all --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --tree --level=2"
alias ll="eza --all --color=always --long --git --tree --level=2"

# fzf configuration
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# thefuck
eval $(thefuck --alias)

# wezterm
alias img="wezterm imgcat --width '50%'"

# postgres
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
