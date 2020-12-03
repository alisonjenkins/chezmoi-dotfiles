" Plugins " {{{
function! s:downloadUnicode()
  execute '!curl http://www.unicode.org/Public/UNIDATA/UnicodeData.txt -o ~/.local/share/nvim/site/unicode/UnicodeData.txt'
endfunction

filetype off
call plug#begin()
" {{{ Syntax plugins
if executable('task')
  Plug 'farseer90718/vim-taskwarrior', {'on': ['TW', 'TWUndo', 'TWEditTaskrc', 'TWEditVitrc', 'TWDeleteCompleted', 'TWAdd', 'TWAnnotate', 'TWComplete', 'TWDelete', 'TWDeleteAnnotation', 'TWModifyInteractive', 'TWReportInfo', 'TWSync', 'TWToggleReadonly', 'TWToggleHLField', 'TWHistory', 'TWHistoryClear', 'TWBookmark', 'TWBookmarkClear']} " Task warrior syntax support.
  " Plug 'tbabej/taskwiki'                        " Taskwiki format (integrates with Task warrior (depends on it)).
endif
Plug 'aaronbieber/vim-quicktask'                                     " A task / project management plugin for Vim.
Plug 'burnettk/vim-angular', {'for': 'javascript'}                   " AngularJS syntax support
Plug 'chrisyip/Better-CSS-Syntax-for-Vim', {'for':'css'}             " Adds CSS3 syntax support.
Plug 'dbeniamine/todo.txt-vim', {'for': 'todo'}                      " todo.txt syntax plugin for vim.
Plug 'digitaltoad/vim-pug'                                           " Pug templating engine syntax support.
Plug 'fatih/vim-go'                                                  " Golang syntax.
Plug 'lervag/vimtex'                                                 " Adds Syntax and completion for Latex
Plug 'luochen1990/rainbow'                                           " Adds 'rainbow' parenthesis (colour codes them to easier see matching pairs)
Plug 'mhinz/vim-hugefile'                                            " Disables Filetype autocmds, syntax highlighting, folding, swapfiles, MatchParen for files bigger than 2MB to ensure that Vim opens them quickly.
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'} " Syntax for various Javascript libraries (to allow completion)
Plug 'sheerun/vim-polyglot'                                          " Syntax files for many different languages
Plug 'tmhedberg/SimpylFold', {'for': 'python'}                       " simple, correct folding for Python.
Plug 'gabrielelana/vim-markdown', {'for': 'markdown'}                " Syntax for Markdown.
Plug 'vim-scripts/jQuery', {'for': 'javascript'}                     " Adds syntax support for JQuery.
Plug 'wting/cheetah.vim'                                             " Cheetah templating syntax support.
" }}}
" {{{ Git plugins
Plug 'christoomey/vim-conflicted'    " Aids in resolving merge conflicts.
Plug 'gregsexton/gitv'               " Extension to fugitive to see the git branching history.
Plug 'int3/vim-extradite'            " Extension to fugitive that adds a git commit browser.
Plug 'junegunn/gv.vim'               " A git log viewer.
Plug 'mattn/gist-vim'                " Adds :Gist command for creating a Github gist from the current buffer or selected text.
Plug 'mhinz/vim-signify'             " adds a +-~ to the gutter where things have been changed from what the vcs is aware.
Plug 'rhysd/committia.vim'           " Improved commit message window.
Plug 'shumphrey/fugitive-gitlab.vim' " This plugin allows you to use it with https://gitlab.com or your own private gitlab instance.
Plug 'tommcdo/vim-fubitive'          " Extend fugitive.vim to support Bitbucket URLs in :Gbrowse.
Plug 'tpope/vim-fugitive'            " Adds git integration to Vim. Many commands are added but :Gwrite is mapped to F1 and :Gcommit is mapped to F2.
Plug 'tpope/vim-rhubarb'             " Adds support for Github to Fugitive's Gbrowse command.
" }}}
" {{{ Gamified Vim Practice
" Plug 'ThePrimeagen/vim-be-good'   " Practice for jumping to lines Type :VimBeGood (Might need to run :UpdateRemotePlugins first)
" }}}
" {{{ File / directory navigation plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons for nvim-tree
Plug 'kyazdani42/nvim-tree.lua'
" }}}
" {{{ Buffer navigation plugins
Plug 'Lokaltog/vim-easymotion' " Adds extra motions
Plug 'google/vim-searchindex'  " Adds search indexing (match x of x when searching)
" }}}
" {{{ Snippet and completion plugins
" Plug 'neoclide/coc.nvim', {'branch': 'release'}                       " Intellisense completion engine for Vim and Neovim.
Plug 'SirVer/ultisnips'                                                 " snippets engine that integrates with completion-nvim
Plug 'aca/completion-tabnine', { 'do': './install.sh' }                 " Tabnine completion for completion-nvim
Plug 'alanjjenkins/ultisnips-terraform-snippets', {'for': 'terraform' } " terraform snippets for ultisnips.
Plug 'honza/vim-snippets'                                               " Snippets for various programming languages in Ultisnips and snipmate format.
Plug 'juliosueiras/vim-terraform-completion', {'for': 'terraform' }     " Auto completion for terraform.
Plug 'matthewsimo/angular-vim-snippets', {'for':'javascript'}           " Adds AngularJS vim snippets.
Plug 'myhere/vim-nodejs-complete', {'for':'javascript'}                 " Nodejs omnicompletion support.
Plug 'neovim/nvim-lsp'                                                  " Configuration for the inbuilt Neovim LSP.
Plug 'neovim/nvim-lspconfig'                                            " Configuration for the inbuilt Neovim LSP.
Plug 'nvim-lua/completion-nvim'                                         " Completion system that works with the Neovim LSP
Plug 'scrooloose/snipmate-snippets'                                     " A collection of Snipmate snippets.
" }}}
" {{{ Vim colour themes and appearance plugins
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " highlights colour descriptions in CSS files with the colour they will create.
Plug 'Yggdroot/indentLine'                                " adds indentation lines showing the different indentation levels.
Plug 'chriskempson/base16-vim'                            " Adds base16 colour scheme support to Vim
Plug 'jszakmeister/vim-togglecursor'                      " Handles changing the cursor shape while taking into account things that can break it.
Plug 'itchyny/lightline.vim'                              " Adds a pretty and useful Vim status line (more minimal than Airline).
" }}}
" {{{ External tool integration
Plug 'hashivim/vim-terraform', {'for': 'terraform' } " Allows running Terraform from inside Vim
Plug 'lambdalisue/suda.vim'                          " Add support for writing to root owned files using sudo
Plug 'markcornick/vim-vagrant', {'on': ['Vagrant'] } " Adds :Vagrant command for interacting with Vagrant from within Vim.
Plug 'tmux-plugins/vim-tmux-focus-events'            " Focus gained and focus lost (used by plugins) do not work in Tmux, this fixes that.
Plug 'tpope/vim-eunuch'                              " Adds support for many unix commands into Vim (too many commands added to list here).
Plug 'tpope/vim-tbone', {'on': 'Tmux'}               " Adds tmux support to Vim (:Tmux for running any tmux command, :Tyank for yanking to Tmux's clipboard, :Tput for pasting from Tmux's clipboard and more).
Plug 'vim-vdebug/vdebug'                             " Multi programming language debugging in Vim.
" }}}
" {{{ Text / code editing
Plug 'bronson/vim-trailing-whitespace'                                                                                                                                          " Highlights trailing whitespace in red, adds :FixWhitespace command to strip.
Plug 'chiel92/vim-autoformat'                                                                                                                                                   " Automatic code formatting
Plug 'chrisbra/unicode.vim', {'on': ['Digraphs', 'UnicodeSearch', 'UnicodeSearch!', 'UnicodeName', 'UnicodeTable', 'DownloadUnicode', 'UnicodeCache'], 'do': 'downloadUnicode'} " Allow easy searching of unicode characters to insert them.
                                                                                                                                                                                " , do: 'curl http://www.unicode.org/Public/UNIDATA/UnicodeData.txt -o '
Plug 'claco/jasmine.vim'                                                                                                                                                        " Runs Javascript Jasmine tests.
Plug 'dense-analysis/ale'                                                                                                                                                       " Asyncronous linting engine (does linting and sytnax checking of source code while you edit it).
Plug 'editorconfig/editorconfig-vim'                                                                                                                                            " Adds EditorConfig https://editorconfig.org/ support to vim.
Plug 'godlygeek/tabular', {'on': ['Tabularize', 'AddTabularPattern', 'AddTabularPipeline']}                                                                                     " Plugin for aligning text.
Plug 'kkoomen/vim-doge'                                                                                                                                                         " DOcumentation GEnerator. Mappings <Leader>D
Plug 'lukaszb/vim-web-indent', {'for': ['javascript', 'html'] }                                                                                                                 " Auto indentation support for Javascript and HTML.
Plug 'masukomi/vim-markdown-folding', { 'for': 'markdown' }                                                                                                                     " Add folding support to markdown
Plug 'mattn/emmet-vim', {'for': ['html', 'javascript']}                                                                                                                         " Allows you to write abbreviated HTML and then when a trigger key combo is pressed expand to full length html (key combo is C-y).
Plug 'psf/black', {'tag': '19.10b0', 'for': 'python'}                                                                                                                           " Automatic Python code formatter
Plug 'reedes/vim-pencil'                                                                                                                                                        " For editing prose-oriented file types such as text, markdown, mail, rst, tex, textile, and asciidoc
Plug 'rhysd/vim-fixjson', {'for': 'json'}                                                                                                                                       " Nicely formats JSON and fixes common JSON mistakes (missing commas in arrays... etc)
Plug 'rstacruz/vim-hyperstyle', {'for':'css'}                                                                                                                                   " Adds shortcuts for quickly writing CSS.
Plug 'tommcdo/vim-exchange'                                                                                                                                                     " Easy text exchange operator for vim use cx{motion} to initiate exchange. Go to what you want to exchange and do the same and they will be swapped.
Plug 'tpope/vim-commentary'                                                                                                                                                     " Commenting plugin, use gcc to comment out a line. gc and then a motion to comment out that area.
Plug 'tpope/vim-cucumber'                                                                                                                                                       " Adds support for the Cucumber Ruby acceptance testing framework to Vim.
Plug 'tpope/vim-endwise'                                                                                                                                                        " Intelligently ends certain structures automatically if you did not close them manually.
Plug 'tpope/vim-scriptease'                                                                                                                                                     " A Vim plugin to help with creating Vim Plugins.
Plug 'tpope/vim-sleuth'                                                                                                                                                         " Heuristically sets the indent level for the file based on the existing indentation within the file.
Plug 'vim-scripts/Align', {'on': 'Align' }                                                                                                                                      " Adds an Align command for aligning based on a character for example select text you want to align and then run ( :'<,'>Align = ) to align the lines by their '=' sign. See :help align.
Plug 'vim-scripts/DrawIt', {'on': 'DrawIt'}                                                                                                                                     " Drawit allows you to draw ascii art using Vim. Useful for making textual diagrams. See :help drawit.
Plug 'vim-scripts/VOoM', {'on': 'Voom'}                                                                                                                                         " Vim Outliner of Markups. Allows you to create outlines of code and markup files.
Plug 'vimoutliner/vimoutliner'                                                                                                                                                  " Adds an outliner to vim for planning things out.
Plug 'vimwiki/vimwiki'                                                                                                                                                          " Adds Vim wiki for taking notes (use <Space>ww to open) see :help vimwiki.
Plug 'michal-h21/vim-zettel'                                                                                                                                                    " Implements ideas from the Zettelkasten method into Vimwiki.
" Plug 'michal-h21/vimwiki-sync'                                                                                                                         " Syncs vimwiki to a configured git repository and auto commits changed files.
" }}}
" {{{ Vim functionality improvements

Plug 'Shougo/vimproc.vim', {'do' : 'make'}                                                                          " asynchronous execution plugin for Vim.
Plug 'alanjjenkins/vim-lf', {'branch': 'ajj/lfcd'}                                                                  " LF is a Ranger like file manager written in Golang which is much faster than Ranger.
Plug 'ciaranm/securemodelines'                                                                                      " Makes modelines secure without disabling them. See https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
Plug 'diepm/vim-rest-console'                                                                                       " Adds the ability to use Vim as a REST client. Requires cURL.
Plug 'dyng/ctrlsf.vim'                                                                                              " An ack/ag/pt/rg powered code search and view tool, takes advantage of Vim 8's power to support asynchronous searching, and lets you edit file in-place with Edit Mode.
Plug 'haya14busa/is.vim'                                                                                            " Improves incremental searching in Vim.
Plug 'haya14busa/vim-operator-flashy'                                                                               " Adds a temporary highlight of what text was yanked.
Plug 'kana/vim-operator-user'                                                                                       " Dependency of vim-operator-flashy.
Plug 'kshenoy/vim-signature'                                                                                        " Enhanced vim mark support (adds gutter icons for marks and extra mappings).
Plug 'machakann/vim-sandwich'                                                                                       " Adds mappings to work with surrounding quotes / tags / parenthesis / more.
Plug 'majutsushi/tagbar'                                                                                            " Adds a tagbar for exhuberant ctags command is :TagbarToggle (mapped to F8 key).
Plug 'mbbill/undotree'                                                                                              " Adds :UndotreeToggle command to enable you to visualise your undo history and the changes you have made to the file (mapped to F5).
Plug 'mhinz/vim-startify'                                                                                           " Adds Startify which is a nice startup screen for Vim with the most recently opened files.
Plug 'moll/vim-bbye'                                                                                                " Deals with closing buffers without closing the associated window or split (dependency of the LF plugin).
Plug 'mtth/scratch.vim', { 'on': [ 'Scratch', 'ScratchInsert', 'ScratchPreview', 'ScratchSelection'] }              " Adds the gs command to normal mode to open a scratch buffer (for making quick notes).
Plug 'powerman/vim-plugin-AnsiEsc'                                                                                  " ANSI colour code support (using for taskwiki).
Plug 'radenling/vim-dispatch-neovim'                                                                                " Adds support for neovim's async to vim-dispatch.
Plug 'simeji/winresizer'                                                                                            " Vim plugin for easy resizing of splits (https://github.com/simeji/winresizer).
Plug 'terryma/vim-expand-region'                                                                                    " Allows you to select more text in visual mode by repeatedly pressing 'v'.
Plug 'tpope/vim-dispatch'                                                                                           " Run vim commands asynchronously.
Plug 'tpope/vim-obsession'                                                                                          " Automatic vim session saving plugin.
Plug 'tpope/vim-repeat'                                                                                             " Adds repeat ('.') support to various plugins.
Plug 'tpope/vim-rsi'                                                                                                " Adds Readline shortcuts to vim command mode.
Plug 'tpope/vim-sensible'                                                                                           " Vim sensible defaults (allows you to delete a huge amount of stuff from your Vimrc).
Plug 'tpope/vim-speeddating'                                                                                        " Improves the CTRL-A and CTRL-X increment and decrement shortcuts to work with dates.
Plug 'tpope/vim-unimpaired'                                                                                         " Adds various mappings for, moving between files, buffers and toggling Vim options on and off (see :help unimpaired ).
Plug 'voldikss/vim-floaterm'
Plug 'xolox/vim-misc'                                                                                               " Dependency of vim-notes
Plug 'xolox/vim-notes', {'on': ['Note', 'NoteFromSelectedText', 'NoteToHTML', 'NoteToMarkdown', 'NoteToMediawiki']} " Adds :Note command to create a new note. The notes are automatically named and saved into a Notes directory in ~/Documents/Notes
if has('win32') || has('win64')
  Plug 'powerline/fonts', { 'do': './install.ps1' }
else
  Plug 'powerline/fonts', { 'do': './install.sh' }
endif

if has('mac')
  Plug 'tonsky/FiraCode', { 'do':  'cd distr/otf && find $(pwd) -name ''*.otf'' -type f -print0 \| xargs -0 -I{} ln -sf {} ~/Library/Fonts' }
endif
" " }}}
" {{{ End plugin initialisation
call plug#end()

if !vimPlugNOTInstalled
  PlugUpdate
endif
" " }}}
" }}}