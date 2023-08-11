export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt auto_cd
bindkey -v
bindkey "^R" history-incremental-search-backward

alias vim="nvim"
alias v="nvim"
alias py="cd ~/Projects/bpython-env/bin ; source activate ; bpython ; deactivate ; cd -"
alias kaf="kubectl apply -f "
alias kdf="kubectl delete -f "
export EDITOR=nvim

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export GOPATH="$HOME/go"
export PATH="$HOME/.poetry/bin:$PATH:$GOPATH/bin"

eval "$(direnv hook zsh)"

export PROJECTS="$HOME/Projects"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U compinit
compinit

for i in $HOME/.functions/*;
	do source $i
done

source <(kubectl completion zsh)
source <(doctl completion zsh)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
