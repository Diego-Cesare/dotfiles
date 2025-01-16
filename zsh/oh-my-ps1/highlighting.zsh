source $(dirname "$0")/colors.zsh
source $(dirname "$0")/themes.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_MAXLENGTH=512
typeset -gA ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[comment]=fg=$col0
ZSH_HIGHLIGHT_STYLES[alias]=fg=$col4
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=$col7
ZSH_HIGHLIGHT_STYLES[global-alias]=fg=$col4
ZSH_HIGHLIGHT_STYLES[function]=fg=$col1
ZSH_HIGHLIGHT_STYLES[command]=fg=$col1,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=$col4
ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=$col2
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=$col2
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=$col1
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=$col1
ZSH_HIGHLIGHT_STYLES[builtin]=fg=$col6
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=$col2
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=$col4
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=$col6
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=$col4
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]=fg=$col4
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=$col4
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=$col6
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=$col3
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=$col6
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]=fg=$col3
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]=fg=$col3
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=$col1
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]=fg=$col6
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=$col1
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]=fg=$col6
ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=$col3
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=$col2
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]=fg=$col6
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=$col4
ZSH_HIGHLIGHT_STYLES[assign]=fg=$col3
ZSH_HIGHLIGHT_STYLES[named-fd]=fg=$col4
ZSH_HIGHLIGHT_STYLES[numeric-fd]=fg=$col6
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=$col6
ZSH_HIGHLIGHT_STYLES[path]=fg=$col7
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=fg=$col6
ZSH_HIGHLIGHT_STYLES[path_prefix]=fg=$col7
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=fg=$col6
ZSH_HIGHLIGHT_STYLES[globbing]=fg=$col4
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=$col3
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]=fg=$col6
ZSH_HIGHLIGHT_STYLES[col2irection]=fg=$col4
ZSH_HIGHLIGHT_STYLES[arg0]=fg=$col2
ZSH_HIGHLIGHT_STYLES[default]=fg=$col1
ZSH_HIGHLIGHT_STYLES[cursor]=fg=$col2