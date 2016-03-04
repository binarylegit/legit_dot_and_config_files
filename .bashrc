# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

alias ls='ls --color=auto'

# Put your fun stuff here.
export TERM='xterm-256color'

export EDITOR='/usr/bin/vim'

# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  c_reset='\[\e[0m\]'
  c_user='\[\033[1;33m\]'
  c_path='\[\e[1;33m\]'
  c_git_clean='\[\e[1;36m\]'
  c_git_dirty='\[\e[1;35m\]'
else
  c_reset=
  c_user=
  c_path=
  c_git_clean=
  c_git_dirty=
fi

# Function to assemble the Git part of our prompt.
git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

  if git diff --quiet 2>/dev/null >&2; then
    git_color="$c_git_clean"
  else
    git_color="$c_git_dirty"
  fi

  echo "$git_color$git_branch${c_reset}|"
}

#json pretty print with curl, from: http://benw.me/posts/colourized-pretty-printed-json-with-curl/
function jcurl() {
    curl "$@" | json_pp | pygmentize -l json
}
export -f jcurl

# The prompt.  PROMPT_COMMAND=''
PROMPT_COMMAND='PS1="\[\e[1;32m\][${c_reset}$(git_prompt)\[\e[1;32m\]\u:\W]$\[\e[0m\] "'

# rbenv support
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
