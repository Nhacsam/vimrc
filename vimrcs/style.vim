
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme peaksea
set background=dark

let IS_TERMINAL = $IS_TERMINAL == 'true'
let IS_FONT_INSTALLED = $IS_FONT_INSTALLED == 'true'

function! s:base16_customize() abort
  call Base16hi("xmlEndTag"           ,g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
  call Base16hi("xmlTag"              ,g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
  call Base16hi("xmlTagName"          ,g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
  call Base16hi("xmlAttrib"           ,g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
  call Base16hi("jsArrowFunction"     ,g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
  call Base16hi("jsFlowTypeStatement" ,g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
  call Base16hi("jsFlowDefinition"    ,g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
  call Base16hi("jsFlowNoise"         ,g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
  call Base16hi("jsFlowType"          ,g:base16_gui09, "", g:base16_cterm09, "", "", "")
  call Base16hi("jsFlowDeclareBlock"  ,g:base16_gui0D, "", g:base16_cterm0D, "", "", "")
  call Base16hi("jsFlow9rrow9rguments",g:base16_gui05, "", g:base16_cterm05, "", "", "")
  call Base16hi("jsFlowObject"        ,g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
  call Base16hi("Visual"              ,"", g:base16_gui03, "", g:base16_cterm03, "", "" )

  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Title'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'Label'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Label'],
    \ 'pointer': ['fg', 'Special'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Special'],
    \ 'header':  ['fg', 'Title'] }
endfunction


if IS_TERMINAL 
  source ~/.vimrc_background
  let g:airline_theme='base16'

elseif filereadable(expand("~/.vimrc_background"))

  let base16colorspace=256
  source ~/.vimrc_background

  let g:airline_theme='base16_shell'
  let g:airline#extensions#tmuxline#snapshot_file = "~/.tmux-statusline-colors.conf"

  call s:base16_customize()
  augroup on_change_colorschema
    autocmd!
    autocmd ColorScheme * call s:base16_customize()
  augroup END

else
  colorscheme gruvbox
  let g:airline_theme='gruvbox'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if IS_FONT_INSTALLED
  let g:airline_powerline_fonts = 1
endif


"""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:LanguageClient_diagnosticsDisplay = {
    \     1: {
    \         "name": "Error",
    \         "texthl": "ALEError",
    \         "signText": "✗",
    \         "signTexthl": "ALEErrorSign",
    \     },
    \     2: {
    \         "name": "Warning",
    \         "texthl": "ALEWarning",
    \         "signText": "▲",
    \         "signTexthl": "ALEWarningSign",
    \     },
    \     3: {
    \         "name": "Information",
    \         "texthl": "ALEInfo",
    \         "signText": "ℹ",
    \         "signTexthl": "ALEInfoSign",
    \     },
    \     4: {
    \         "name": "Hint",
    \         "texthl": "ALEInfo",
    \         "signText": "➤",
    \         "signTexthl": "ALEInfoSign",
    \     },
    \ }

highlight link ALEWarningSign Todo
highlight link ALEErrorSign Exception
highlight link ALEWarning Search
highlight link ALEError Error


" " a little more informative version of the above
nmap <Leader>s :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
