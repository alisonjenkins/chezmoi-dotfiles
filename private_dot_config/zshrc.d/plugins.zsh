if command -v fasd &> /dev/null; then
  eval "$(fasd --init auto)"
fi
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

export ZPLUG_HOME="$HOME/.local/share/zplug"
if [ ! -e "$ZPLUG_HOME" ]; then
  git clone https://github.com/zplug/zplug "$ZPLUG_HOME"
fi

source "$ZPLUG_HOME/init.zsh"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi


zplug "chriskempson/base16-shell"
zplug "marzocchi/zsh-notify"
zplug "romkatv/powerlevel10k", as:theme, depth:1

zplug "alanjjenkins/assume-role-1", defer:2
zplug "alanjjenkins/zsh-my-aws", defer:2
zplug "kiurchv/asdf.plugin.zsh", defer:2
zplug "molovo/tipz", defer:2
zplug "plugins/fzf", from:oh-my-zsh, defer:2
zplug "softmoth/zsh-vim-mode", defer:2

zplug "Aloxaf/fzf-tab", defer:3
zplug "Dbz/kube-aliases", defer:3
zplug "fabiokiatkowski/exercism.plugin.zsh", defer:3
zplug "joepvd/zsh-hints", defer:3
zplug "macunha1/zsh-terraform", defer:3
zplug "plugins/aws", from:oh-my-zsh, defer:3
zplug "unixorn/kubectx-zshplugin", defer:3
zplug "zsh-users/zsh-completions", defer:3

# Then, source plugins and add commands to $PATH
zplug load

# plugins=(
#   # assume-role
#   # command-not-found
#   adb
#   alias-finder
#   ansible
#   archlinux
#   asdf
#   autopep8
#   battery
#   bgnotify
#   colorize
#   docker
#   docker-compose
#   dotenv
#   git
#   git-auto-fetch
#   git-extras
#   git-prompt
#   gitfast
#   golang
#   gpg-agent
#   jsontools
#   kube-ps1
#   kubectl
#   man
#   minikube
#   nmap
#   node
#   npm
#   pass
#   pep8
#   python
#   ripgrep
#   ssh-agent
#   sudo
#   systemd
#   terraform
#   tig
#   vi-mode
#   yarn
# )
