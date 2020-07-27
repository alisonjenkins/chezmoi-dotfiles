" Visual "{{{
set number  " Line numbers on
set relativenumber " and relative numbering too!
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set vb t_vb= " disable any beeps or flashes on error
set shortmess+=c
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
set cursorline

set nolist " Display unprintable characters f12 - switches

set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=10 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

set mouse=a   " Enable mouse
set mousehide  " Hide mouse after chars typed

set splitbelow
set splitright

" "}}}
