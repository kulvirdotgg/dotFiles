# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# ----------------------
# Aliases
# ----------------------
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gpsh='git push'
alias gs='git status'

alias ls='lsd'
alias nv='nvim'
alias neofetch="fastfetch"
alias python='python3'

# ---- Air for GO ----
alias air="~/go/bin/air"

# ---- starship ----
eval "$(starship init bash)"

# ---- zoxide ----
eval "$(zoxide init --cmd cd bash)"

# ---- fzf ----
eval "$(fzf --bash)"
