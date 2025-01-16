#=======================================================================
# Name = oh-my-ps1
# Created by = Diego Cesare <diegocesare300491@gmail.com>
# Insimpled by = Oh My Zsh
# Functions = Make the use of the terminal with zsh
# more friendly and aesthetically
# more beautiful and functional.
# Dependencies = fzf, zsh-syntax-highlighting, zsh-autosuggestions
#=======================================================================

# settings
source $(dirname "$0")/config.zsh

# plugins
# functions
source ~/.config/zsh/functions.sh
# sourse prompt themes
#source ~/.config/zsh/oh-my-ps1/themes.zsh
# use aliases
source ~/.config/zsh/alias.zsh
source $(dirname "$0")/my-ps1.zsh
source $(dirname "$0")/themes.zsh

#$theme
$colorscheme
Main
#prompt_a

precmd_functions+=($Main)

if [[ $syntax = true ]]; then
# syntax-highlighting
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/oh-my-ps1/highlighting.zsh
fi

if [[ $suggestion = true ]]; then
# autosuggestions
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Exports
export PATH="$HOME/.local/bin":$PATH

# fix locale
export LANG=pt_BR.UTF-8
export LC_ALL=pt_BR.UTF-8

# set variables
PATH="/usr/local/bin:/usr/local/sbin/:$PATH"
# enable command history
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt histignorealldups # ignore duplicates in history
setopt HIST_IGNORE_SPACE # ignore commands that begin with a space in history
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';

# Uncomment to select a theme for the prompt
# Restart terminal or zsh with "zsh"
# command in terminal
#===========================================

# Use tmux
#if [ "$TMUX" = "" ]; then tmux; fi

# prompt theme
#prompt_l
# set prompt
unsetopt ALL_EXPORT
setopt PROMPT_SUBST

# set/unset ZSH options
setopt HIST_IGNORE_ALL_DUPS
setopt sunkeyboardhack
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY
unsetopt BG_NICE
setopt CORRECT
SPROMPT='zsh: Mudar de %F{red}%R%f para %F{green}%r%f [y or n]? '
setopt EXTENDED_HISTORY

# setopt HASH_CMDS
setopt MENUCOMPLETE
setopt ALL_EXPORT

# set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

setopt autocd                 # Automatically cd into typed directory.
stty stop undef               # Disable ctrl-s to freeze terminal.
setopt interactive_comments

# autoload zsh modules when they are referenced
autoload -U history-search-end
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof

# zmodload -ap zsh/mapfile mapfile
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# load simple
autoload simple zsh/terminfo
if [[ "$terminfo[simple]" -ge 8 ]]; then
   simple
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
done

# completion Styles
autoload -U compinit
compinit

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*' list-simple ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
# on processes completion complete all user processes
zstyle ':completion:*:processes' command 'ps -au$USER'

# add simple to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-simple '=(#b) #([0-9]#)*=0=01;31'

# NEW completion:
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts \
| grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}')

# filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort

# SSH Completion
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

# history beginning search
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[[1;2A' up-line-or-history
bindkey '^[[1;2B' down-line-or-history
bindkey -a '^[[A' history-beginning-search-backward
bindkey -a '^[[B' history-beginning-search-forward
bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward
bindkey -a 'K' vi-up-line-or-history
bindkey -a 'J' vi-down-line-or-history

bindkey '^[[3~' delete-char; bindkey -a '^[[3~' delete-char # Make delete key work as expected
