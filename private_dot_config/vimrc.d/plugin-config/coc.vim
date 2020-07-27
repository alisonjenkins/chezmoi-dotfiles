" COC

" Install plugins
 " \'coc-tabnine',
let g:coc_global_extensions = [
 \'coc-browser',
 \'coc-css',
 \'coc-docker',
 \'coc-emmet',
 \'coc-eslint',
 \'coc-go',
 \'coc-highlight',
 \'coc-html',
 \'coc-lists',
 \'coc-marketplace',
 \'coc-prettier',
 \'coc-python',
 \'coc-rls',
 \'coc-sh',
 \'coc-snippets',
 \'coc-stylelint',
 \'coc-tslint',
 \'coc-tsserver',
 \'coc-vimtex',
 \'coc-yaml'
\]

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>cr  <Plug>(coc-rename)<cr>
nmap <silent> <leader>ce  :<C-u>CocList locationlist<cr>
nmap <silent> <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>g[ <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>g] <Plug>(coc-diagnostic-next-error)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" List errors

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Snippets
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
