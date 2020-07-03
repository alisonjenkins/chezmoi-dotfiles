" Formatting
set fo-=o " Do not automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0     " Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set tabstop=2    " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)

set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

filetype indent plugin indent on             " Automatically detect file types.

" HTML Formatting
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,tbody,div,table,tr,p"

" PHP Formatting
let g:PHP_outdentphpescape = 1
let g:PHP_removeCRwhenUnix = 1
let g:PHP_outdentSLComments = 1
let g:PHP_default_indenting = 1
let g:PHP_vintage_case_default_indent = 1
