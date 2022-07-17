export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt auto_cd
eval "$(pyenv init -)"
eval "$(direnv hook zsh)"
bindkey -v
bindkey "^R" history-incremental-search-backward
