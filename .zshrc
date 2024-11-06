export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="steeef"
plugins=(git sudo web-search pass nvm node qrcode)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias goto-nginx="cd /home/linuxbrew/.linuxbrew/etc/nginx/"
alias kuru="~/.kuru/index.zsh"
alias please-stop="~/.pleasestop/index.zsh"

source $ZSH/oh-my-zsh.sh