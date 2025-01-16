#!/usr/bin/env zsh

source $(dirname "$0")/colors.zsh
source $(dirname "$0")/config.zsh

case $colorscheme in
	dracula) dracula ;;
	gruvbox) gruvbox ;;
	gruvbox-light) gruvbox-light ;;
	nord) nord ;;
	catppuccin-frappe) catppuccin-frappe ;;
	catppuccin-latte) catppuccin-latte ;;
	catppuccin-macchiato) catppuccin-macchiato ;;
	catppuccin-mocha) catppuccin-mocha ;;
	solarized) solarized ;;
	solarized-light) solarized-light ;;
	tokyo-night) tokyo-night ;;
	onedark) onedark ;;
	monokai) monokai ;;
	everforest) everforest ;;
	rose-pine) rose-pine ;;
	rose-pine-light) rose-pine-light ;;
	cherry) cherry ;;
  cherry-light) cherry-light ;;
  retro) retro;;
esac

if [[ $Powerline = "true" ]]; then
# BACKGROUND COLORS
bg0=%k
bg1=%K{$col0}
bg2=%K{$col1}
bg3=%K{$col2}
bg4=%K{$col4}
bg5=%K{$col3}
bg6=%K{$col5}
bg7=%K{$col7}
bg8=%K{$col6}

# FOREGROUND
fg1=%F{$col0}
fg2=%F{$col1}
else
fg1=%F{$col1}
fg2=%F{$col0}
fi

# FOREGROUND COLORS
fg0=%f
fg3=%F{$col2}
fg4=%F{$col4}
fg5=%F{$col3}
fg6=%F{$col5}
fg7=%F{$col7}
fg8=%F{$col6}

function +vi-git-st() {
    local ahead behind remote
    local -a gitstatus

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

    if [[ -n ${remote} ]] ; then
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=("${c3}+${ahead}${c2}")

        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=("oie${c4}-${behind}${c2}")

        hook_com[branch]="$fg3${hook_com[branch]} ${fg1}[pushs $fg3${(j:/:)gitstatus}$fg1]"
    fi
}

# Show count of stashed changes
function +vi-git-stash() {
    local -a stashes

    if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
        stashes=$(git stash list 2>/dev/null | wc -l)
        hook_com[misc]+=" ('${stashes} stashed)"
    fi
}

#autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true

# hash changes branch misc
zstyle ':vcs_info:git*' formats "$fg1($fg1%s$fg0$fg1) $fg0%c%b%m"
zstyle ':vcs_info:git*' actionformats "(%s|%a) %12.12i %c%u %b%m"

zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash
precmd () { vcs_info }

PowerLine(){
    left_rounded=""
    right_rounded=""
    left_square=""
    right_square=""
    left_fragment=""
    right_fragment=""
    left_flame=""
    right_flame=""

    if [[ $Powerline = "true" ]]; then
        if [[ $Powerline_Style = "rounded" ]]; then
            left=`echo -ne $left_rounded`
            right=`echo -ne $right_rounded`
        elif [[ $Powerline_Style = "square" ]]; then
            left=`echo -ne $left_square`
            right=`echo -ne $right_square`
        elif [[ $Powerline_Style = "fragment" ]]; then
            left=`echo -ne $left_fragment`
            right=`echo -ne $right_fragment`
        elif [[ $Powerline_Style = "flame" ]]; then
            left=`echo -ne $left_flame`
            right=`echo -ne $right_flame`

        fi
    fi
}

ErroIndicator()
{
    erro_icon0=""
    erro_icon1=""
    if [[ $Erro_Indicator = "true" ]]; then
        echo "%(?.$fg5$erro_icon0.$fg3$erro_icon1$fg0) "
    fi
}

CommandNumber(){
    PowerLine
    command_number=$bg3$fg1%!$bg0
    if [[ $Command_Number = "true" ]]; then
        echo -ne "$fg3$left$fg0$command_number$fg3$right$fg0 "

    fi
}

UserAndHost()
{
    user_name=$fg4%n$fg0
    sep=$fg8@$fg0
    host_name=$fg5%m$fg0

    if [ $User = "true" ] && [ $Host = "true" ]; then
        echo -ne "$user_name$sep$host_name "
    elif [ $User = "true" ] && [ $Host = "false" ]; then
        echo -ne "$sep$user_name "
    elif [ $User = "false" ] && [ $Host = "true" ]; then
        echo -ne "$sep$host_name "
    fi
}

PathStyle()
{

    PowerLine
    type_large=$fg2$left$fg0$bg2$fg1\ %d\ $bg0$fg2$right$fg0
    type_medium=$fg2$left$fg0$bg2$fg1\ %2~\ $bg0$fg2$right$fg0
    type_small=$fg2$left$fg0$bg2$fg1\ %1~\ $bg0$fg2$right$fg0

    if [[ $Path = "true" ]]; then
        if [[ $Path_Style = "large" ]]; then
            echo -ne "${fg4}in $type_large"
        elif [[ $Path_Style = "medium" ]]; then
            echo -ne "${fg4}in $type_medium"
        else
            echo -ne "${fg4}in $type_small"
        fi
    fi
}


FolderAndFiles()
{

    PowerLine
    folder_icon='📁'
    file_icon='📄'
    files='$(find . -maxdepth 1 -type f | wc -l)'
    folders='$(find . -maxdepth 1 -type d | wc -l)'

    if [ $Folders = "true" ] && [ $Files = "true" ]; then
        echo -ne " $fg4$left$fg1$bg4 $folder_icon $folders $bg4$fg5$left$bg5$fg1 $file_icon $files$fg5 $bg0$right"
    elif [ $Folders = "true" ] && [ $Files = "false" ]; then
        echo -ne " $fg4$left$fg1$bg4 $folder_icon $folders$fg4 $bg0$right"
    elif [ $Folders = "false" ] && [ $Files = "true" ]; then
        echo -ne " $fg5$left$fg1$bg5 $folder_icon $folders$fg5 $bg0$right"
    fi
}

PathSize()
{
    directory_size='$(du -sh . 2>/dev/null | cut -f1)'

    if [[ $Dir_Size = "true" ]]; then
        echo " %F{$col2}$directory_size%f "
    fi
}

GitStatus()
{
    PowerLine
    if [[ $Git_Status = "true" ]]; then
        if $(git rev-parse --is-inside-work-tree &>/dev/null); then
            echo " $fg2$left$bg2 $fg1$vcs_info_msg_0_ $fg1 $fg3$left$bg3$fg1  $fg3$bg0$right"
  	    fi
    fi
}

Clock()
{
    time=$(echo $Clock_Format | sed 's/\([a-zA-Z]\)/%\1/g')
    hour=`date +$time`

    if [[ $Clock = "true" ]]; then
        echo -ne "$fg0$hour "
    fi
}

Main(){
    USERANDHOST=$(UserAndHost)
    PATHSTYLE=$(PathStyle)
    COMMANDNUMBER=$(CommandNumber)
    FOLDERANDFILES=$(FolderAndFiles)
    DIRSIZE=$(PathSize)
    GITSTATUS='$(GitStatus)'
    ERROINDICATOR=$(ErroIndicator)
    CLOCK=$(Clock)

    if [[ $Bold = "true" ]]; then
        BOLD=`echo %B`
    fi

    if [[ $Prompt_Style = "normal" ]]; then
        Indicator=`echo -ne '$fg3$Indicator %f'`
    else
        Indicator=`echo -ne '$fg3\n$Indicator %f'`
    fi

    PROMPT="$BOLD$COMMANDNUMBER$ERROINDICATOR$CLOCK$USERANDHOST$PATHSTYLE$FOLDERANDFILES$DIRSIZE$GITSTATUS $Indicator"
}
