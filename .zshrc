# ---- homebrew ----
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# ---- starship ----
eval "$(starship init zsh)"

# ---- zoxide ----
eval "$(zoxide init --cmd cd zsh)"

# ---- fzf ----
source <(fzf --zsh)

# ---- Syntax Highlighting ----
source /nix/store/5vkzp4m7aazakijfaq579mk5i40j57x0-zsh-syntax-highlighting-0.8.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(direnv hook zsh)"
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
