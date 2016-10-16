#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Autocd to directories withoud using cd command
shopt -s autocd

# Aliases
alias ls='ls --color=auto'
alias pacaur='pacaur --aur' # Run pacaur only with aur
alias copy='xclip -selection clipboard -in'
alias paste='xclip -selection clipboard -out'
alias torrent='transmission-remote-cli'

# User variables
export PATH="${PATH}:${HOME}/scripts"
