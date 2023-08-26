# The following lines were added by compinstall

#zstyle ':completion:*' completer _complete _ignored
#zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
#zstyle :compinstall filename '/home/legit/.zshrc'

#autoload -Uz compinit
#compinit


# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
# End of lines configured by zsh-newuser-install
#

################
# My Additions
################

## Configure Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR='/usr/bin/vim'

export TERM=xterm-kitty

## Configure PATH
##export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-17.0.2.jdk/Contents/Home"
export PYTHON_BIN="/Library/Frameworks/Python.framework/Versions/3.10/bin"

export PATH="$PATH:$PYTHON_BIN"

#alias lf='cd /home/legit/LegitFiles/'
alias gw='./gradlew "$@"'

# Colorful ls output
export CLICOLOR=1
alias ls='ls -G'

###### HOME AND END keybindings for kitty on MacOS ##
bindkey '\e[H'  beginning-of-line
bindkey '\eOH'  beginning-of-line
# End
bindkey '\e[F'  end-of-line
bindkey '\eOF'  end-of-line

## Set up the prompt
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
      git_prefix='%K{5}%F{0} '
      git_appendix=' %k%f%K{0}%F{5}'$'\UE0B0''%f%k%K{12}%F{0}'$'\UE0B0''%f%k'
    else
      # git is clean
      git_prefix='%K{34}%F{0} '
      git_appendix=' %k%f%K{0}%F{34}'$'\UE0B0''%f%k%K{12}%F{0}'$'\UE0B0''%f%k'
    fi
  else
    #nothing from vcs_info
    git_prefix=''
    git_appendix=''
  fi
}

#format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

setopt PROMPT_SUBST
PROMPT='${git_prefix}${vcs_info_msg_0_}${git_appendix}%K{12}%F{0} %n %f%k%K{0}%F{12}'$'\UE0B0''%k%f%K{2}%F{0}'$'\UE0B0''%k%f%K{2}%F{0} %1~ %f%k%K{0}%F{2}'$'\UE0B0''%k%f%K{208}%F{0}'$'\UE0B0''%f%k%K{208}%F{0} %# %k%f%F{208}'$'\UE0B0''%f '
