mkdir -p ~/.local/share/zinit
test -d ~/.local/share/zinit/bin || git clone https://github.com/zdharma/zinit.git ~/.local/share/zinit/bin

# Configure zinit
declare -A ZINIT
ZINIT[BIN_DIR]=~/.local/share/zinit/bin
ZINIT[HOME_DIR]=~/.local/share/zinit

source ~/.local/share/zinit/bin/zinit.zsh

export _ZL_MATCH_MODE=1

zinit ice depth=1; zinit light romkatv/powerlevel10k

# Setup direnv
zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

# Plugins
zinit load Aloxaf/fzf-tab
zinit load alanjjenkins/asdf.plugin.zsh
zinit load alanjjenkins/kube-aliases
zinit load fabiokiatkowski/exercism.plugin.zsh
zinit load joepvd/zsh-hints
zinit load macunha1/zsh-terraform
zinit load molovo/tipz
zinit load zsh-users/zsh-completions

zinit light zinit-zsh/z-a-rust
zinit ice rustup cargo'zoxide' as"command" pick"bin/zoxide"
zinit load zdharma/null
eval "$(zoxide init zsh)"

zinit snippet 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/aws/aws.plugin.zsh'
zinit snippet 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/command-not-found/command-not-found.plugin.zsh'

# Sort completion out
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# For postponing loading `fzf`
zinit ice lucid wait
zinit snippet OMZP::fzf

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
