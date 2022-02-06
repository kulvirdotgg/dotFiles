#export PATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH:$HOME/bin

HOST_NAME=MB

export PATH=$PATH:$HOME/bin

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

emojis=("🌐" "🎲" "🌵")

EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir" "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI > "
eval "$(/opt/homebrew/bin/brew shellenv)"

#fortune | cowsay -f tux "ara ara kulvir kun"

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gd='git diff'
alias gpl='git pull'
alias gp='git push'
alias gs='git status'
