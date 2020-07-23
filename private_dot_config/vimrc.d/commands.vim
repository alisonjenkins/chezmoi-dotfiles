" Command and Auto commands

" Save file with sudo
command! W SudoWrite

"Auto commands
au BufRead,BufNewFile *.quicktask                                     setf quicktask
au BufRead,BufNewFile *.ino                                           setlocal filetype=arduino
au BufRead,BufNewFile *.pde                                           setlocal filetype=arduino
au BufRead,BufNewFile {*.html}                                        setlocal ft=html
au BufRead,BufNewFile {*.jade}                                        setlocal ft=jade
au BufRead,BufNewFile {*.less}                                        setlocal ft=less
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         setlocal complete=.,w,b,u,t,kspell
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         setlocal ft=markdown
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         setlocal spell
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         setlocal wrap
au BufRead,BufNewFile {*.php}                                         setlocal ft=php
au BufRead,BufNewFile {*.taskpaper}                                   setlocal ft=taskpaper
au BufRead,BufNewFile {*.tex}                                         nnoremap <F2> :!make<CR>
au BufRead,BufNewFile {*.tick}                                        :AnsiEsc
au BufRead,BufNewFile {COMMIT_EDITMSG}                                setlocal complete=.,w,b,u,t,kspell
au BufRead,BufNewFile {COMMIT_EDITMSG}                                setlocal ft=gitcommit
au BufRead,BufNewFile {COMMIT_EDITMSG}                                setlocal spell
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     setlocal ft=ruby
au BufRead,BufNewFile */cloudformation/*.json                         setlocal filetype=aws.json
au BufRead,BufNewFile *.scss                                          setlocal tabstop=4 shiftwidth=4 softtabstop=4
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif " restore position in file
au FileType quicktask setlocal nocindent
au FileType puppet setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType json setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType javascript setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
