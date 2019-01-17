# Aliases
alias ls='ls --color=auto'
alias s='sudo'
alias paci='s pacman -S'
alias pacrm='s pacman -Rns'
alias pacup='s pacman -Syu'
alias pacinfo='s pacman -Si'
alias yayi='yay -S'
alias yayup='yay -Syu'
alias uppkgs='pacup && yayup'
alias copy='xclip -selection clipboard -in'
alias paste='xclip -selection clipboard -out'
alias tmuxcp='tmux show-buffer | copy'
alias mp3dl='youtube-dl -x --ignore-errors --download-archive downloaded.txt \
    --audio-quality 0 --audio-format mp3 -o "%(title)s.%(ext)s"'
alias cpw='lpass show --password --clip'
alias trashls='gio list trash://'
alias trashempty='gio trash --empty'
alias bkupkgs='pacman -Qqe | grep -v "$(pacman -Qqm)" > ~/.dotfiles-local/backup/pacman.lst && \
    pacman -Qqm > ~/.dotfiles-local/backup/aur.lst'
alias bkupdots='bkupkgs && \
    g -C ~/.dotfiles add --all && \
    g -C ~/.dotfiles commit -S -m "update" && \
    g -C ~/.dotfiles push; \
    g -C ~/.dotfiles-local add --all && \
    g -C ~/.dotfiles-local commit -S -m "update" && \
    g -C ~/.dotfiles-local push'
