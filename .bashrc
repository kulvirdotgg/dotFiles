# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# ---- zoxide ----
eval "$(zoxide init --cmd cd bash)"

# ----------------------
# Aliases
# ----------------------
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gd='git diff'
alias gpl='git pull'
alias gp='git push'
alias gs='git status'

alias ls='lsd'
alias cd='z'
alias nv='nvim'
alias neofetch="fastfetch"
alias python='python3'

# ---- Air for GO ----
alias air="~/go/bin/air"

# ---- bun ----
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/kulvir/.bun/_bun" ] && source "/Users/kulvir/.bun/_bun"

# ---- starship ----
eval "$(starship init bash)"

# ---- node wtf idk but fine ----
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
