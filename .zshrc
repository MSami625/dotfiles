# PATHS
export PATH="$HOME/bin:/usr/local/bin:$PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 


alias gs="git status"
alias gp="git push"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias reload="source ~/.zshrc"
alias cls="clear"


export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"