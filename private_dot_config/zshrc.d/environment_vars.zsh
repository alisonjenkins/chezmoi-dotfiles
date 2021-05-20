# SSH agent
if uname -a | grep 'Linux' &> /dev/null; then
  if [ -z "$SSH_AUTH_SOCK" ]; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
  fi
fi

# Set AWS Region
export AWS_DEFAULT_REGION='eu-west-2'

# Set default editor
export EDITOR='nvim'

# Set the Go Path
export GOPATH="$HOME/go"

# Make shell history ignore duplicated commands and ignore any command
# starting with a space.
export HISTCONTROL=ignoredups:ignorespace

# On Mac have Homebrew Cask install applications to your user's Applications
# directory
if uname -a | grep 'Darwin' &> /dev/null; then
  export HOMEBREW_CASK_OPTS='--appdir=/Applications'
fi

# Setup Path variable
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/home/$USER/go/bin"
export PATH="$PATH:/home/$USER/bin"
export PATH="$PATH:/home/$USER/.local/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$PATH:/home/$USER/.gem/ruby/2.7.0/bin"
export PATH="$PATH:/home/$USER/.gem/ruby/2.6.0/bin"
export PATH="$PATH:/home/$USER/.gem/ruby/2.5.0/bin"
export PATH="$PATH:/home/$USER/.gem/ruby/2.4.0/bin"
export PATH="$PATH:/home/$USER/.asdf/installs/ruby/truffleruby-19.2.0/bin"
export PATH="$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin"

# Todo.txt
export TODO_DIR="$HOME/gdrive/todo/"
export TODO_FILE="$HOME/gdrive/todo/todo.txt"
export DONE_FILE="$HOME/gdrive/todo/done.txt"

# nnn Environment variables
export NNN_OPTS="aedF"
export NNN_BMS="D:~/Documents;d:~/Downloads;g:~/git;h:~;"
