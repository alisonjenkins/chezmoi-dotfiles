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
alias librarian-puppet='docker run --rm -v "$PWD:/puppet" -v /etc/passwd:/etc/passwd:ro --user="$(id -u):$(id -g)" claranet/librarian-puppet'
alias codebuild="~/git/aws-codebuild-docker-images/local_builds/codebuild_build.sh"
alias ewm="cd ~/git/ewmg"
alias fpm='docker run --rm -v "${WORKSPACE}:/source" -v /etc/passwd:/etc/passwd:ro --user=$(id -u):$(id -g) claranet/fpm'
alias jctlw="sudo journalctl -u wpa_supplicant@wlp58s0"
alias key="ssh-add ~/.ssh/ssh_keys/id_bashton_alan"
alias keyb="ssh-add ~/.ssh/ssh_keys/id_bashton"
alias keycl="ssh-add -D"
alias keyaur="ssh-add ~/.ssh/ssh_keys/id_aur"
alias keyp="ssh-add ~/.ssh/ssh_keys/id_personal"
alias keypa="ssh-add ~/.ssh/ssh_keys/id_alan-aws"
alias keypo="ssh-add ~/.ssh/ssh_keys/id_personal_old"
alias keyk='ssh-add ~/.ssh/ssh_keys/id_krystal'
alias kmse='export EYAML_CONFIG=$PWD/.kms-eyaml.yaml'
alias misg="cd ~/git/missguided"
alias sdl="cd ~/git/superdry/laguna"
alias sde="cd ~/git/superdry/superdry-everest"
alias sdm="cd ~/git/superdry/superdry-maverick"
alias sdo="cd ~/git/superdry/osaka"
alias sdw="cd ~/git/superdry/windcheater"
alias sdh="cd ~/git/superdry/superdry-henley"
# alias sleep="i3lock && sudo systemctl suspend"
alias snowrep="~/git/bashton-servicenow/reports.py"
alias snowtick="~/git/bashton-servicenow/view-ticket.py --nobox"
alias snowticks="~/git/bashton-servicenow/sn-tickets.py --team mario"
alias snowticks-luigi="~/git/bashton-servicenow/sn-tickets.py --team luigi"
alias suspend="xscreensaver-command -lock && sleep 1 && sudo systemctl suspend"
alias tf="terraform"
alias tw="task +work"
alias tp="task +personal"
alias vim="nvim"
alias vi="nvim"
alias gpu-on="sudo tee /proc/acpi/bbswitch <<<ON"
alias gpu-off="sudo tee /proc/acpi/bbswitch <<<OFF"

if uname -a | grep 'Darwin' &> /dev/null; then
  alias ll='ls -G';
  alias ls='ls -G';
else
  alias ll='exa -l --grid --git';
  alias ls='exa';
  alias lt='exa --tree --git --long';
fi

# }}}
