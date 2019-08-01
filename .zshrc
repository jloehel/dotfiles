# Path to your oh-my-zsh installation.
export ZSH="/home/jloehel/.oh-my-zsh"
ZSH_THEME="gnzh"
plugins=(aws docker git kubectl nmap python suse terraform tmux vagrant)
source $ZSH/oh-my-zsh.sh

TERM=xterm-256color

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Allow multiple terminal sessions to all append to one zsh command history
setopt append_history
# Save timestamp and duration
setopt extended_history
# Adds commands as they are typed, don't wait until shell exit
setopt inc_append_history
# When trimming history, remove oldest duplicates first
setopt hist_expire_dups_first
# Do not write events to history that are duplicates of previous events
setopt hist_ignore_all_dups
# Remove line from history when first character is a space
setopt hist_ignore_space
# When searching history, don't display already cycled results twice
setopt hist_reduce_blanks
# Don't execute, just expand history
setopt hist_verify
# Import new comands and appends typed commands to history
setopt share_history

test -s ~/.alias && . ~/.alias || true
test -s ~/.functions && . ~/.functions || true
