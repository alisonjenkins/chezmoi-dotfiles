# Navigation
## .., ..., ...., ....., and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

alias cdd="cd ~/Downloads/"
alias cdg="cd ~/git/"
alias cdot="chezmoi cd"
alias cdgo="cd \$GOPATH"

# Archlinux specific aliases
alias makepkg='chrt --idle 0 ionice -c idle makepkg'

# {{{ Misc
# alias sleep="i3lock && sudo systemctl suspend"
alias gpu-off="sudo tee /proc/acpi/bbswitch <<<OFF"
alias gpu-on="sudo tee /proc/acpi/bbswitch <<<ON"
alias j='just'
alias key="ssh-add ~/.ssh/ssh_keys/id_bashton_alan"
alias keyaur="ssh-add ~/.ssh/ssh_keys/id_aur"
alias keyb="ssh-add ~/.ssh/ssh_keys/id_bashton"
alias keycl="ssh-add -D"
alias keyk='ssh-add ~/.ssh/ssh_keys/id_krystal'
alias keyp="ssh-add ~/.ssh/ssh_keys/id_personal"
alias keypa="ssh-add ~/.ssh/ssh_keys/id_alan-aws"
alias keypo="ssh-add ~/.ssh/ssh_keys/id_personal_old"
alias kmse='export EYAML_CONFIG=$PWD/.kms-eyaml.yaml'
alias suspend="xscreensaver-command -lock && sleep 1 && sudo systemctl suspend"
alias tf="terraform"
alias tp="task +personal"
alias tw="task +work"
alias vi="nvim"
alias vim="nvim"

if uname -a | grep 'Darwin' &> /dev/null; then
  alias ll='ls -G';
  alias ls='ls -G';
else
  alias ll='exa -l --grid --git';
  alias ls='exa';
  alias lt='exa --tree --git --long';
fi

# }}}
