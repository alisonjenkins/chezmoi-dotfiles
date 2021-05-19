mkdir -p ~/.local/share/zinit
test -d ~/.local/share/zinit/bin || git clone https://github.com/zdharma/zinit.git ~/.local/share/zinit/bin

# Configure zinit
declare -A ZINIT
ZINIT[BIN_DIR]=~/.local/share/zinit/bin
ZINIT[HOME_DIR]=~/.local/share/zinit

source ~/.local/share/zinit/bin/zinit.zsh

export _ZL_MATCH_MODE=1
zinit as"program"  \
    atpull'%atclone' pick"z.lua" src"z.lua.plugin.zsh" for \
        skywind3000/z.lua

# Setup direnv
zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

# Plugins
zinit load Aloxaf/fzf-tab
zinit load chriskempson/base16-shell
zinit load fabiokiatkowski/exercism.plugin.zsh
zinit load joepvd/zsh-hints

zinit load alanjjenkins/asdf.plugin.zsh
zinit load macunha1/zsh-terraform
zinit load molovo/tipz
zinit load romkatv/powerlevel10k
zinit load zsh-users/zsh-completions

zinit wait lucid for \
  Dbz/kube-aliases

zinit snippet 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/aws/aws.plugin.zsh'
zinit snippet 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/command-not-found/command-not-found.plugin.zsh'

# For postponing loading `fzf`
zinit ice lucid wait
zinit snippet OMZP::fzf

zinit ice lucid wait
zinit load softmoth/zsh-vim-mode

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
