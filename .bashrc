# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

set -h

# nvm Setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# tmuxifier setup
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

# Aliases
alias n="nvim"
alias learnc="cd $HOME/Developer/learning/c/"
alias bye="exit"
alias stuzubi="tmuxifier s stuzubi"
alias vystem="tmuxifier s vystem"
alias python='python3'
alias wake-vystem="kubectl get deployments -o name | grep -v -E '(master|debug-redis|influxdb|prom-adapter|develop-thumbnail)' | xargs -I {} kubectl scale {} --replicas=1"
alias kill-vystem="kubectl get deployments -o name | grep -v -E '(master|debug-redis|influxdb|prom-adapter|develop-thumbnail)' | xargs -I {} kubectl scale {} --replicas=0"

# kill all tmux sessions and running valkey servers
kill-tmux() {
  valkey-cli shutdown || echo
  tmux kill-server
}

# git flow like helper functions
feature() {
  git checkout -b "feature-$1"
}

bugfix() {
  git checkout -b "bugfix-$1"
}

. "$HOME/.local/share/../bin/env"
