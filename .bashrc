TERM=xterm-256color

HISTSIZE=10000
HISTFILESIZE=10000
HISTTIMEFORMAT="%F %H:%M:%S "

# GO stuff
# Where is the go binary
export GOROOT=/usr/lib64/go/1.14
export PATH=$PATH:$GOROOT/bin

# Libraries with executables
export GOPATH=/home/jloehel/golib
export PATH=$PATH:$GOPATH/bin
# My Projects
export GOPATH=$GOPATH:/home/jloehel/Projekte/go

# completion
[[ -f /etc/profile.d/bash_completion.sh ]] && . /etc/profile.d/bash_completion.sh

test -s ~/.alias && . ~/.alias || true
test -s ~/.functions && . ~/.functions || true

#- - - - - - - - - - - - - - - - - - -#
#                              prompt #
#- - - - - - - - - - - - - - - - - - -#

# git prompt
source ~/.bash-git-prompt.sh

PROMPT_COMMAND=prompt

# build prompt
prompt() {
  # left prompt
  PS1="\[\e[32m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[33m\]\`parse_git_branch\`\[\e[m\] "$'\u2771 '

  # right prompt
  width=$(expr `tput cols` - 1)
  printf "%${width}s`tput cr`" $(pwd | sed "s:^$HOME:~:")
}
