test -z "$PROFILEREAD" && . /etc/profile || true

if [ -d "$HOME/bin" ];then
  PATH="$HOME/bin:$PATH"
fi

export EDITOR=vim
export VISUAL=vim
export LES="FSRX"
export PAGER="less"
#export NEWSSERVER=your.news.server
