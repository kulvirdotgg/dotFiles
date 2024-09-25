# ---- homebrew ----
eval "$(/opt/homebrew/bin/brew shellenv)"

### ---- Syntax Highlighting ----
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- zoxide ----
eval "$(zoxide init --cmd cd zsh)"

# ---- Git Aliases ----
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gp='git pull'
alias gpsh='git push'
alias gs='git status'

alias ls='lsd'
alias nv='nvim'
alias neofetch="fastfetch"
alias python='python3'

# ---- Air GO hot reload ----
alias air="~/go/bin/air"

# ---- bun ----
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -s "/Users/kulvir/.bun/_bun" ] && source "/Users/kulvir/.bun/_bun"

# ---- startship ----
eval "$(starship init zsh)"

# ---- node wtf idk but fine ----
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
