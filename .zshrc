#!/bin/zsh

source ~/.aliases

# aliases
alias 'grep'='grep --color'

#PS1=$'%n@%m%{\e[1;31m%}:%{\e[0m%}%~%#'

# correction
setopt correctall

# auto completion & rotate throught the match
setopt AUTO_LIST AUTO_MENU

# Completion Control
compctl -g '*.java' + -g '*(-/)' javac
compctl -g '*.py' + -g '*(-/)' python 
compctl -g '*(-/) .*(-/)' cd


# Autoload screen if we aren't in it.  (Thanks Fjord!)
#if [[ $STY = '' ]] then screen -xR; fi

#{{{ ZSH Modules

autoload -U compinit promptinit zcalc zsh-mime-setup
compinit
promptinit
zsh-mime-setup

# prompt (prompt -l to list all default themes) NOTE: promptinit should be loaded before
#prompt bigfade black white grey white

#}}}

# classic prompt
export PROMPT=$'%(?..%{\e[41;38m%}%B-%?-%b%{\e[0m%} )%(1j.%{\e[01;33m%}[%j] .)%{\e[01;36m%}%n@%m%{\e[0m%} %{\e[01;32m%}%2~%{\e[0m%} %B%#%b '
export RPROMPT=$'%{\e[01;31m%}[%!]%{\e[0m%}'		# history # on right

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Spell check commands!  (Sometimes annoying)
setopt CORRECT

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT
setopt ZLE

#for sharing history between zsh processes 
setopt INC_APPEND_HISTORY 
setopt SHARE_HISTORY

# history default settings
HISTSIZE=200
HISTFILE=~/.zsh_history
SAVEHIST=200

# less with VIM syntax highlite capability 
alias vless='/usr/share/vim/vim72/macros/less.sh'

# add aliases easiley with 'al' command 
ALIASES=~/.aliases

function al {
    echo "alias $1='$2'" >> $ALIASES;
    echo Adding alias: `tail -1 $ALIASES`;
    source $ALIASES;
}
