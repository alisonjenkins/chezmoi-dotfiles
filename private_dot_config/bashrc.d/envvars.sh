# Environment variables
export ARDUINO_PATH="/usr/share/arduino"
export AWS_DEFAULT_REGION="eu-west-1"
export EDITOR="vim"
export GOPATH="$HOME/go"
export HISTCONTROL=ignoredups:ignorespace
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH="$PATH:$HOME/.gem/ruby/2.4.0/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.yarn/bin/"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/usr/local/sbin"

# {{{ nnn settings
export NNN_USE_EDITOR=1
export NNN_BMS="h:~;d:~/Downloads;S:~/git/superdry;g:~/git;D:~/Documents;"
# }}}

if [ -z "$SSH_AUTH_SOCK" ];
then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi