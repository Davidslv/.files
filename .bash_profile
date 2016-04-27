# use the the existent ~/.bashrc if there's one
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Load the necessary shell dotfiles
for file in ~/.{aliases,govuk}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

HISTFILESIZE=3500

export EDITOR=vim
export LC_CTYPE=en_GB.UTF-8
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# colour codes
PURPLE="\[\033[0;35m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
LIGHT_CYAN="\[\033[1;36m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
WHITE="\[\033[0;37m\]"
WHITE_BOLD="\[\033[1;37m\]"
GRAY="\[\033[1;30m\]"
COLOR_NONE="\[\e[0m\]"

# prompt functions
function is_git_repository {
  git branch > /dev/null 2>&1
}

function current_branch {
  git branch 2>/dev/null| sed -n '/^\*/s/^\* //p'
}

function set_git_branch {
  if git rev-parse --git-dir >/dev/null 2>&1
  then
    gitver=$(current_branch)
    if git diff --quiet 2>/dev/null >&2
    then
      gitver=$GREEN$gitver
    else
      gitver=$RED$gitver
    fi
  else
    return 0
  fi
  echo $gitver
}

function set_bash_prompt {
  if is_git_repository ; then
    GIT="$WHITE_BOLD on $(set_git_branch)"
  else
    GIT=''
  fi

  username="$(git config github.user)"

  # identify when using vagrant VM
  if [[ $OSTYPE == linux* && $(whoami) -eq vagrant ]] ; then
    PS1="$GRAY\A $LIGHT_RED[\h] \[$(tput setaf 6)\]\W$GIT\[$(tput sgr0)\] \\$ "
  else
    PS1="$GRAY$time$LIGHT_RED @$username $WHITE\w$GIT $COLOR_NONE\$ "
  fi
}

# set the prompt
PROMPT_COMMAND=set_bash_prompt

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# require rbenv
eval "$(rbenv init -)"
