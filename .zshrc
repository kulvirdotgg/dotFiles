### ---- Syntax Highlighting ----
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Git Aliases ----
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gp='git pull'
alias gpsh='git push'
alias gs='git status'

alias python='python3'

# alias ls='colorls'
alias nv='nvim'

# ---- Air GO hot reload ----
alias air="~/go/bin/air"

# ---- homebrew ----
eval "$(/opt/homebrew/bin/brew shellenv)"

# cool to use tools (if ever wanted to)
alias neofetch="macchina"
# neofetch

# ---- bun ----
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/Users/kulvir/.bun/_bun" ] && source "/Users/kulvir/.bun/_bun"

eval "$(starship init zsh)"
