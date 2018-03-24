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

# Search matching history on key up/down
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

# Define plugins for oh-my-zsh
plugins=(
  git
  archlinux
  mvn
  npm
  tmux
  vi-mode
  web-search
  nyan
)

# Source oh-my-zsh
source /usr/share/oh-my-zsh/zshrc

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
alias bkupkgs='pacman -Qqe | grep -v "$(pacman -Qqm)" > ~/.dotfiles/pacman.lst && pacman -Qqm > ~/.dotfiles/aur.lst'
alias cpw='lpass show --password --clip'

# Custom shell variables
typeset -U path
path=(~/.dotfiles/bin $path[@])
