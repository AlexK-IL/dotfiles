#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Command aliases
alias ls='ls --color=auto'

# Cd automatically on paths
shopt -s autocd

# Add local ~/bin to path
export PATH=~/bin:$PATH

# Add a welcome screen
cowsay -f eyes "I'm watching you"

# Shell prompt, display username full datetime and full path
PS1='\[\e[1;31m\]\u \[\e[1;32m\]\d \T \[\e[1;36m\]\w\[\e[0m\]$ '
