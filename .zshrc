# tmux path
export TMUX_CONF=~/.config/tmux/tmux.conf

eval "$(fzf --zsh)"
export FZF_ALT_C_COMMAND='altc'
altc() {
  echo 'test'
}

#########

########


## source Files

EDITOR=vi

# editor 
export EDITOR=nvim

# theme
source $HOME/.config/zsh/zsh-theme.zsh

# alias keys
source $HOME/.config/zsh/zsh-alias.zsh

# source $HOME/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh





