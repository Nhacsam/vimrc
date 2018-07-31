if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif


augroup markdownspell
  autocmd Filetype markdown set spell spelllang=en_us
augroup END


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#

""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
au FileType gitcommit call setpos('.', [0, 1, 1, 0])

""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CSS section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


"""""""""""""""""""""""
" => PHP
""""""""""""""""""""""

let g:phpcomplete_mappings = {
  \ 'jump_to_def': ',f',
  \ }

let g:symfony_app_console_path= "bin/console"
let g:ale_php_cs_fixer_options= ' --rules=@Symfony'

" PHP ident with 4 spaces
au FileType php set shiftwidth=4
au FileType php  set tabstop=2
