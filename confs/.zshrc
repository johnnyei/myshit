autoload -Uz compinit && compinit

#history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000
# share history across multiple zsh sessions
setopt SHARE_HISTORY
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# fwd-i-search enable through C-s
stty -ixon

# CTRL+U doesn't cut entire line fix
bindkey "^U" backward-kill-line

alias k="kubectl"
alias ll="ls -al"
alias ekm="sed -i -e '/\[kubernetes\]/{n;s/.*/disabled = false/;}' ~/.config/starship.toml"
alias dkm="sed -i -e '/\[kubernetes\]/{n;s/.*/disabled = true/;}' ~/.config/starship.toml"

#pyenv controlling python version
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#starship
eval "$(starship init zsh)"
