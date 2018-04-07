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

# Aliases
alias ls='ls --color=auto'
alias pacaur='pacaur --aur' # Run pacaur only with aur
alias auri='pacaur -y'
alias paci='sudo pacman -S'
alias pacrm='sudo pacman -Rns'
alias pacup='sudo pacman -Syyu'
alias copy='xclip -selection clipboard -in'
alias paste='xclip -selection clipboard -out'
alias torrent='transmission-remote-cli'
alias mountandroid='simple-mtpfs ~/mnt'
alias umountandroid='fusermount -u ~/mnt'
alias bkupkgs='pacman -Qqe | grep -v "$(pacman -Qqm)" > ~/.dotfiles/pacman.lst && pacman -Qqm > ~/.dotfiles/aur.lst'
alias cpw='lpass show --password --clip'
alias clr='cd && clear'
alias i3cheatsheet='egrep ^bind ~/.config/i3/config | cut -d '\'' '\'' -f 2- | sed '\''s/ /\t/'\'' | column -ts $'\''\t'\'' | pr -2 -w 160 -t | less'
alias netflix='qtwebflix --register-pepper-plugins="/usr/lib/qt/plugins/ppapi/libwidevinecdmadapter.so; application/x-ppapi-widevine-cdm"'
alias trashls='gio list trash://'
alias trashempty='gio trash --empty'

# Custom shell variables
typeset -U path
path=(~/.dotfiles/bin $path[@])
