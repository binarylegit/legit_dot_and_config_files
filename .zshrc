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
# Load version control information
autoload -Uz vcs_info

precmd() {
  vcs_info
  if [[ -n ${vcs_info_msg_0_} ]]; then
    #vcs_info found something
    #STATUS line taken from: https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh
    STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
    if [[ -n $STATUS ]]; then
      # git is dirty
      git_color='%K{5}%F{7}'
    else
      # git is clean
      git_color='%K{34}%F{7}'
    fi
  else
    #nothing from vcs_info
    git_color=''
  fi
}

#format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

setopt PROMPT_SUBST
PROMPT='${git_color}${vcs_info_msg_0_}%k%f%K{12}%F{7} %n %f%k%K{2}%F{7} %1~ %f%k%K{208}%F{0} %# %k%f '
