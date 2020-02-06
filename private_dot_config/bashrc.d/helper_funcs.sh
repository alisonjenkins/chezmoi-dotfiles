# {{{ Bash helper functions
if [ ! -e "$HOME/.local/share" ]; then
  mkdir -p "$HOME/.local/share"
fi

# {{{ Installations
# {{{ Asdf installation
ASDF_DIR="$HOME/.local/share/asdf"
if [ ! -e "$ASDF_DIR" ]; then
  git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR" --branch v0.5.0
fi
# }}}
# {{{ base16 installation
BASE16_SHELL="$HOME/.config/base16-shell/"
if [ ! -e "${BASE16_SHELL}" ]; then
  git clone git@github.com:chriskempson/base16-shell.git "${BASE16_SHELL}"
fi
# }}}
# {{{ Bash preexec
BASH_PREEXEC="$HOME/.local/share/bash-preexec"
if [ ! -e "${BASH_PREEXEC}" ]; then
  git clone https://github.com/rcaloras/bash-preexec.git "${BASH_PREEXEC}"
fi
# }}}
# }}}
# {{{ Source existing files bash helpers
SOURCE_FILES=(
    $HOME/git/bashton-my-aws/functions
    $HOME/git/bashton-sshuttle/sshuttle-vpn
    $HOME/git/puppet-log-reader/bash-functions.sh
    /usr/share/bash-completion/bash_completion
    /usr/share/doc/pkgfile/command-not-found.bash
    /usr/share/git/completion/git-completion.bash
    /usr/local/git/contrib/completion/git-completion.bash
    /usr/share/git/completion/git-prompt.sh
    /usr/local/etc/bash_completion.d/git-prompt.sh
    /usr/lib/ruby/gems/2.5.0/gems/tmuxinator-0.12.0/completion/tmuxinator.bash
    "$HOME/.local/share/asdf/completions/asdf.bash"
    "$HOME/.local/share/asdf/asdf.sh"
    "${BASH_PREEXEC}/bash-preexec.sh"
)

for FILE in "${SOURCE_FILES[@]}";
do
    if [ -e "$FILE" ];
    then
        source "$FILE"
    fi
done
# }}}
# {{{ FASD Initialisation
if command -v fasd &>/dev/null; then
  eval "$(fasd --init auto)"
fi
# }}}
# {{{ ASDF plugin installation
# ASDF_PLUGINS=(
#   kops
#   kube-capacity
#   kubectl
#   kubectl-bindrole
#   kubefedctl
#   kubeseal
#   kubesec
#   kubeval
#   ruby
#   terraform
#   terraform-validator
#   tflint
# )

# for plugin in "${ASDF_PLUGINS[@]}"; do
#   if [ ! -e ".asdf/plugins/${plugin}" ]; then
#     asdf plugin-add "${plugin}"
#     ASDF_LATEST=$(asdf list-all "${plugin}" | tail -n1)
#     asdf install "${plugin}" "${ASDF_LATEST}"
#     asdf global "${plugin}" "${ASDF_LATEST}"
#     unset ASDF_LATEST
#   fi
# done
# }}}
# {{{ ranger cd
function rcd {
    # create a temp file and store the name
    tempfile="$(mktemp -t tmp.XXXXXX)"

    # run ranger and ask it to output the last path into the
    # temp file
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"

    # if the temp file exists read and the content of the temp
    # file was not equal to the current path
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        # change directory to the path in the temp file
        cd -- "$(cat "$tempfile")"
    fi

    # its not super necessary to have this line for deleting
    # the temp file since Linux should handle it on the next
    # boot
    rm -f -- "$tempfile"
}
# }}}
# {{{ Bash Preexec functions
function __tf_warning() {
  # are we running terraform?
  if grep -qE  "^terraform\ ?.*|make\ ?.*" <<< "$1"; then
    # do we have a session token?
    if env | grep -q ^AWS_SESSION_TOKEN;  then
      # is it valid for less than 25 minutes?
      if [ "$(awsexpires)" -lt 25 ]; then
        _profile="$(env | grep ^AWS_DEFAULT_PROFILE | awk -F= '{print $2}')"
        echo "[TERRAFORM] refreshing session token for ${_profile}"
        awseval "${_profile}"
      fi
    fi
  fi
}
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
export preexec_functions+=(__tf_warning)
# }}}
  eval "$(direnv hook bash)"
# }}}

