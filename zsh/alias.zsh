#!/bin/zsh
alias res="reset"
alias q="exit"
alias c="clear"
alias df="df -ahiT --total"
alias mkdir="mkdir -pv"
alias ls="ls --color=auto"
alias lsa="ls -a --color=auto"
alias lsl="ls -l --color=auto"
alias free="free -h"
alias wget="wget -c"
alias grep='grep --color=auto'
alias tch='touch'
alias look-fonts='pango-list --variations'

# Configs
# Zsh
alias zconf="nvim ~/.zshrc"
alias zalias="nvim ~/.config/zsh/alias.zsh"

# Picom
alias picom-conf="nvim ~/.config/picom.conf"

# Gentoo
alias gup="sudo emaint --auto sync; sudo emerge --ask --verbose --update --deep --newuse @world"
alias gclean="sudo emerge --ask --verbose --depclean"
alias gdel="sudo emerge --ask --unmerge"
alias gin="sudo emerge --ask"
alias gse="emerge -s"
alias ecldist="eclean-dist"
alias pkginfo="epkginfo"

# Arch, Artix, Arco Linux
alias it='sudo pacman -S'
alias del='sudo pacman -Rscn'
alias se='sudo pacman -Si'
alias sy='sudo pacman -Sy'
alias up="sudo pacman -Syyuu"
alias del-orp='sudo pacman -Rsn $(pacman -Qdtq)'

# Debian family
alias aptse='sudo apt search "^$2" | grep $1'
alias aptupdate='sudo apt update'
alias aptupgrade='sudo apt upgrade'
alias aptin='sudo apt install'

# FVWM
alias fvconf='nvim ~/.fvwm/settings/settings.sh'
# KITTY
alias kittyconf='nvim ~/.config/kitty/kitty.conf'
