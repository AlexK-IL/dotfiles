# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Set tty colors by wal
source ~/.cache/wal/colors-tty.sh

# Colorscheme
(cat ~/.cache/wal/sequences &)

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
#PS1='[\u@\h \W]\$ '

# Custom shell variables
typeset -U path
PATH=~/.dotfiles/bin:${PATH}
