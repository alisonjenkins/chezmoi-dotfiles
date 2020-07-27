" General
set autowrite  " Writes on make/shell commands
set ttyfast     " Improves terminal redraw
set lazyredraw  " redraw only when we need to.
set ttimeoutlen=100 " the time in milliseconds for a key sequence to complete.
set nocompatible  " disable vi compatibility.
set pastetoggle=<F10> "  toggle between paste and normal: for 'safer' pasting from keyboard
set path+=**
set tags=./tags;$HOME " walk directory tree upto $HOME looking for tags
set timeoutlen=600  " Time to wait after ESC (default causes an annoying delay)
let &t_ut='' " Disable background colour erase
set cmdheight=2 " Give more space for displaying messages. (Recommended by COC)
set updatetime=300 " " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c " Don't pass messages to |ins-completion-menu|.

" Backup
set nowritebackup
set nobackup
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

" Buffers
set hidden      " The current buffer can be put to the background without writing to disk

" Restore undo tree upon reopening a file
set undofile

" Match and search
set hlsearch    " highlight search
set incsearch   " Incremental search
set ignorecase  " Do case in sensitive matching with
set smartcase   " be sensitive when there's a capital letter

" Don't automatically add newlines to end of file:
set nofixeol
set noeol

" Completion
set omnifunc=syntaxcomplete#Complete
