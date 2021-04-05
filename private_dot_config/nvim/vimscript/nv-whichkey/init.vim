" Leader Key Maps

" Timeout
let g:which_key_timeout = 100

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆', " ": 'SPC'}

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {}
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map['/'] = 'comment toggle'
let g:which_key_map[';'] = [ ':Dashboard'                                      , 'home screen' ]
let g:which_key_map[','] = [ '<Plug>(emmet-expand-abbr)'                       , 'expand tags' ]
let g:which_key_map['"'] = [ '<Plug>PeekupOpen'                                , 'registers' ]
let g:which_key_map['?'] = [ ':NvimTreeFindFile'                               , 'find current file' ]
let g:which_key_map['e'] = [ ':NvimTreeToggle'                                 , 'explorer' ]
let g:which_key_map['f'] = [ ':Telescope find_files'                           , 'find files' ]
let g:which_key_map['h'] = [ '<C-W>s'                                          , 'split below']
let g:which_key_map['M'] = [ ':MarkdownPreviewToggle'                          , 'markdown preview']
let g:which_key_map['h'] = [ ':let @/ = ""'                                    , 'no highlight' ]
let g:which_key_map['r'] = [ ':RnvimrToggle'                                   , 'ranger' ]
" TODO create entire treesitter section
let g:which_key_map['T'] = [ ':TSHighlightCapturesUnderCursor'                 , 'treesitter highlight' ]
let g:which_key_map['v'] = [ '<C-W>v'                                          , 'split right']
" TODO play nice with status line
let g:which_key_map['z'] = [ 'Goyo'                                            , 'zen' ]

" Group mappings

" . is for emmet
let g:which_key_map['.'] = {
      \ 'name' : '+emmet' ,
      \ ','    : ['<Plug>(emmet-expand-abbr)'            , 'expand abbr'],
      \ '/'    : ['<plug>(emmet-toggle-comment)'         , 'toggle comment'],
      \ ';'    : ['<plug>(emmet-expand-word)'            , 'expand word'],
      \ 'A'    : ['<plug>(emmet-anchorize-summary)'      , 'anchorize summary'],
      \ 'D'    : ['<plug>(emmet-balance-tag-outward)'    , 'balance tag out'],
      \ 'N'    : ['<plug>(emmet-move-prev)'              , 'move prev'],
      \ 'a'    : ['<plug>(emmet-anchorize-url)'          , 'anchorize url'],
      \ 'c'    : ['<plug>(emmet-code-pretty)'            , 'code pretty'],
      \ 'd'    : ['<plug>(emmet-balance-tag-inward)'     , 'balance tag in'],
      \ 'i'    : ['<plug>(emmet-image-size)'             , 'image size'],
      \ 'j'    : ['<plug>(emmet-split-join-tag)'         , 'split join tag'],
      \ 'k'    : ['<plug>(emmet-remove-tag)'             , 'remove tag'],
      \ 'm'    : ['<plug>(emmet-merge-lines)'            , 'merge lines'],
      \ 'n'    : ['<plug>(emmet-move-next)'              , 'move next'],
      \ 'u'    : ['<plug>(emmet-update-tag)'             , 'update tag'],
      \ }

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'L'    : [':BraceyStop'             , 'stop live server'],
      \ 'V'    : [':Codi!'                  , 'virtual repl off'],
      \ 'c'    : [':ColorizerToggle'        , 'colorizer'],
      \ 'h'    : [':let @/ = ""'            , 'remove search highlight'],
      \ 'i'    : [':IndentBlanklineToggle'  , 'toggle indent lines'],
      \ 'l'    : [':Bracey'                 , 'start live server'],
      \ 'n'    : [':set nonumber!'          , 'line-numbers'],
      \ 'r'    : [':set norelativenumber!'  , 'relative line nums'],
      \ 's'    : [':s/\%V\(.*\)\%V/"\1"/'   , 'surround'],
      \ 'v'    : [':Codi'                   , 'virtual repl on'],
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '<'    : [':BufferMovePrevious' , 'move prev'],
      \ '>'    : [':BufferMoveNext'     , 'move next'],
      \ '?'    : ['Buffers'             , 'fzf-buffer'],
      \ 'b'    : [':BufferPick'         , 'pick buffer'],
      \ 'd'    : [':BufferClose'        , 'delete-buffer'],
      \ 'n'    : ['bnext'               , 'next-buffer'],
      \ 'p'    : ['bprevious'           , 'previous-buffer'],
      \ }

" d is for debug
let g:which_key_map.d = {
      \ 'name' : '+debug' ,
      \ 'O'    : ['<Plug>VimspectorStepOut'              , 'step out'],
      \ 'R'    : ['<Plug>VimspectorRestart'              , 'restart'],
      \ 'b'    : ['<Plug>VimspectorToggleBreakpoint'     , 'toggle breakpoint'],
      \ 'c'    : ['<Plug>VimspectorRunToCursor'          , 'run to cursor'],
      \ 'f'    : ['<Plug>VimspectorStop'                 , 'stop'],
      \ 'i'    : ['<Plug>VimspectorStepInto'             , 'step into'],
      \ 'o'    : ['<Plug>VimspectorStepOver'             , 'step over'],
      \ 'p'    : ['<Plug>VimspectorPause'                , 'pause'],
      \ 'r'    : ['VimspectorReset'                      , 'reset'],
      \ 's'    : ['<Plug>VimspectorContinue'             , 'start / continue'],
      \ }


" F is for fold
let g:which_key_map.F = {
    \ 'name' :   '+fold',
    \ '1'    : [':set foldlevel=1' , 'level1'],
    \ '2'    : [':set foldlevel=2' , 'level2'],
    \ '3'    : [':set foldlevel=3' , 'level3'],
    \ '4'    : [':set foldlevel=4' , 'level4'],
    \ '5'    : [':set foldlevel=5' , 'level5'],
    \ '6'    : [':set foldlevel=6' , 'level6'],
    \ 'C'    : [':set foldlevel=0' , 'close all'],
    \ 'O'    : [':set foldlevel=20', 'open all'],
    \ 'c'    : [':foldclose'       , 'close'],
    \ 'o'    : [':foldopen'        , 'open'],
    \ }

" m is for mark
" I'd rather use regular marks but they never clear
let g:which_key_map.m = {
    \ 'name' : '+fold',
    \ 't'    :  [':BookmarkToggle', 'toggle'],
    \ 'j'    :  [':BookmarkNext', 'next mark'],
    \ 'k'    :  [':BookmarkPrev', 'prev mark']
    \ }

" s is for search powered by telescope
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '.'    : [':Telescope filetypes'                                        , 'filetypes'],
      \ 'B'    : [':Telescope git_branches'                                     , 'git branches'],
      \ 'D'    : [':Telescope lsp_workspace_diagnostics'                        , 'workspace_diagnostics'],
      \ 'M'    : [':Telescope man_pages'                                        , 'man_pages'],
      \ 'd'    : [':Telescope lsp_document_diagnostics'                         , 'document_diagnostics'],
      \ 'f'    : [':Telescope find_files'                                       , 'files'],
      \ 'h'    : [':Telescope command_history'                                  , 'history'],
      \ 'i'    : [':Telescope media_files'                                      , 'media files'],
      \ 'm'    : [':Telescope marks'                                            , 'marks'],
      \ 'o'    : [':Telescope vim_options'                                      , 'vim_options'],
      \ 'p'    : [':lua require''telescope''.extensions.project.project{}'      , 'projects'],
      \ 'r'    : [':Telescope registers'                                        , 'registers'],
      \ 't'    : [':Telescope live_grep'                                        , 'text'],
      \ 'u'    : [':Telescope colorscheme'                                      , 'colorschemes'],
      \ 'w'    : [':Telescope file_browser'                                     , 'buf_fuz_find'],
      \ }

" S is for Session
let g:which_key_map.S = {
      \ 'name' : '+Session' ,
      \ 'l'    : [':SessionLoad'           , 'load Session'],
      \ 's'    : [':SessionSave'           , 'save session'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'B'    : [':GBrowse'                          , 'browse'],
      \ 'a'    : [':Gwrite'                           , 'add'],
      \ 'b'    : [':Gblame'                           , 'blame'],
      \ 'c'    : [':Git commit'                       , 'commit'],
      \ 'd'    : [':Git diff'                         , 'diff'],
      \ 'l'    : [':Git log'                          , 'log'],
      \ 'p'    : [':Git push'                         , 'push'],
      \ 's'    : [':Gstatus'                          , 'status'],
      \ 't'    : [':!gh pr create --web'              , 'pull request'],
      \ }

" G is for gist
let g:which_key_map.G = {
      \ 'name' : '+gist' ,
      \ 'P'    : [':Gist -p'                          , 'post private gist '],
      \ 'a'    : [':Gist -a'                          , 'post gist anon'],
      \ 'b'    : [':Gist -b'                          , 'post gist browser'],
      \ 'd'    : [':Gist -d'                          , 'delete gist'],
      \ 'e'    : [':Gist -e'                          , 'edit gist'],
      \ 'l'    : [':Gist -l'                          , 'list public gists'],
      \ 'm'    : [':Gist -m'                          , 'post gist all buffers'],
      \ 'p'    : [':Gist -P'                          , 'post public gist '],
      \ 's'    : [':Gist -ls'                         , 'list starred gists'],
      \ }

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' :   '+lsp' ,
      \ 'A'    : [':Lspsaga range_code_action'          , 'selected action'],
      \ 'D'    : [':Telescope lsp_workspace_diagnostics', 'workspace diagnostics'],
      \ 'H'    : [':Lspsaga signature_help'             , 'signature_help'],
      \ 'I'    : [':LspInfo'                            , 'lsp info'],
      \ 'L'    : [':Lspsaga show_line_diagnostics'      , 'line_diagnostics'],
      \ 'S'    : [':Telescope lsp_workspace_symbols'    , 'workspace symbols'],
      \ 'T'    : [':LspTypeDefinition'                  , 'type defintion'],
      \ 'a'    : [':Lspsaga code_action'                , 'code action'],
      \ 'd'    : [':Telescope lsp_document_diagnostics' , 'document diagnostics'],
      \ 'f'    : [':LspFormatting'                      , 'format'],
      \ 'l'    : [':Lspsaga lsp_finder'                 , 'lsp finder'],
      \ 'o'    : [':Vista!!'                            , 'outline'],
      \ 'p'    : [':Lspsaga preview_definition'         , 'preview definition'],
      \ 'q'    : [':Telescope quickfix'                 , 'quickfix'],
      \ 'r'    : [':Lspsaga rename'                     , 'rename'],
      \ 's'    : [':Telescope lsp_document_symbols'     , 'document symbols'],
      \ 'v'    : [':LspVirtualTextToggle'               , 'lsp toggle virtual text'],
      \ 'x'    : [':cclose'                             , 'close quickfix'],
      \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';'    : [':FloatermNew --wintype=normal --height=6', 'terminal'],
      \ 'N'    : [':FloatermNew nnn'                        ,     'nnn'],
      \ 'd'    : [':FloatermNew lazydocker'                 ,     'docker'],
      \ 'f'    : [':FloatermNew fzf'                        ,     'fzf'],
      \ 'g'    : [':FloatermNew lazygit'                    ,     'git'],
      \ 'm'    : [':FloatermNew lazynpm'                    ,     'npm'],
      \ 'n'    : [':FloatermNew node'                       ,     'node'],
      \ 'p'    : [':FloatermNew python'                     ,     'python'],
      \ 't'    : [':FloatermToggle'                         ,     'toggle'],
      \ 'u'    : [':FloatermNew ncdu'                       ,     'ncdu'],
      \ 'y'    : [':FloatermNew bottom'                     ,     'bottom'],
      \ }

call which_key#register('<Space>', "g:which_key_map")
