""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript setl nofen
au FileType javascript setl nocindent

""""""""""""""""""""""""""""""
" => Syntax Coloring
"""""""""""""""""""""""""""""""

let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

""""""""""""""""""""""""""""""
" => Shortcuts
""""""""""""""""""""""""""""""""
au FileType javascript imap <c-t> console.log();<esc>hi


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Debugging helpers
autocmd BufEnter *.js,*.ts iabbr xxx console.log('XXX',
autocmd BufEnter *.js,*.ts iabbr yyy console.log('YYY',
autocmd BufEnter *.js,*.ts iabbr zzz console.log('ZZZ',

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint', 'prettier_eslint', 'standard'],
\}
let g:ale_linters = {
\   'javascript': ['htmlhint', 'tsserver', 'eslint', 'flow', 'standard' ],
\}
let g:ale_linter_aliases = {'javascript.jsx': ['html', 'javascript']}

let g:ale_javascript_prettier_use_local_config = 1
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Flow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:flow#enable = 0
let g:flow#omnifunc = 1
let g:flow#timeout = 0.4
