vim.o.backupdir = vim.fn.stdpath("data") .. "/backup" -- set backup directory to be a subdirectory of data to ensure that backups are not written to git repos
vim.o.directory = vim.fn.stdpath("data") .. "/directory" -- Configure 'directory' to ensure that Neovim swap files are not written to repos.
vim.o.undodir = vim.fn.stdpath("data") .. "/undo" -- set undodir to ensure that the undofiles are not saved to git repos.

-- ensure the above directories exist
vim.loop.fs_mkdir(vim.o.backupdir, 750)
vim.loop.fs_mkdir(vim.o.directory, 750)
vim.loop.fs_mkdir(vim.o.undodir, 750)

--vim.cmd("set guifont = \"FiraCode Nerd Font Mono:h15:b\"") -- Set the font used by vim GUIs
vim.cmd("set backup") -- enable backups so if Neovim crashes or you lose power you do not lose your work.
vim.cmd("set cmdheight=2") -- More space for displaying messages
vim.cmd("set colorcolumn=99999") -- fix indentline for now
vim.cmd("set completeopt=menu,menuone,noselect") -- Completeopt setting recommended by nvim-cmp docs.
vim.cmd("set conceallevel=0") -- So that I can see `` in markdown files
vim.cmd("set cursorline") -- Enable highlighting of the current line
vim.cmd("set expandtab") -- Converts tabs to spaces
vim.cmd("set guioptions-=e") -- Use showtabline in gui vim
vim.cmd("set hidden") -- Required to keep multiple buffers open multiple buffers
vim.cmd("set ignorecase") -- ignore case makes searching case insensitive by default. Overridable by using a capital letter thanks to smart case.
vim.cmd("set laststatus=3") -- only show one shared statusline
vim.cmd("set mouse=a") -- Enable your mouse
vim.cmd("set nowrap") -- Display long lines as just one line
vim.cmd("set number") -- set numbered lines
vim.cmd("set pumheight=10") -- Makes popup menu smaller
vim.cmd("set relativenumber") -- set relative numbered lines
vim.cmd("set sessionoptions+=tabpages,globals") -- store tabpages and globals in session
vim.cmd("set showtabline=2") -- Always show tabs
vim.cmd("set signcolumn=yes") -- Always show the signcolumn, otherwise it would shift the text each time
vim.cmd("set smartcase") -- smartcase makes it so that searching becomes case sensitive if you use a capital letter in the search.
vim.cmd("set smartindent") -- Makes indenting smart
vim.cmd("set sw=2") -- Set shiftwidth
vim.cmd("set t_Co=256") -- Support 256 colors
vim.cmd("set termguicolors") -- set term gui colors most terminals support this
vim.cmd("set timeoutlen=300") -- By default timeoutlen is 1000 ms
vim.cmd("set ts=2") -- Set tabstop
vim.cmd("set undofile") -- enable persistent undo (meaning if you quit Neovim and come back to a file and want to undo previous changes you can)
vim.cmd("set updatetime=300") -- Faster completion
vim.cmd("set writebackup") -- enable writing of the backup files
vim.cmd([[set spell]])

vim.cmd([[
try
colorscheme kanagawa
catch
colorscheme desert
endtry
]])

