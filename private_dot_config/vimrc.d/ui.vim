"{{{  Gui and theme options
if has('gui_running')
  set background=dark
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
else
  set background=dark
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://sunaku.github.io/vim-256color-bce.html
  set t_ut=
endif

" If base16 is in use make vim use the same colourscheme as the rest of the
" terminal
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" GUI Fonts " {{{
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Terminal:h14:cOEM
  elseif has("gui_win32")
    set guifont=Terminal:h14:cOEM
  endif
endif
" }}}
