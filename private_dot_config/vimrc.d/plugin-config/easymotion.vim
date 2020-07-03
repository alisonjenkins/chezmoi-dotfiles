" easymotion

" Quick searching
" nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)

" Quick line jumping
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
