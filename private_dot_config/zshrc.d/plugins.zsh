mkdir -p ~/.local/share/zinit
test -d ~/.local/share/zinit/bin || git clone https://github.com/zdharma-continuum/zinit.git ~/.local/share/zinit/bin

# Configure zinit
declare -A ZINIT
ZINIT[BIN_DIR]=~/.local/share/zinit/bin
ZINIT[HOME_DIR]=~/.local/share/zinit

source ~/.local/share/zinit/bin/zinit.zsh

export _ZL_MATCH_MODE=1

zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
zinit load Aloxaf/fzf-tab
zinit load alanjjenkins/asdf.plugin.zsh
zinit load alanjjenkins/kube-aliases
zinit load fabiokiatkowski/exercism.plugin.zsh
zinit load joepvd/zsh-hints
zinit load macunha1/zsh-terraform
zinit load molovo/tipz
zinit load zsh-users/zsh-completions

if ! command -v zoxide &>/dev/null; then
        if command -v &>/dev/null; then
                cargo install zoxide
        fi
fi

eval "$(zoxide init zsh)"

# Setup direnv
eval "$(asdf exec direnv hook zsh)"

# A shortcut for asdf managed direnv.
direnv() { asdf exec direnv "$@"; }


zinit snippet 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/aws/aws.plugin.zsh'
zinit snippet 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/command-not-found/command-not-found.plugin.zsh'

# Sort completion out
# zinit wait lucid for \
 # atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    # zdharma-continuum/fast-syntax-highlighting \
 # blockf \
    # zsh-users/zsh-completions \
# atload"!_zsh_autosuggest_start" \
    # zsh-users/zsh-autosuggestions

# For postponing loading `fzf`
zinit ice lucid wait
zinit snippet OMZP::fzf

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
