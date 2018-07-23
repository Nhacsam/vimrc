

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set selection=inclusive
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled = 1
set signcolumn=yes
nmap ]g :GitGutterNextHunk<CR>
nmap [g :GitGutterPrevHunk<CR>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fzf : Global Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
nmap <leader>ll :ALENextWrap<CR>
nmap <leader>lo :ALEPreviousWrap<CR>

augroup VimDiff
  autocmd!
  autocmd VimEnter,FilterWritePre * if &diff | ALEDisable | endif
augroup END

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint', 'prettier_eslint', 'standard'],
\   'php': ['php_cs_fixer']
\}
let g:ale_linters = {
\   'javascript': ['htmlhint', 'tsserver', 'eslint', 'flow', 'standard' ],
\   'php': ['php-cs']
\}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UtilsSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim_runtime/UltiSnips']
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-J>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'

let g:airline_section_z = "%p%% : \ue0a1:%l/%L: Col:%c"
