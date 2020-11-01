let g:coc_explorer_global_presets = {
\   'chezmoi-dotfiles': {
\     'root-uri': '~/.local/share/chezmoi/',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Use preset argument to open it
" nmap <Leader>ee :CocCommand explorer<CR>
" nmap <Leader>ed :CocCommand explorer --preset chezmoi-dotfiles<CR>
" nmap <Leader>ef :CocCommand explorer --preset floating<CR>

" List all presets
nmap <Leader>el :CocList explPresets<CR>

autocmd FileType coc-explorer set number relativenumber
