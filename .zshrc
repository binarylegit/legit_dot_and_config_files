# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/legit/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
#

################
# My Additions
################
export EDITOR='/usr/bin/vim'

alias lf='cd /mnt/c/Users/Legit/LegitFiles/'
alias gw='./gradlew "$@"'

# Set up the prompt
setopt PROMPT_SUBST
PROMPT='%K{12}%F{7} %n %f%k%K{2}%F{7} %1~ %f%k%K{208}%F{0} %# %k%f '
