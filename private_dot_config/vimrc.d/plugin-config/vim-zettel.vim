" Filename format. The filename is created using strftime() function
let g:zettel_format = "%file_alpha-%title"

" command used for VimwikiSearch
" default value is "ag". To use other command, like ripgrep, pass the
" command line and options:
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "

" Disable default keymappings
let g:zettel_default_mappings = 0

" This is basically the same as the default configuration
augroup filetype_vimwiki
  autocmd!
  autocmd FileType vimwiki imap <silent> [[ [[<esc><Plug>ZettelSearchMap
  autocmd FileType vimwiki nmap T <Plug>ZettelYankNameMap
  autocmd FileType vimwiki xmap z <Plug>ZettelNewSelectedMap
  autocmd FileType vimwiki nmap gZ <Plug>ZettelReplaceFileWithLink
  autocmd FileType vimwiki nmap <Leader>wg <Plug>ZettelGenerateTags
  autocmd FileType vimwiki nmap <Leader>wi <Plug>ZettelInbox
  autocmd FileType vimwiki nmap <Leader>ws <Plug>ZettelOpen
  autocmd FileType vimwiki nmap <Leader>wll <Plug>ZettelGenerateLinks
  autocmd FileType vimwiki nmap <Leader>wbl <Plug>ZettelBacklinks
augroup END

" Set template and custom header variable for the second Wiki
let g:zettel_options = [{},{"front_matter" : {"tags" : ""}, "template" :  "~/mytemplate.tpl"}]
