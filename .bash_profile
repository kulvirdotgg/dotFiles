# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# ---- zoxide ----
eval "$(zoxide init --cmd cd bash)"

# ---- fzf ----
eval "$(fzf --bash)"

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

[ -s "/Users/lilj/.bun/_bun" ] && source "/Users/lilj/.bun/_bun"

# ---- starship ----
eval "$(starship init bash)"
