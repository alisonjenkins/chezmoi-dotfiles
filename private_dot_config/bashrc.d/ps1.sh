# setup git ps1 prompt
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
PROMPT_DIRTRIM=2

PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

# }}}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# {{{ Direnv setup
eval "$(direnv hook bash)"
# }}}
