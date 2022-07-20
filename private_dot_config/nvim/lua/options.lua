vim.o.backupdir = vim.fn.stdpath "data" .. "/backup" -- set backup directory to be a subdirectory of data to ensure that backups are not written to git repos
vim.o.directory = vim.fn.stdpath "data" .. "/directory" -- Configure 'directory' to ensure that Neovim swap files are not written to repos.
vim.o.undodir = vim.fn.stdpath "data" .. "/undo" -- set undodir to ensure that the undofiles are not saved to git repos.

-- ensure the above directories exist
vim.loop.fs_mkdir(vim.o.backupdir, 750)
vim.loop.fs_mkdir(vim.o.directory, 750)
vim.loop.fs_mkdir(vim.o.undodir, 750)

vim.cmd [[
set backup                             " enable backups so if Neovim crashes or you lose power you do not lose your work.
set cmdheight=2                        " More space for displaying messages
set colorcolumn=99999                  " fix indentline for now
set completeopt=menu,menuone,noselect  " Completeopt setting recommended by nvim-cmp docs.
set conceallevel=0                     " So that I can see `` in markdown files
set cursorline                         " Enable highlighting of the current line
set expandtab                          " Converts tabs to spaces
set guioptions-=e                      " Use showtabline in gui vim
set hidden                             " Required to keep multiple buffers open multiple buffers
set ignorecase                         " ignore case makes searching case insensitive by default. Overridable by using a capital letter thanks to smart case.
set laststatus=3                       " only show one shared statusline
set mouse=a                            " Enable your mouse
set nowrap                             " Display long lines as just one line
set number                             " set numbered lines
set pumheight=10                       " Makes popup menu smaller
set relativenumber                     " set relative numbered lines
set sessionoptions+=tabpages,globals   " store tabpages and globals in session
set showtabline=2                      " Always show tabs
set signcolumn=yes                     " Always show the signcolumn, otherwise it would shift the text each time
set smartcase                          " smartcase makes it so that searching becomes case sensitive if you use a capital letter in the search.
set spell                              " enable spell checking
set sw=2                               " Set shiftwidth
set t_Co=256                           " Support 256 colors
set termguicolors                      " set term gui colors most terminals support this
set timeoutlen=300                     " By default timeoutlen is 1000 ms
set ts=2                               " Set tabstop
set undofile                           " enable persistent undo (meaning if you quit Neovim and come back to a file and want to undo previous changes you can)
set updatetime=300                     " Faster completion
set writebackup                        " enable writing of the backup files

try
colorscheme kanagawa
catch
colorscheme desert
endtry

]]
