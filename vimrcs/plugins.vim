

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
nmap ]g :GitGutterNextHunk<CR>
nmap [g :GitGutterPrevHunk<CR>

if v:version >= 800 || has('nvim')
  set signcolumn=yes
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive (Git integration)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>b :Gblame<cr> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fzf : Global Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.fzf


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Langage Client : Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

let g:deoplete#auto_complete_delay=150
let g:deoplete#file#enable_buffer_path = 1
set completeopt-=preview
let g:echodoc#enable_at_startup = 1

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:LanguageClient_autoStart = 1
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()<CR>

let g:LanguageClient_serverCommands = {
\ 'javascript': ['flow-language-server', '--stdio', 'try-flow-bin'],
\ 'javascript.jsx': ['flow-language-server', '--stdio', '--try-flow-bin'],
\ 'typescript': ['javascript-typescript-stdio'],
\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
\   'javascript': ['htmlhint', 'eslint', 'flow'],
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ACK
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
