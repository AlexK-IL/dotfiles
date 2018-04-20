# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
HISTFILE=~/.histfile
HIST_STAMPS="mm/dd/yyyy"
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

# Enable help command
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-openssl
autoload -Uz run-help-p4
autoload -Uz run-help-sudo
autoload -Uz run-help-svk
autoload -Uz run-help-svn
alias help=run-help

# Colorscheme
(cat ~/.cache/wal/sequences &)

# Search matching history on key up/down
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

# Define plugins for oh-my-zsh
plugins=(
  git
  tmux
)

# Plugin variables
ZSH_TMUX_AUTOSTART=true

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Source fuzzy finder
 source /usr/share/fzf/key-bindings.zsh
 source /usr/share/fzf/completion.zsh

# Start SSH agent if needed
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)" > /dev/null
fi
