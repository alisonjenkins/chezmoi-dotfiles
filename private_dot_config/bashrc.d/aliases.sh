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
alias codebuild="~/git/aws-codebuild-docker-images/local_builds/codebuild_build.sh"
alias ewm="cd ~/git/ewmg"
alias fpm='docker run --rm -v "${WORKSPACE}:/source" -v /etc/passwd:/etc/passwd:ro --user=$(id -u):$(id -g) claranet/fpm'
alias gpu-off="sudo tee /proc/acpi/bbswitch <<<OFF"
alias gpu-on="sudo tee /proc/acpi/bbswitch <<<ON"
alias j='just'
alias jctlw="sudo journalctl -u wpa_supplicant@wlp58s0"
alias key="ssh-add ~/.ssh/ssh_keys/id_bashton_alan"
alias keyaur="ssh-add ~/.ssh/ssh_keys/id_aur"
alias keyb="ssh-add ~/.ssh/ssh_keys/id_bashton"
alias keycl="ssh-add -D"
alias keyk='ssh-add ~/.ssh/ssh_keys/id_krystal'
alias keyp="ssh-add ~/.ssh/ssh_keys/id_personal"
alias keypa="ssh-add ~/.ssh/ssh_keys/id_alan-aws"
alias keypo="ssh-add ~/.ssh/ssh_keys/id_personal_old"
alias kmse='export EYAML_CONFIG=$PWD/.kms-eyaml.yaml'
alias librarian-puppet='docker run --rm -v "$PWD:/puppet" -v /etc/passwd:/etc/passwd:ro --user="$(id -u):$(id -g)" claranet/librarian-puppet'
alias misg="cd ~/git/missguided"
alias sde="cd ~/git/superdry/superdry-everest"
alias sdh="cd ~/git/superdry/superdry-henley"
alias sdl="cd ~/git/superdry/laguna"
alias sdm="cd ~/git/superdry/superdry-maverick"
alias sdo="cd ~/git/superdry/osaka"
alias sdw="cd ~/git/superdry/windcheater"
alias snowrep="~/git/bashton-servicenow/reports.py"
alias snowtick="~/git/bashton-servicenow/view-ticket.py --nobox"
alias snowticks-luigi="~/git/bashton-servicenow/sn-tickets.py --team luigi"
alias snowticks="~/git/bashton-servicenow/sn-tickets.py --team mario"
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
