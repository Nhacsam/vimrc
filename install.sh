#!/bin/sh
set -e

cd ~/.vim_runtime

echo '
set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrc.vim
' > ~/.vimrc

cp ~/.vimrc ~/.config/nvim/init.vim

echo "Installed  Vim configuration successfully! Enjoy :-)"
