""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/."
call pathogen#infect(s:vim_runtime.'/plugins/{}')
call pathogen#helptags()

source ~/.vim_runtime/vimrcs/functions.vim
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/plugins.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/shortcuts.vim
source ~/.vim_runtime/vimrcs/javascript.vim
source ~/.vim_runtime/vimrcs/style.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
