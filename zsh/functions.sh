#!/usr/bin/env zsh

# function to do an ls for each cd
function lcd {
    builtin cd "$@" && logo-ls;
}

# Install package using fzf
function install(){
  pacman -Sl | awk '{print $2" "$4}' \
  | column -t | fzf --reverse --preview 'pacman -Si {1}' \
  | xargs -ro sudo pacman -S
}

# this function installs packages from the AUR repository in the same way as the previous function

function yinstall(){
  yay -Sl | awk '{print $2" "$4}' \
  | column -t | fzf --reverse --preview 'yay -Si {1}' \
  | xargs -ro yay -S
}

# use to delete packages,
# Attention! the packages will be removed
# along with your dependencies
# and configuration files.

function delete(){
  pacman -Sl | awk '{print $2" "$4}' \
  | column -t | grep instalado | fzf --reverse --preview 'pacman -Si {1}' \
  | awk '{print $1}' | xargs -ro sudo pacman -Rscn

}

function list-colorsheme()
{

main_path=~/.config/zsh/oh-my-ps1
# List avaliables color schemes
list_schemes=$(cat $main_path/colors.zsh | grep "()" | cut -d '(' -f1 | fzf --reverse)
# Get current color scheme
get_scheme=$(cat $main_path/config.zsh | grep colorscheme | cut -d '"' -f2)

sed -i "s/$get_scheme/$list_schemes/g" $main_path/config.zsh
zsh
}

function list-themes()
{
cat ~/.config/zsh/oh-my-ps1/themes.zsh | grep "^prompt" | sed 's/(.*//g'
}
