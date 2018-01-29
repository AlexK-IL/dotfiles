#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colorscheme
(cat ~/.cache/wal/sequences &)

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# Autocd to directories withoud using cd command
shopt -s autocd

# Aliases
alias ls='ls --color=auto'
alias pacaur='pacaur --aur' # Run pacaur only with aur
alias auri='pacaur -y'
alias paci='sudo pacman -S'
alias copy='xclip -selection clipboard -in'
alias paste='xclip -selection clipboard -out'
alias torrent='transmission-remote-cli'
alias mountandroid='simple-mtpfs ~/mnt'
alias umountandroid='fusermount -u ~/mnt'
alias backuppkgs='pacman -Qqe | grep -v "$(pacman -Qqm)" > ~/.dotfiles/pacman.lst && pacman -Qqm > ~/.dotfiles/aur.lst'

# Command prompt
PS1='[\u@\h \W]\$ '

# Custom shell variables
PATH=~/.dotfiles/bin:${PATH}
