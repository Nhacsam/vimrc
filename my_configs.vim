
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol


set expandtab

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Show “invis2ble” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
" if exists("&relativenumber")
"   set relativenumber
"   au BufReadPost * set relativenumber
" endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Super fast window movement shortcuts
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Search for the word in the current dir
nmap <leader>R mo:Ack! "\b<cword>\b" <CR>

"""""""""""""""""""""
""" ABBREVIATIONS """
"""""""""""""""""""""
abbr conosle console
abbr comopnent component

" Debugging helpers
autocmd BufEnter *.js,*.ts iabbr xxx console.log('XXX',
autocmd BufEnter *.js,*.ts iabbr yyy console.log('YYY',
autocmd BufEnter *.js,*.ts iabbr zzz console.log('ZZZ',

""""""""""""
""" FZF """
"""""""""""
set rtp+=/usr/local/opt/fzf
map ; :Buffer<cr>
map <leader>j :GitFiles<cr>
map <leader>J :Files<cr>

" Fuzzy find path with ,gf (useful when a project uses absolute imports
map <Leader>gf :call fzf#vim#files('', {'options':'--query '.expand('<cfile>')})<CR>

""""""""""""""""""
""" GIT GUTTER """
""""""""""""""""""
let g:gitgutter_enabled = 1
set signcolumn=yes
nmap ]g :GitGutterNextHunk<CR>
nmap [g :GitGutterPrevHunk<CR>

"""""""""""
""" ALE """
"""""""""""
let g:ale_completion_enabled = 1
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\}

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

let g:ale_linter_aliases = {'jsx': ['html', 'javascript', 'css']}

let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
nmap <leader>ll :ALENextWrap<CR>
nmap <leader>lo :ALEPreviousWrap<CR>
augroup VimDiff
  autocmd!
  autocmd VimEnter,FilterWritePre * if &diff | ALEDisable | endif
augroup END
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

""""""""""""
""" FLOW """
""""""""""""

let g:flow#enable = 0
let g:flow#omnifunc = 1
let g:flow#timeout = 0.4

""""""""""""""""""
""" UtilsSnips """
""""""""""""""""""

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim_runtime/UltiSnips']
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-J>"