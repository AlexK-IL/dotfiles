# Aliases
alias ls='ls --color=auto'
alias s='sudo'
alias auri='aurman -S --noconfirm'
alias aurls='pacman -Qe'
alias aurup='aurman -Syyu --noconfirm'
alias aurrm='aurman -Rns'
alias aurinfo='aurman -Qi'
alias aursearch='aurman -Ss'
alias copy='xclip -selection clipboard -in'
alias paste='xclip -selection clipboard -out'
alias tmuxcp='tmux show-buffer | copy'
alias torrent='transmission-remote-cli'
alias mp3dl='youtube-dl -x --ignore-errors --download-archive downloaded.txt --audio-quality 0 --audio-format mp3 -o "%(title)s.%(ext)s"'
alias syncdirs='rsync -avzP --delete'
alias mountandroid='simple-mtpfs ~/mnt'
alias umountandroid='fusermount -u ~/mnt'
alias bkupkgs='pacman -Qqe | grep -v "$(pacman -Qqm)" > ~/.dotfiles-local/backup/pacman.lst && pacman -Qqm > ~/.dotfiles-local/backup/aur.lst'
alias cpw='lpass show --password --clip'
alias i3cheatsheet='egrep ^bind ~/.config/i3/config | cut -d '\'' '\'' -f 2- | sed '\''s/ /\t/'\'' | column -ts $'\''\t'\'' | pr -2 -w 160 -t | less'
alias netflix='qtwebflix --register-pepper-plugins="/usr/lib/qt/plugins/ppapi/libwidevinecdmadapter.so; application/x-ppapi-widevine-cdm"'
alias trashls='gio list trash://'
alias trashempty='gio trash --empty'
alias docker='sudo docker'
alias bkupdots='bkupkgs && gcam --git-dir=~/.dotfiles "update" && gp --git-dir=~/.dotfiles && gcam \
--git-dir=~/.dotfiles-local "update" && gp --git-dir=~/.dotfiles-local'
